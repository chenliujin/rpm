<?php
class RedisHelper
{

    public static $redisConnects;   //redis connects
    public $redisObj;   //self class
    public $host;  //redis host
    public $port; //redis port
    public $db;   //redis db

    public static function getInstance($host, $db, $port = '6379')
    {
        if (empty($host) || empty($port) || !is_numeric($db)) {
            throw new Exception("host:{$host},port:{$port},db:{$db} can not be empty!");
            return false;
        }

        $redisKey = $host . '_' . $port; //redis connect key  'eg:192.168.0.253_6379'

        //Single case
        if (empty(self::$redisConnects[$redisKey])) {
            self::$redisConnects[$redisKey] = new Redis();
            self::$redisConnects[$redisKey]->pconnect($host, $port);
        }
        $redis = self::$redisConnects[$redisKey];

        //Instance of of separate objects
        $instance = new self();
        $instance->host = $host;
        $instance->port = $port;
        $instance->db = $db;
        $instance->redisObj = $redis;

        return $instance;
    }

    //  interception of Redis　methods and  allowed to perform
    public function __call($funName, $params)
    {
        //Not allowed close operations
        if($funName=='close') {
            return ;
        }
        try {
            $this->redisObj->select($this->db);
            $obj = new ReflectionMethod($this->redisObj, $funName);
            return $obj->invokeArgs($this->redisObj, $params);   //invoke $funName
        } catch (Exception $e) {
            error_log('Redis Connect error:' . ($e->getMessage()) . ' FILE: ' . __FILE__ . ' LINE:' . __LINE__);
            return false;
        }
    }

}