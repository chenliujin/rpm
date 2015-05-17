<?php

/**
 * @author chenliujin <liujin.chen@qq.com>
 * @since 2015-01-27
 */
class countries extends Model 
{
	static public function getTableName()
	{
		return 'countries';
	}

	/**
	 * @author chenliujin <liujin.chen@qq.com>
	 * @since 2015-01-27
	 */
	public function getAll()
	{
		$sql = "
			SELECT *
			FROM " . self::GetTableName() . "
			";
		$result = $this->query($sql, array());

		return $result;
	}

	/**
	 * @author chenliujin <liujin.chen@qq.com>
	 * @since 2015-01-27
	 */
	public function getCountryNameToCountryCode()
	{
		$result = $this->getAll();

		foreach ($result as $obj) {
			$data[$obj->countries_name] = $obj->countries_iso_code_2;
		}

		return $data;
	}
}
