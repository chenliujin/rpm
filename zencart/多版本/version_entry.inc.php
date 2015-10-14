<?php

require 'version_config.inc.php';

$current_group = '';
$current_site = '';

$grouped_sites_all = simplexml_load_string($version_configs);
$grouped_sites_valid = array();
$site_routers = array();

//移除过期版本
foreach ($grouped_sites_all as $group) {
    $temp_group = (array) $group;
    $temp_group = $temp_group['@attributes'];
    $temp_group['weight'] = $temp_group['weight'] * 100;
    //移除过期的组
    if (!isset($temp_group['expires']) || time() < strtotime($temp_group['expires'])) {
        $valid_sites = array();
        //移除过期的版本
        foreach ($group as $site) {
            $temp_site = ((array) $site);
            $temp_site = $temp_site['@attributes'];
            if ((!isset($temp_site['expires']) || time() < strtotime($temp_site['expires'])) &&
                    (isset($temp_site['id']) && file_exists($temp_site['id']))
            ) {

                $temp_site['expires'] = min($temp_site['expires'], $temp_group['expires']);
                $temp_site['weight'] = $temp_site['weight'] * 100;
                //检查跳转目标是否存在，不存在则直接清空redirect_to数据
                if (isset($temp_site['redirect_to'])) {
                    $redirect_to = explode('@', $temp_site['redirect_to']);
                    $redirect_site = $redirect_to[0];
                    if (!file_exists($redirect_site)) {
                        $temp_site['redirect_to'] = NULL;
                    } else {
                        $from_site = empty($temp_group['id']) ? $temp_site['id'] : $temp_site['id'] . '@' . $temp_group['id'];
                        $site_routers[$from_site] = $temp_site['redirect_to'];
                    }
                }

                $valid_sites[] = $temp_site;
            }
        }

        if (count($valid_sites) > 0) {
            $temp_group = array_merge($temp_group, array('sites' => $valid_sites));
            $grouped_sites_valid[] = $temp_group;
        }
    }
}

//从cookie中读取用户上次访问的网站版本value格式 $current_site.''.$current_group - v20130728G1
$visited_site = @$_COOKIE['VISITED_SITE'];
if ($visited_site && version_exists($visited_site, TRUE, $grouped_sites_valid)) {
    explode_visited_site($visited_site, $current_site, $current_group);
} else {
    $visited_site = NULL;
}


//随机分配
if (!$visited_site || !file_exists($current_site)) {
    //获取分组
    $hit_group = NULL;
    $current_group = weighted_rand_ext($grouped_sites_valid, $hit_group);

    //分组内版本按权重分配
    $hit_site = NULL;
    $current_site = weighted_rand_ext($hit_group['sites'], $hit_site);

    $visited_site = empty($current_group) ? $current_site : $current_site . '@' . $current_group;
}
//处理redirect_to
if (!empty($site_routers) && array_key_exists($visited_site, $site_routers)) {
    $redirect_to = $site_routers[$visited_site];
    if (version_exists($redirect_to)) {
        $visited_site = $redirect_to;
        explode_visited_site($visited_site, $current_site, $current_group);
    }
}


//根据URL参数，强行使用指定版本 -  index.php?v=v20130710G2
$debugger_version = @$_GET['v'];

if ($debugger_version) { //$debugger_version && version_exists($debugger_version)
    explode_visited_site($debugger_version, $current_site, $current_group);
    $visited_site = $debugger_version;
    //处理输入错误的问题
    check_debugger_version($current_site);
}

if (is_crawler() && $version_for_crawler) {
    explode_visited_site($version_for_crawler, $current_site, $current_group);
    $visited_site = $version_for_crawler;
}

//根据请求的参数，识别是否为IPN通知
$is_ipn = TRUE;

