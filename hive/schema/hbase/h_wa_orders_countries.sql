CREATE EXTERNAL TABLE h_wa_orders_countries (
	key STRING,
	site STRING,
	created_at STRING,
	countries_name STRING,
	amount STRING
)
STORED BY 'org.apache.hadoop.hive.hbase.HBaseStorageHandler'
WITH SERDEPROPERTIES ("hbase.columns.mapping" = ":key, data:site, data:created_at, data:countries_name, data:amount")