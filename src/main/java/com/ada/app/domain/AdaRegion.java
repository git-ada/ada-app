package com.ada.app.domain;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import cn.com.jiand.mvc.framework.domain.AbstractEntity;

/**
 * 域名统计 Entity
 * @author Wanghl.cn By Code Generator
 */
@Entity
@Table(name = "ada_region")
public class AdaRegion extends AbstractEntity<Integer> {
    /** ID */
	private Integer id;     
	private String name;  
	private String fullname; 
	private Integer level;  
	private String jianpin; 
	private String pinyin;
	private String zipCode;
	private Integer sort;  
	private Integer isHot;
	private String lng;
	private String lat;
	private Integer parentId;  
	private Integer countryId;
	private String countryName;
	private Integer provinceId;
	private String provinceName;
	private Integer cityId;
	private String cityName;
	private Integer districtId;
	private String districtName;
	
	public AdaRegion() {
		super();
	}
	
	

	public AdaRegion(Integer id, String name, String fullname, Integer level,
			String jianpin, String pinyin, String zipCode, Integer sort,
			Integer isHot, String lng, String lat, Integer parentId,
			Integer countryId, String countryName, Integer provinceId,
			String provinceName, Integer cityId, String cityName,
			Integer districtId, String districtName) {
		super();
		this.id = id;
		this.name = name;
		this.fullname = fullname;
		this.level = level;
		this.jianpin = jianpin;
		this.pinyin = pinyin;
		this.zipCode = zipCode;
		this.sort = sort;
		this.isHot = isHot;
		this.lng = lng;
		this.lat = lat;
		this.parentId = parentId;
		this.countryId = countryId;
		this.countryName = countryName;
		this.provinceId = provinceId;
		this.provinceName = provinceName;
		this.cityId = cityId;
		this.cityName = cityName;
		this.districtId = districtId;
		this.districtName = districtName;
	}



	@Id	
	@GeneratedValue
	public Integer getId(){
		return this.id;
	}
	
	public void setId(Integer id){
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getFullname() {
		return fullname;
	}

	public void setFullname(String fullname) {
		this.fullname = fullname;
	}

	public Integer getLevel() {
		return level;
	}

	public void setLevel(Integer level) {
		this.level = level;
	}

	public String getJianpin() {
		return jianpin;
	}

	public void setJianpin(String jianpin) {
		this.jianpin = jianpin;
	}

	public String getPinyin() {
		return pinyin;
	}

	public void setPinyin(String pinyin) {
		this.pinyin = pinyin;
	}

	public String getZipCode() {
		return zipCode;
	}

	public void setZipCode(String zipCode) {
		this.zipCode = zipCode;
	}

	public Integer getSort() {
		return sort;
	}

	public void setSort(Integer sort) {
		this.sort = sort;
	}

	public Integer getIsHot() {
		return isHot;
	}

	public void setIsHot(Integer isHot) {
		this.isHot = isHot;
	}

	public String getLng() {
		return lng;
	}

	public void setLng(String lng) {
		this.lng = lng;
	}

	public String getLat() {
		return lat;
	}

	public void setLat(String lat) {
		this.lat = lat;
	}

	public Integer getParentId() {
		return parentId;
	}

	public void setParentId(Integer parentId) {
		this.parentId = parentId;
	}

	public Integer getCountryId() {
		return countryId;
	}

	public void setCountryId(Integer countryId) {
		this.countryId = countryId;
	}

	public String getCountryName() {
		return countryName;
	}

	public void setCountryName(String countryName) {
		this.countryName = countryName;
	}

	public Integer getProvinceId() {
		return provinceId;
	}

	public void setProvinceId(Integer provinceId) {
		this.provinceId = provinceId;
	}

	public String getProvinceName() {
		return provinceName;
	}

	public void setProvinceName(String provinceName) {
		this.provinceName = provinceName;
	}

	public Integer getCityId() {
		return cityId;
	}

	public void setCityId(Integer cityId) {
		this.cityId = cityId;
	}

	public String getCityName() {
		return cityName;
	}

	public void setCityName(String cityName) {
		this.cityName = cityName;
	}

	public Integer getDistrictId() {
		return districtId;
	}

	public void setDistrictId(Integer districtId) {
		this.districtId = districtId;
	}

	public String getDistrictName() {
		return districtName;
	}

	public void setDistrictName(String districtName) {
		this.districtName = districtName;
	}
	
	
	
	
}
