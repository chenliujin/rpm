<?php
/**
 * 新模板
 */
define('DIR_WS_TEMPLATE', 'includes/templates/cigabuy/'); 

/**
 * MySQL 跟踪日志
 * queryFactory::write_log()
 * DIR_FS_SQL_CACHE . '/sql_log_' . date("Ymd") . '.log'
 */
define('SQL_DEBUG', 'true');
define('DIR_FS_SQL_CACHE', '/ssd/www/zencart/weblogs/');


define('SESSION_REDIS_HOST', 	'127.0.0.1');
define('SESSION_REDIS_PORT', 	'6379');
define('SESSION_REDIS_DB', 		0);


define('DIR_WS_INCLUDES',   'includes/');
define('DIR_WS_FUNCTIONS',  DIR_WS_INCLUDES . 'functions/');
define('DIR_WS_CLASSES',    DIR_WS_INCLUDES . 'classes/');
define('DIR_WS_MODULES',    DIR_WS_INCLUDES . 'modules/');
define('DIR_WS_LANGUAGES',  DIR_WS_INCLUDES . 'languages/');
define('DIR_WS_TEMPLATES',  DIR_WS_INCLUDES . 'templates/');