$ipn_version = '';
$order_id = 0;
$order_tag = '';
//$_REQUEST['out_trade_no'] = '9810054401311000036566';
//paypal simple,paypal express checkout, global collect,webmoney,qiwi
if (isset($_REQUEST['ipn_version']) && $_REQUEST['ipn_version'] != '') {

    $ipn_version = $_REQUEST['ipn_version'];
    $is_ipn = FALSE;
} elseif (isset($_POST['md5']) && isset($_POST['orderNumber'])) {
    //yandex
    $order_id = (int) $_POST['orderNumber'];
} elseif (isset($_REQUEST['out_trade_no']) && $_REQUEST['out_trade_no'] != '') {
//alipay
    $order_tag = $_REQUEST['out_trade_no'];
} elseif (isset($_GET['type']) && $_GET['type'] == 'ebanx') {
    $is_ipn = FALSE;
}elseif(isset($_REQUEST['sRequest'])){
    $post = simplexml_load_string($_REQUEST['sRequest']);
    $order_id = $post->session_id; 
}elseif(@$_GET['type'] == 'qiwi_v2' && @$_REQUEST['bill_id']){
    $order_tag = $_REQUEST['bill_id'];
}
else {
    $is_ipn = FALSE;
}
if ($is_ipn == TRUE) {
    //如果是支付网关返回的结果请求，先尝试根据URL中参数，指定版本，这里假定传给ipn的自定义版本参数为ipn_version
    //paypal simple,paypal express checkout,webmoney,qiwi,gc
    if ($ipn_version == '') {
        //通过tag、orderid获取版本
        $ipn_version = get_ipn_version_by_tag($connection_string, $order_id, $order_tag);
    }
    //若版本不存在，则表示记录错误日志
   # if ($ipn_version == FALSE || ($ipn_version && !version_exists($ipn_version))) {
   #     //TODO; log to file.
   #     if (!$ipn_version) {
   #         $comment = 'Couldn\'t find version information'
   #                 . 'ipn_version:' . @$_REQUEST['ipn_version'] . ';order id:' . $order_id . ';order tag:' . $order_tag;
   #     } elseif ($ipn_version) {
   #         $comment = 'The version is ' . $ipn_version . '.But the version folder had missing';
   #     }
   #     $fp = fopen($log_dir . 'ipn_version_error_' . date("Ymd") . '.log', 'a');
   #     fwrite($fp, "Time: " . date("H:i:s e"));
   #     fwrite($fp, "\r\n");
   #     fwrite($fp, $comment);
   #     fwrite($fp, "\r\n");
   #     fclose($fp);
   # }
}

if ($ipn_version != '' && version_exists($ipn_version)) {
    explode_visited_site($ipn_version, $current_site, $current_group);
    $visited_site = $ipn_version;
}


//记录下当前正在访问的版本31536000＝３６５＊６０＊２４
$expire_time = time() + 31536000;
foreach ($grouped_sites_valid as $group) {
    if ($group['id'] == $current_group) {
        foreach ($group['sites'] as $site) {
            if ($site['id'] == $current_site) {
                $expire_time = strtotime($site['expires']);
                break;
            }
        }
        break;
    }
}

setcookie("VISITED_SITE", $visited_site, $expire_time, '/', get_top_level_domain());

$site_directory = $current_site; 

if ($site_directory != '.') {

    //定义虚拟目录名称，用于解决CSS/JS引入路径问题
    define('BASE_PATH', '/' . $site_directory . '/');

    //以下为动态子目录绑定功能
    $_SERVER['DOCUMENT_ROOT'] = dirname(__FILE__) . DIRECTORY_SEPARATOR . $site_directory;
    //切换网站目录
    chdir($_SERVER['DOCUMENT_ROOT']);
    //包含真实运行网站入口文件

    include $_SERVER['DOCUMENT_ROOT'] . DIRECTORY_SEPARATOR . basename($_SERVER['SCRIPT_FILENAME']);
    exit;
}

/**
 * 根据权重，“随机”选择
 * @param array $weighted
 * @return mixed
 */
function weighted_rand_ext($weighted = array(), &$out = NULL) {
    $roll = mt_rand(1, array_sum_ext($weighted));
    $_tmp = 0;
    $result = 0;
    foreach ($weighted as $k => $v) {
        $min = $_tmp;
        $_tmp += $v['weight'];
        $max = $_tmp;
        if ($roll > $min && $roll <= $max) {
            $out = $v;
            $result = $v['id'];
            break;
        }
    }
    return $result;
}

/**
 * 根据数组成员weight求和
 * @param array $array
 * @return int
 */
function array_sum_ext(array $array) {
    $sum = 0;
    foreach ($array as $item) {
        $sum += $item['weight'];
    }
    return $sum;
}

/**
 * 拆分版本字符串 格式 v20130711@G1
 * @param string $visited_site
 * @param string $current_site
 * @param string $current_group
 */
function explode_visited_site($visited_site, &$current_site, &$current_group) {
    $visited_site_info = explode('@', $visited_site);
    $current_site = $visited_site_info[0];
    $current_group = count($visited_site_info) == 2 ? $visited_site_info[1] : '';
}

