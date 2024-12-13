import psycopg2
from psycopg2.extras import DictCursor
import pandas as pd
def get_data():
    with psycopg2.connect(f"postgresql://postgres:keibadb@localhost:5432/pckeiba") as conn:
        sql="""
                select
                    *
                from
                    jvd_se
                limit 10"""
        return pd.read_sql(sql, conn)

def main():
    print(get_data())

if __name__ == '__main__':
    main()  