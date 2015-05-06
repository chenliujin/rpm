CREATE EXTERNAL TABLE h_wa_orders (
	key STRING,
	site STRING,
	created_at STRING,
	amount STRING,
	orders_count STRING,
	customers_count STRING,
	created_week STRING,
	created_month STRING,
	created_year STRING
)
STORED BY 'org.apache.hadoop.hive.hbase.HBaseStorageHandler'
WITH SERDEPROPERTIES ("hbase.columns.mapping" = ":key, data:site, data:created_at, data:amount, data:orders_count, data:customers_count, data:created_week, data:created_month, data:created_year");
