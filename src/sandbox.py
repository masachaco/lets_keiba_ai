import psycopg2
import pandas as pd
from sklearn.model_selection import train_test_split
from imblearn.under_sampling import RandomUnderSampler
import lightgbm as lgb
import numpy as np
from sklearn.metrics import accuracy_score
def get_data():
    with psycopg2.connect(f"postgresql://postgres:keibadb@localhost:5432/pckeiba") as con:
        sql="""
            select
                TRIM(bamei, '\u3000') bamei,
                cast(se.umaban as integer) umaban,
                cast(kakutei_chakujun as integer) chakujun,
                CASE
                    WHEN cast(kakutei_chakujun as integer) = 1 THEN 1
                    ELSE 0
                END is_win,
                kishumei_ryakusho,
                cast(tansho_ninkijun as integer) ninki
            from
                jvd_ra ra
            left join
                jvd_se se
            on
                se.kaisai_nen = ra.kaisai_nen
                and se.kaisai_tsukihi = ra.kaisai_tsukihi
                and se.keibajo_code = ra.keibajo_code
                and se.race_bango = ra.race_bango
            where
                ra.keibajo_code = '06'
                and ra.kyori = '1800'
                -- 芝
                -- and 10 <= cast(ra.track_code as integer) and cast(track_code as integer) <= 22
                -- ダート
                -- and (23 <= cast(ra.track_code as integer) and cast(track_code as integer) <= 26) or (cast(track_code as integer) == 29)
                and 2020 <= cast(ra.kaisai_nen as integer) and  cast(ra.kaisai_nen as integer) <= 2023
                and cast(kakutei_chakujun as integer) > 0
                    """
        return pd.read_sql(sql, con)

def get_predict_data():
    with psycopg2.connect(f"postgresql://postgres:keibadb@localhost:5432/pckeiba") as con:
        sql="""
            select
                TRIM(bamei, '\u3000') bamei,
                cast(se.umaban as integer) umaban,
                cast(kakutei_chakujun as integer) chakujun,
                CASE
                    WHEN cast(kakutei_chakujun as integer) = 1 THEN 1
                    ELSE 0
                END is_win,
                kishumei_ryakusho,
                cast(tansho_ninkijun as integer) ninki
            from
                jvd_ra ra
            left join
                jvd_se se
            on
                se.kaisai_nen = ra.kaisai_nen
                and se.kaisai_tsukihi = ra.kaisai_tsukihi
                and se.keibajo_code = ra.keibajo_code
                and se.race_bango = ra.race_bango
            where
                ra.kaisai_nen = '2024'
                and ra.kaisai_tsukihi = '1208'
                and ra.keibajo_code = '06'
                and ra.race_bango = '03'
                    """
        return pd.read_sql(sql, con)

def learn(dataset):

    dataset.reset_index(drop=True, inplace=True)
    train_set, test_set = train_test_split(dataset, test_size=0.2, random_state=0)

    X_train = train_set.drop('is_win', axis=1)
    y_train = train_set['is_win']

    #モデル評価用データを説明変数データ(X_test)と目的変数データ(y_test)に分割
    X_test = test_set.drop('is_win', axis=1)
    y_test = test_set['is_win']

    # ===================================
    # １着と、ソレ以外のデータ数の比率がおなじになるようにする
    from imblearn.under_sampling import RandomUnderSampler
    positive_count_train = len(train_set.query("is_win == 1"))
    sapling_strategy = {
        0: int(positive_count_train),
        1: int(positive_count_train),
    }
    rus = RandomUnderSampler(random_state=1090, sampling_strategy = sapling_strategy)  
    X_train, y_train = rus.fit_resample(X_train, y_train)
    # ===================================

    # 学習に使用するデータを設定
    lgb_train = lgb.Dataset(X_train, y_train)
    lgb_eval = lgb.Dataset(X_test, y_test, reference=lgb_train)



    params = {
            'task': 'train',
            'boosting_type': 'gbdt',
            'objective': 'binary',
            'metric': {'logloss'},
    }

    model = lgb.train(params,
            train_set=lgb_train, # トレーニングデータの指定
            valid_sets=lgb_eval, # 検証データの指定
    )
    #予測の実行と書き出し
    pred_prob = model.predict(X_test)

    pred = list(map(lambda x: 1 if x >= 0.5 else 0, pred_prob))
    print("テストデータ中の1着の数：",len(list(filter(lambda d: d == 1, y_test.values))))
    print("テストデータ中の着外の数：",len(list(filter(lambda d: d == 0, y_test.values))))
    print("=====")
    print(pred)
    #モデル評価
    acc = accuracy_score(y_test, pred)
    print('accuracy_score :', acc)

    return model

data = get_data()
learn(data[["ninki", "umaban", "is_win"]])