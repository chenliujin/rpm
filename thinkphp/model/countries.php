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
	 * @since 2015-05-17
	 */
	public function getPrimaryKey()
	{
		return array('countries_id');
	}

	/**
	 * @author chenliujin <liujin.chen@qq.com>
	 * @since 2015-01-27
	 */
	public function getAll()
	{
		static $data;
		
		if (!empty($data)) {
			return $data;
		}
		$sql = "
			SELECT *
			FROM " . self::GetTableName() . "
			";
		$result = $this->query($sql, array(), __CLASS__);
		
		foreach ($result as $obj) {
			$data[$obj->countries_iso_code_2] = $obj;
		}

		return $data;
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
	
	/**
	 * @author chenliujin <liujin.chen@qq.com>
	 * @since 2015-05-30
	 */
	static public function getContinents($code)
	{
		static $countries;
		
		if (empty($countries)) {
			$class = __CLASS__;
			$_this = new $class;
			$countries = $_this->getAll();
		}
		
		return $countries[$code]->continents;
	}
	
	/**
	 * @author chenliujin <liujin.chen@qq.com>
	 * @since 2015-05-30
	 */
	static public function getCountriesNameCN($code)
	{
		static $countries;
		
		if (empty($countries)) {
			$class = __CLASS__;
			$_this = new $class;
			$countries = $_this->getAll();
		}
		
		return $countries[$code]->countries_name_cn;	
	}	
}
