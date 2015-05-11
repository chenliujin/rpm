sqoop import \
    --connect jdbc:mysql://vm1/zencart --username db_user --password 123456 \
    --table orders \
    --hbase-table h_zencart_orders \
    --column-family data \
	--hbase-row-key date_purchased,orders_id \
    --hbase-create-table \
    --where "date_purchased>='2014-01-01 00:00:00' AND date_purchased<'2015-01-01 00:00:00'" \
    -m 1
