import os
from supabase import create_client

url = 'https://hounnukwmmwtefzlcmgr.supabase.co'
key = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImhvdW5udWt3bW13dGVmemxjbWdyIiwicm9sZSI6ImFub24iLCJpYXQiOjE3Nzc2ODUzMTgsImV4cCI6MjA5MzI2MTMxOH0.corGgJHJ7hZG3Q4Tn6v5akC1S-f1jPSQiBdCUQid2K0'

def check_db():
    print(f"Connecting to {url}...")
    try:
        supabase = create_client(url, key)
        result = supabase.table('sessions').select('id').limit(1).execute()
        print("✅ SUCCESS: 'sessions' table found.")
        print(result)
    except Exception as e:
        print(f"❌ FAIL: {e}")

if __name__ == "__main__":
    check_db()
