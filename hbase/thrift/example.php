<?php
require_once 'Thrift/requires.php';
require_once 'Hbase/Types.php';
require_once 'Hbase/Hbase.php';

class Hbase
{
    /**
     * @author chenliujin <liujin.chen@qq.com>
     * @since 2015-04-27
     */
    static public function getInstance()
    {
        static $client;

        if (empty($client)) {
            $transport = new TSocket('127.0.0.1', 9090);
            $transport->setSendTimeout(1000000);
            $transport->setRecvTimeout(100000000);
            $protocol = new TBinaryProtocol($transport);
            $client = new \Hbase\HbaseClient($protocol);
            $transport->open();
        }

        return $client;
    }
	
	/**
	 * @author chenliujin <liujin.chen@qq.com>
	 * @since 2015-04-27
	 */
	static public function getTableNames()
	{
		$client = self::getInstance();
		$ret = $client->getTableNames();
		
		print_r($ret);
	}

    /**
     * @author chenliujin <liujin.chen@qq.com>
     * @since 2015-04-27
     */
    static public function scannerOpenWithStop($tableName, $startRow, $stopRow, $columns, $attributes)
    {
        $client = self::getInstance();
        $scan = $client->scannerOpenWithStop('wa_page_load_time_main_page', 'www.chenliujin.com-index-2015-04-01', 'www.chenliujin.com-index-2015-04-30', array(), array());
        $arr = $client->scannerGetList($scan, 100);
        echo time() . "\n";
        //print_r($arr);
    }
	
	static public function scannerOpenWithPrefix()
	{
        $scan = $client->scannerOpenWithPrefix($table, 'www.chenliujin.com', array('column' => 'data'), array());
        $arr = $client->scannerGetList($scan, 100);
        print_r($arr);
	}
	
	static public function scannerOpenWithScan()
	{
        $scan = new \Hbase\TScan();
        $scan->filterString = "PrefixFilter('www.chenliujin.com')";
        $scan->filterString = "SingleColumnValueFilter('data', 'main_page', =, 'binary:index')";
        $scan->filterString = "PrefixFilter('www.chenliujin.com') AND SingleColumnValueFilter('data', 'main_page', =, 'binary:index')";
        $scan->filterString = "PrefixFilter('www.chenliujin.com') AND SingleColumnValueFilter('data', 'main_page', =, 'binary:index') AND SingleColumnValueFilter('data', 'created_at', >=, 'binary:2015-04-16') AND SingleColumnValueFilter('data', 'created_at', <=, 'binary:2015-04-17')";
        $scan = $client->scannerOpenWithScan($table, $scan, array());
        $arr = $client->scannerGetList($scan, 100);

        print_r($arr);
        exit;
	
	}
	
	/**
	 * @author chenliujin <liujin.chen@qq.com>
	 * @since 2015-04-27
	 */
	static public function filterList()
	{
		
	}

}