package com.tinydeal.affiliate;
// Generated 2015-1-9 10:59:18 by Hibernate Tools 4.3.1


import java.math.BigDecimal;
import java.util.Date;

/**
 * Affiliate generated by hbm2java
 */
public class Affiliate  implements java.io.Serializable {


     private Integer affiliateId;
     private int customersId;
     private String website;
     private String code;
     private int enterTimes;
     private BigDecimal boughtOrderTotal;
     private Date lastModified;
     private Integer affiliateLevel;

    public Affiliate() {
    }

	
    public Affiliate(int customersId, int enterTimes) {
        this.customersId = customersId;
        this.enterTimes = enterTimes;
    }
    public Affiliate(int customersId, String website, String code, int enterTimes, BigDecimal boughtOrderTotal, Date lastModified, Integer affiliateLevel) {
       this.customersId = customersId;
       this.website = website;
       this.code = code;
       this.enterTimes = enterTimes;
       this.boughtOrderTotal = boughtOrderTotal;
       this.lastModified = lastModified;
       this.affiliateLevel = affiliateLevel;
    }
   
    public Integer getAffiliateId() {
        return this.affiliateId;
    }
    
    public void setAffiliateId(Integer affiliateId) {
        this.affiliateId = affiliateId;
    }
    public int getCustomersId() {
        return this.customersId;
    }
    
    public void setCustomersId(int customersId) {
        this.customersId = customersId;
    }
    public String getWebsite() {
        return this.website;
    }
    
    public void setWebsite(String website) {
        this.website = website;
    }
    public String getCode() {
        return this.code;
    }
    
    public void setCode(String code) {
        this.code = code;
    }
    public int getEnterTimes() {
        return this.enterTimes;
    }
    
    public void setEnterTimes(int enterTimes) {
        this.enterTimes = enterTimes;
    }
    public BigDecimal getBoughtOrderTotal() {
        return this.boughtOrderTotal;
    }
    
    public void setBoughtOrderTotal(BigDecimal boughtOrderTotal) {
        this.boughtOrderTotal = boughtOrderTotal;
    }
    public Date getLastModified() {
        return this.lastModified;
    }
    
    public void setLastModified(Date lastModified) {
        this.lastModified = lastModified;
    }
    public Integer getAffiliateLevel() {
        return this.affiliateLevel;
    }
    
    public void setAffiliateLevel(Integer affiliateLevel) {
        this.affiliateLevel = affiliateLevel;
    }




}


