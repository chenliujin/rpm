CREATE EXTERNAL TABLE h_zencart_orders (
	key STRING,
	orders_id INT, 
	customers_id INT, 
	customers_name STRING, 
	customers_company STRING, 
	customers_street_address STRING, 
	customers_suburb STRING, 
	customers_city STRING, 
	customers_postcode STRING, 
	customers_state STRING, 
	customers_country STRING, 
	customers_telephone STRING, 
	customers_email_address STRING, 
	customers_address_format_id INT, 
	delivery_name STRING, 
	delivery_company STRING, 
	delivery_street_address STRING, 
	delivery_suburb STRING, 
	delivery_city STRING, 
	delivery_postcode STRING, 
	delivery_state STRING, 
	delivery_country STRING, 
	delivery_address_format_id INT, 
	billing_name STRING, 
	billing_company STRING, 
	billing_street_address STRING, 
	billing_suburb STRING, 
	billing_city STRING, 
	billing_postcode STRING, 
	billing_state STRING, 
	billing_country STRING, 
	billing_address_format_id INT,
	payment_method STRING, 
	payment_module_code STRING, 
	shipping_method STRING, 
	shipping_module_code STRING, 
	coupon_code STRING, 
	cc_type STRING, 
	cc_owner STRING, 
	cc_number STRING, 
	cc_expires STRING, 
	cc_cvv STRING, 
	last_modified STRING, 
	date_purchased STRING, 
	orders_status INT,
	orders_date_finished STRING, 
	currency STRING, 
	currency_value DOUBLE, 
	order_total DOUBLE, 
	order_tax DOUBLE, 
	paypal_ipn_id INT,
	ip_address STRING, 
	orders_tag STRING, 
	orders_from_country STRING, 
	orders_to_country STRING, 
	track_number STRING, 
	transaction_id STRING, 
	Oms_order_id INT,
	paypal_account STRING, 
	saler_id STRING, 
	store_module_id INT,
	is_packaged INT, 
	as_a_gift INT, 
	use_paypal_address INT,
	delivery_telephone STRING, 
	delivery_cpf STRING, 
	version_of_code STRING, 
	transportations_id INT,
	send_stored_products INT, 
	promote_referral STRING,
	purchased_at STRING
)
STORED BY 'org.apache.hadoop.hive.hbase.HBaseStorageHandler'
WITH SERDEPROPERTIES ("hbase.columns.mapping" = "
	:key, 
	data:orders_id, 
	data:customers_id,
	data:customers_name,
	data:customers_company,
	data:customers_street_address,
	data:customers_suburb,
	data:customers_city,
	data:customers_postcode,
	data:customers_state,
	data:customers_country,
	data:customers_telephone,
	data:customers_email_address,
	data:customers_address_format_id,
	data:delivery_name,
	data:delivery_company,
	data:delivery_street_address,
	data:delivery_suburb,
	data:delivery_city,
	data:delivery_postcode,
	data:delivery_state,
	data:delivery_country,
	data:delivery_address_format_id,
	data:billing_name,
	data:billing_company,
	data:billing_street_address,
	data:billing_suburb,
	data:billing_city,
	data:billing_postcode,
	data:billing_state,
	data:billing_country,
	data:billing_address_format_id,
	data:payment_method,
	data:payment_module_code,
	data:shipping_method,
	data:shipping_module_code,
	data:coupon_code,
	data:cc_type,
	data:cc_owner,
	data:cc_number,
	data:cc_expires,
	data:cc_cvv,
	data:last_modified,
	data:date_purchased,
	data:orders_status,
	data:orders_date_finished,
	data:currency,
	data:currency_value,
	data:order_total,
	data:order_tax,
	data:paypal_ipn_id,
	data:ip_address,
	data:orders_tag,
	data:orders_from_country,
	data:orders_to_country,
	data:track_number,
	data:transaction_id,
	data:Oms_order_id,
	data:paypal_account,
	data:saler_id,
	data:store_module_id,
	data:is_packaged,
	data:as_a_gift,
	data:use_paypal_address,
	data:delivery_telephone,
	data:delivery_cpf,
	data:version_of_code,
	data:transportations_id,
	data:send_stored_products,
	data:promote_referral,
	data:purchased_at
")
TBLPROPERTIES ("hbase.table.name" = "h_zencart_orders");