/**
 * 根据版本字符串，检查该版本目录是否存在
 * @param type $visited_site
 * @return boolean
 */
function version_exists($visited_site, $check_group = FALSE, $site_groups = NULL) {
    $version_exists = FALSE;
    $visited_site_info = explode('@', $visited_site);
    $temp_site = $visited_site_info[0];
    $temp_group = count($visited_site_info) > 1 ? $visited_site_info[1] : '';

    if ($check_group && empty($site_groups)) {
        $version_exists = FALSE;
    } elseif ($check_group && !empty($site_groups))
        foreach ($site_groups as $key => $group) {
            if ($group['id'] == $temp_group) {
                foreach ($group['sites'] as $site) {
                    if ($site['id'] == $temp_site) {
                        $version_exists = TRUE;
                        break;
                    }
                }
                break;
            }
        } else {
        $version_exists = file_exists($temp_site);
    }
    return $version_exists;
}

function get_top_level_domain() {
    $domain = $_SERVER['HTTP_HOST'];
    if (preg_match('/^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$/', $domain) === 1) {
        return $domain;
    }

    if (strtolower(substr($domain, 0, 4)) == 'www.')
        $domain = substr($domain, 4);
    //当domain为二级域名时, 获取顶级域处理.
    $domain_arr = explode('.', $domain);
    if (($domain_count = count($domain_arr)) > 1) {
        $domain = $domain_arr[$domain_count - 2] . '.' . $domain_arr[$domain_count - 1];
    }
    // Add the dot prefix to ensure compatibility with subdomains

    if (substr($domain, 0, 1) != '.')
        $domain = '.' . $domain;
    if (stripos($domain, 'localhost'))
        $domain = '';
    // Remove port information.

    $port = strpos($domain, ':');

    if ($port !== false)
        $domain = substr($domain, 0, $port);
    return $domain;
}

function get_passport_key($txt, $encrypt_key) {
    $encrypt_key = md5($encrypt_key);
    $ctr = 0;
    $tmp = '';
    for ($i = 0; $i < strlen($txt); $i++) {
        $ctr = $ctr == strlen($encrypt_key) ? 0 : $ctr;
        $tmp .= $txt[$i] ^ $encrypt_key[$ctr++];
    }
    return $tmp;
}

function get_passport_decrypt($txt) {
    $key = 'zencart';
    $txt = get_passport_key(base64_decode($txt), $key);
    $tmp = '';
    for ($i = 0; $i < strlen($txt); $i++) {
        $md5 = $txt[$i];
        $tmp .= $txt[++$i] ^ $md5;
    }
    return $tmp;
}

function get_ipn_version_by_tag($connection_string, $order_id, $order_tag) {
    //$db_config['host'], $db_config['user'], $db_config['pass'], substr($db_config['path'], 1)
    $db_config = parse_url($connection_string);
    //TODO: 执行SQL查询，获取版本号
    if ($order_id != 0) {
        $sql = " orders_id = $order_id limit 1";
    } else if ($order_tag != '') {
        $sql = " orders_tag = $order_tag limit 1";
    } else {
        return false;
    }
    $query = "select version_of_code from orders where " . $sql;
    $pass = get_passport_decrypt($db_config['pass']);
    if (isset($db_config['port'])) {
        $host = $db_config['host'] . ':' . $db_config['port'];
    }else{
        $host = $db_config['host'];
    }
    $link = @mysql_connect($host, $db_config['user'], $pass, TRUE);

    if ($link) {
        if (@mysql_select_db(substr($db_config['path'], 1), $link)) {
            mysql_query("SET CHARACTER SET UTF8", $link);
        } else {
            return false;
        }
    } else {
        return false;
    }

    if ($link !== false) {
        $result = mysql_query($query, $link);
        $version_info = mysql_fetch_assoc($result);
        $version_info = explode('.', $version_info['version_of_code']);
        $ipnversion = (stripos($version_info[0], 'v') !== false) ? $version_info[0] : false;
        mysql_close($link);
    }

    if ($ipnversion) {
        return $ipnversion;
    }
}

/**
 * 检查确保调试版本存在，若不存在，则提示版本错误。
 * 
 * @param type $current_site string
 */
function check_debugger_version($current_site) {
    if (!file_exists($current_site)) {
        $html = str_replace('{debugger_version}', $current_site, file_get_contents('version-404.html'));
        echo $html;
        exit;
    }
}

/**
 * 判断是否是搜索引擎访问
 * @return boolean
 */
