import snowflake.snowpark as snowpark
from snowflake.snowpark.functions import col,udf
import pandas as pd
import json
import os

def model(dbt, session):
    dbt.config(packages = ["xlrd"])
    filename = os.path.basename('@snowflakeinternalstage/Sample_Superstore.xls')
    staged_file = session.file.get('@snowflakeinternalstage/Sample_Superstore.xls', "/tmp")
    file_path = f"/tmp/{filename}"
    colnames = ['RETURNED', 'ORDERID']
    excel_data_df = pd.read_excel(file_path,sheet_name='Returns',names=colnames)
    return excel_data_df


# This part is user provided model code
# you will need to copy the next section to run the code
# COMMAND ----------
# this part is dbt logic for get ref work, do not modify

def ref(*args, **kwargs):
    refs = {}
    key = '.'.join(args)
    version = kwargs.get("v") or kwargs.get("version")
    if version:
        key += f".v{version}"
    dbt_load_df_function = kwargs.get("dbt_load_df_function")
    return dbt_load_df_function(refs[key])


def source(*args, dbt_load_df_function):
    sources = {}
    key = '.'.join(args)
    return dbt_load_df_function(sources[key])


config_dict = {}


class config:
    def __init__(self, *args, **kwargs):
        pass

    @staticmethod
    def get(key, default=None):
        return config_dict.get(key, default)

class this:
    """dbt.this() or dbt.this.identifier"""
    database = "COMMEXEC_DEV"
    schema = "DBT_DEV"
    identifier = "returns"
    
    def __repr__(self):
        return 'COMMEXEC_DEV.DBT_DEV.returns'


class dbtObj:
    def __init__(self, load_df_function) -> None:
        self.source = lambda *args: source(*args, dbt_load_df_function=load_df_function)
        self.ref = lambda *args, **kwargs: ref(*args, **kwargs, dbt_load_df_function=load_df_function)
        self.config = config
        self.this = this()
        self.is_incremental = False

# COMMAND ----------

# To run this in snowsight, you need to select entry point to be main
# And you may have to modify the return type to text to get the result back
# def main(session):
#     dbt = dbtObj(session.table)
#     df = model(dbt, session)
#     return df.collect()

# to run this in local notebook, you need to create a session following examples https://github.com/Snowflake-Labs/sfguide-getting-started-snowpark-python
# then you can do the following to run model
# dbt = dbtObj(session.table)
# df = model(dbt, session)

