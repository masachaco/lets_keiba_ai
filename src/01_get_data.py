import psycopg2
from psycopg2.extras import DictCursor

def get_data():
    with psycopg2.connect(f"postgresql://postgres:keibadb@localhost:5432/pckeiba") as conn:
        with conn.cursor(cursor_factory=DictCursor) as cur:
            sql="""
                select
                    *
                from
                    jvd_se
                limit 10
                        """
            cur.execute(sql)
            return cur.fetchall()

def main():
    display(get_data())

if __name__ == '__main__':
    main()