function is_crawler() {
    $agent = strtolower(@$_SERVER['HTTP_USER_AGENT']); 
    if (!empty($agent)) {
        $spiderSite = array(
            "TencentTraveler",
            "Baiduspider+",
            "BaiduGame",
            "Googlebot",
            "AppEngine-Google",
            "bingbot",
            "msnbot",
            "Sosospider+",
            "Sogou web spider",
            "ia_archiver",
            "Yahoo! Slurp",
            "YoudaoBot",
            "Yahoo Slurp",
            "MSNBot",
            "Java (Often spam bot)",
            "BaiDuSpider",
            "Voila",
            "Yandex bot",
            "BSpider",
            "twiceler",
            "Sogou Spider",
            "Speedy Spider",
            "Google AdSense",
            "Heritrix",
            "Python-urllib",
            "Alexa (IA Archiver)",
            "Ask",
            "Exabot",
            "Custo",
            "OutfoxBot/YodaoBot",
            "yacy",
            "SurveyBot",
            "legs",
            "lwp-trivial",
            "Nutch",
            "StackRambler",
            "The web archive (IA Archiver)",
            "Perl tool",
            "MJ12bot",
            "Netcraft",
            "MSIECrawler",
            "WGet tools",
            "larbin",
            "Fish search",
        );

        if (strpos($agent,'bot')!==false || strpos($agent, 'spider')!==false || strpos($agent, 'crawler')!==false)
            return TRUE;
        else
        {
            foreach ($spiderSite as $val) {
                $str = strtolower($val);
                if (strpos($agent, $str) !== FALSE) {
                    return TRUE;
                }
            }
        }
    } 
    return FALSE;
}

function get_country_by_ip($client_ip = NULL) {
    global $connection_string;

    if (!$client_ip) {
        $client_ip = get_ip_address();
    }
    $ip = sprintf("%u", ip2long($client_ip));

    $country = 'US';
    $cache_key = 'ip_' . $ip;

    if (($country = get_cache_value($cache_key)) === FALSE) {

        $db_config = parse_url($connection_string);
        $pass = get_passport_decrypt($db_config['pass']);

        $query = "select ctry as country from ip_to_country where ip_from = (select max(ip_from) from ip_to_country where ip_from <= {$ip})";
        if (isset($db_config['port'])) {
            $host = $db_config['host'] . ':' . $db_config['port'];
        }else{
            $host = $db_config['host'];
        }
        $link = @mysql_connect($host, $db_config['user'], $pass, TRUE);

        if ($link) {
            if (@mysql_select_db(substr($db_config['path'], 1), $link)) {
                mysql_query("SET CHARACTER SET UTF8", $link);
            } else {
                return FALSE;
            }
        } else {
            return FALSE;
        }

        if ($link !== FALSE) {
            $res = mysql_query($query, $link);
            $rs = mysql_fetch_assoc($res);
            $country = $rs['country'];
            mysql_close($link);
        }
        //cache 2 hours
        set_cache_value($cache_key, $country, 7200);
    }

    return $country;
}

function get_ip_address() {
    if (isset($_SERVER)) {
        if (isset($_SERVER['HTTP_X_REAL_IP'])) {
            $ip = $_SERVER['HTTP_X_REAL_IP'];
        } elseif (isset($_SERVER['HTTP_X_FORWARDED_FOR'])) {
            $ip = $_SERVER['HTTP_X_FORWARDED_FOR'];
        } elseif (isset($_SERVER['HTTP_CLIENT_IP'])) {
            $ip = $_SERVER['HTTP_CLIENT_IP'];
        } else {
            $ip = $_SERVER['REMOTE_ADDR'];
        }
    } else {
        if (getenv('HTTP_X_REAL_IP')) {
            $ip = getenv('HTTP_X_REAL_IP');
        } elseif (getenv('HTTP_X_FORWARDED_FOR')) {
            $ip = getenv('HTTP_X_FORWARDED_FOR');
        } elseif (getenv('HTTP_CLIENT_IP')) {
            $ip = getenv('HTTP_CLIENT_IP');
        } else {
            $ip = getenv('REMOTE_ADDR');
        }
    }
    return $ip;
}

function get_cache_value($key) {
    return function_exists('xcache_isset') && xcache_isset($key) ? xcache_get($key) : FALSE;
}

function set_cache_value($key, $value, $expire = CACHE_EXPIRE_TIME) {
    if (function_exists('xcache_set')) {
        return xcache_set($key, $value, $expire);
    }
}
