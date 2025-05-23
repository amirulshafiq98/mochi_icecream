import pandas as pd
from sqlalchemy import create_engine

# PostgreSQL connection details
db_user = 'postgres'
db_password = '97653441'  # Replace with your password
db_host = 'localhost'
db_port = '5432'
db_name = 'mochi_data'  # Replace with your database name

# Path to your Excel file
excel_file_path = 'c:/Users/amiru/Desktop/Mochi Flavours Sensory.xlsx'

# Name of the sheet you want to load (0 for the first sheet)
sheet_name = 0

# Name of the table you want to create in PostgreSQL
table_name = 'raw_panel_evaluations'

try:
    # Read the Excel file into a pandas DataFrame
    df = pd.read_excel(excel_file_path, sheet_name=sheet_name)

    # Create a SQLAlchemy engine to connect to PostgreSQL
    engine = create_engine(f'postgresql://{db_user}:{db_password}@{db_host}:{db_port}/{db_name}')

    # Load the DataFrame into PostgreSQL
    df.to_sql(table_name, engine, if_exists='replace', index=False)

    print(f"Data from '{excel_file_path}', sheet '{sheet_name}' loaded into '{table_name}' in PostgreSQL.")

except Exception as e:
    print(f"An error occurred: {e}")

finally:
    if 'engine' in locals() and engine:
        engine.dispose()