<?php
/*
 * @author chenliujin <liujin.chen@qq.com>
 * @since 2013-02-24
 */
class Model
{
        public static $dbo;

        /*
         * @author chenliujin <liujin.chen@qq.com>
         * @since 2013-04-01
         */
        public static function query($sql, $params, $class = 'stdClass')
        {
			try {
                $dbh = self::$dbo->getDbHandle();

				if (empty($params)) {
					/**
					 * Bug Fix: limit 0,50 not work in PDO prepear
					 * referer http://stackoverflow.com/questions/5508993/pdo-limit-and-offset
					 */
					$dbh->setAttribute(PDO::ATTR_EMULATE_PREPARES, FALSE);

					$sth = $dbh->query($sql);
					if (!$sth) {
						throw new Exception(var_export($dbh->errorInfo(), TRUE));
					}

                	return $sth->fetchAll(PDO::FETCH_CLASS, $class);
				} else {
                	$sth = $dbh->prepare($sql);
                	$sth->execute($params);

                	return $sth->fetchAll(PDO::FETCH_CLASS, $class);
				}
			} catch (Exception $e) {
				error_log('FILE: ' . __FILE__);
				error_log('SQL: ' . $sql);
				error_log('PARAMS: ' . var_export($params, 1));
				error_log('Message: ' . $e->getMessage());

				return array();
			}
        }

        /*
         * @author chenliujin <liujin.chen@qq.com>
         * @since 2013-04-04
         */
        public static function execute($sql, $params)
        {
                $dbh = self::$dbo->getDbHandle();
                $sth = $dbh->prepare($sql);
                return $sth->execute($params);
        }

        /*
         * @author chenliujin <liujin.chen@qq.com>
         * @since 2013-02-24
         */
        public function get($pk)
        {
			try {
				$class = $this->getTableName();

				$object = new $class;

				$keys = $this->getPrimaryKey();

				foreach ($keys as $key) {
					$value = is_array($pk) ? $pk[$key] : $pk;

					$where[] = $key . '= :' . $key;
					$params[':' . $key] = $value;
				}

				$sql = 'SELECT * FROM ' . $this->getTableName() . ' WHERE ' . implode(' AND ', $where);

				$result = array_shift(self::query($sql, $params, get_class($this)));


				return $result;
			} catch (PDOException $e) {
				error_log('FILE: ' . __FILE__);
				error_log('SQL: ' . $sql);
				error_log('Primary Key: ' . var_export($pk, 1));

				return NULL;
			}
        }

        /*
         * @author chenliujin <liujin.chen@qq.com>
         * @since 2013-04-06
         */
        public function findAll(array $args = array())
        {
                $sql = 'SELECT * FROM ' . $this->getTableName();
                $params = array();

                if (!empty($args)) {
                        foreach ($args as $column => $value) {
                                $where[] = $column . ' = :' . $column;;
                                $params[':'.$column] = $value;
                        }

                        $sql .= ' WHERE ' . implode(' AND ', $where);
                }

                return self::query($sql, $params, get_class($this));
        }

        /*
         * @author chenliujin <liujin.chen@qq.com>
         * @since 2013-02-24
         */
        public function insert()
        {
                $class = $this->getTableName();
                $object = new $class;

                $fields = get_object_vars($this);

                foreach ($fields as $field => $value) {
                        $key = ':' . $field;
                        $column[] = $field;
                        $column_key[] = $key;
                        $params[$key] = $value;
                }

                $sql = 'INSERT INTO ' . $this->getTableName() . '(`' . join('`, `' , $column) . '`) VALUES (' . join(',', $column_key) . ')';

                $dbh = self::$dbo->getDbHandle();
                $sth = $dbh->prepare($sql);
                $rs = $sth->execute($params);

                if (!$rs) {
                        error_log('ERROR CLASS:' . __CLASS__ . ', FUNCTION:' . __FUNCTION__ . ', LINE:' . __LINE__);
                        error_log('SQL:' . $sql);
                        error_log('Parameters:' . print_r($params, TRUE));
                        error_log(print_r($sth->errorInfo(), TRUE));
                        return '-1';
                }

                return $dbh->lastInsertId();
        }

        /*
         * @author chenliujin <liujin.chen@qq.com>
         * @since 2013-02-24
         */
        public function update()
        {
                $class = $this->getTableName();
                $object = new $class;

                $fields = get_object_vars($this);

                $pk = $this->getPrimaryKey();
                foreach ($pk as $key) {
                        $pk_column[] = $key . ' = :' . $key;
                        $params[':' . $key] = $fields[$key];
                        unset($fields[$key]);
                }

                foreach ($fields as $field => $value) {
                        $column[] = $field . ' = :' . $field;
                        $params[':' . $field] = $value;
                }

                $sql = 'UPDATE ' . $this->getTableName() . ' SET ' . implode(', ', $column) . ' WHERE ' . implode(' AND ', $pk_column);

                $dbh = self::$dbo->getDbHandle();
                $sth = $dbh->prepare($sql);
                $rs = $sth->execute($params);

                if (!$rs) {
                        error_log('ERROR CLASS:' . __CLASS__ . ', FUNCTION:' . __FUNCTION__ . ', LINE:' . __LINE__);
                        error_log('SQL:' . $sql);
                        error_log('Parameters:' . print_r($params, TRUE));
                        error_log(print_r($sth->errorInfo(), TRUE));
                }

                return $rs;
        }

        /*
         * @author chenliujin <liujin.chen@qq.com>
         * @since 2013-02-24
         */
        public function delete()
        {
                $sql = 'DELETE FROM ' . $this->getTableName() . ' WHERE ';

                foreach ($this->getPrimaryKey() as $pk) {
                        $sql .= $pk . ' = :' . $pk;
                        $params[':' . $pk] = $this->$pk;
                }

                $dbh = self::$dbo->getDbHandle();
                $sth = $dbh->prepare($sql);
                $rs = $sth->execute($params);

                if (!$rs) {
                        error_log('ERROR CLASS:' . __CLASS__ . ', FUNCTION:' . __FUNCTION__ . ', LINE:' . __LINE__);
                        error_log('SQL:' . $sql);
                        error_log('Parameters:' . print_r($params, TRUE));
                        error_log(print_r($sth->errorInfo(), TRUE));
                }

                return $rs;
        }
}
