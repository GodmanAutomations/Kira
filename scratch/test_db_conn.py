import psycopg2

def check_db():
    host = "db.hounnukwmmwtefzlcmgr.supabase.co"
    port = "5432"
    dbname = "postgres"
    user = "postgres"
    password = "@Supabase86"
    
    print(f"Connecting to {host}...")
    try:
        conn = psycopg2.connect(
            host=host,
            port=port,
            dbname=dbname,
            user=user,
            password=password
        )
        print("✅ SUCCESS: Connected to database.")
        conn.close()
    except Exception as e:
        print(f"❌ FAIL: {e}")

if __name__ == "__main__":
    check_db()
