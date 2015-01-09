package com.tinydeal.affiliate;
// Generated 2015-1-9 10:59:18 by Hibernate Tools 4.3.1


import java.math.BigDecimal;
import java.util.Date;

/**
 * OrdersProducts generated by hbm2java
 */
public class OrdersProducts  implements java.io.Serializable {


     private Integer ordersProductsId;
     private int ordersId;
     private int productsId;
     private String productsModel;
     private String productsName;
     private BigDecimal productsPrice;
     private BigDecimal finalPrice;
     private BigDecimal productsTax;
     private float productsQuantity;
     private BigDecimal onetimeCharges;
     private boolean productsPricedByAttribute;
     private boolean productIsFree;
     private boolean productsDiscountTypeFrom;
     private BigDecimal discountPrice;
     private Byte productsDiscountType;
     private String productsPrid;
     private int storeModuleId;
     private String productsAttrValue;
     private Short shippingStatus;
     private Short stockDecreased;
     private Date lastModified;
     private Integer pmId;
     private String discountType;
     private Float discountQuantity;
     private String couponId;
     private BigDecimal discountAmount;
     private Integer redeemPoints;

    public OrdersProducts() {
    }

	
    public OrdersProducts(int ordersId, int productsId, String productsName, BigDecimal productsPrice, BigDecimal finalPrice, BigDecimal productsTax, float productsQuantity, BigDecimal onetimeCharges, boolean productsPricedByAttribute, boolean productIsFree, boolean productsDiscountTypeFrom, String productsPrid, int storeModuleId) {
        this.ordersId = ordersId;
        this.productsId = productsId;
        this.productsName = productsName;
        this.productsPrice = productsPrice;
        this.finalPrice = finalPrice;
        this.productsTax = productsTax;
        this.productsQuantity = productsQuantity;
        this.onetimeCharges = onetimeCharges;
        this.productsPricedByAttribute = productsPricedByAttribute;
        this.productIsFree = productIsFree;
        this.productsDiscountTypeFrom = productsDiscountTypeFrom;
        this.productsPrid = productsPrid;
        this.storeModuleId = storeModuleId;
    }
    public OrdersProducts(int ordersId, int productsId, String productsModel, String productsName, BigDecimal productsPrice, BigDecimal finalPrice, BigDecimal productsTax, float productsQuantity, BigDecimal onetimeCharges, boolean productsPricedByAttribute, boolean productIsFree, boolean productsDiscountTypeFrom, BigDecimal discountPrice, Byte productsDiscountType, String productsPrid, int storeModuleId, String productsAttrValue, Short shippingStatus, Short stockDecreased, Date lastModified, Integer pmId, String discountType, Float discountQuantity, String couponId, BigDecimal discountAmount, Integer redeemPoints) {
       this.ordersId = ordersId;
       this.productsId = productsId;
       this.productsModel = productsModel;
       this.productsName = productsName;
       this.productsPrice = productsPrice;
       this.finalPrice = finalPrice;
       this.productsTax = productsTax;
       this.productsQuantity = productsQuantity;
       this.onetimeCharges = onetimeCharges;
       this.productsPricedByAttribute = productsPricedByAttribute;
       this.productIsFree = productIsFree;
       this.productsDiscountTypeFrom = productsDiscountTypeFrom;
       this.discountPrice = discountPrice;
       this.productsDiscountType = productsDiscountType;
       this.productsPrid = productsPrid;
       this.storeModuleId = storeModuleId;
       this.productsAttrValue = productsAttrValue;
       this.shippingStatus = shippingStatus;
       this.stockDecreased = stockDecreased;
       this.lastModified = lastModified;
       this.pmId = pmId;
       this.discountType = discountType;
       this.discountQuantity = discountQuantity;
       this.couponId = couponId;
       this.discountAmount = discountAmount;
       this.redeemPoints = redeemPoints;
    }
   
    public Integer getOrdersProductsId() {
        return this.ordersProductsId;
    }
    
    public void setOrdersProductsId(Integer ordersProductsId) {
        this.ordersProductsId = ordersProductsId;
    }
    public int getOrdersId() {
        return this.ordersId;
    }
    
    public void setOrdersId(int ordersId) {
        this.ordersId = ordersId;
    }
    public int getProductsId() {
        return this.productsId;
    }
    
    public void setProductsId(int productsId) {
        this.productsId = productsId;
    }
    public String getProductsModel() {
        return this.productsModel;
    }
    
    public void setProductsModel(String productsModel) {
        this.productsModel = productsModel;
    }
    public String getProductsName() {
        return this.productsName;
    }
    
    public void setProductsName(String productsName) {
        this.productsName = productsName;
    }
    public BigDecimal getProductsPrice() {
        return this.productsPrice;
    }
    
    public void setProductsPrice(BigDecimal productsPrice) {
        this.productsPrice = productsPrice;
    }
    public BigDecimal getFinalPrice() {
        return this.finalPrice;
    }
    
    public void setFinalPrice(BigDecimal finalPrice) {
        this.finalPrice = finalPrice;
    }
    public BigDecimal getProductsTax() {
        return this.productsTax;
    }
    
    public void setProductsTax(BigDecimal productsTax) {
        this.productsTax = productsTax;
    }
    public float getProductsQuantity() {
        return this.productsQuantity;
    }
    
    public void setProductsQuantity(float productsQuantity) {
        this.productsQuantity = productsQuantity;
    }
    public BigDecimal getOnetimeCharges() {
        return this.onetimeCharges;
    }
    
    public void setOnetimeCharges(BigDecimal onetimeCharges) {
        this.onetimeCharges = onetimeCharges;
    }
    public boolean isProductsPricedByAttribute() {
        return this.productsPricedByAttribute;
    }
    
    public void setProductsPricedByAttribute(boolean productsPricedByAttribute) {
        this.productsPricedByAttribute = productsPricedByAttribute;
    }
    public boolean isProductIsFree() {
        return this.productIsFree;
    }
    
    public void setProductIsFree(boolean productIsFree) {
        this.productIsFree = productIsFree;
    }
    public boolean isProductsDiscountTypeFrom() {
        return this.productsDiscountTypeFrom;
    }
    
    public void setProductsDiscountTypeFrom(boolean productsDiscountTypeFrom) {
        this.productsDiscountTypeFrom = productsDiscountTypeFrom;
    }
    public BigDecimal getDiscountPrice() {
        return this.discountPrice;
    }
    
    public void setDiscountPrice(BigDecimal discountPrice) {
        this.discountPrice = discountPrice;
    }
    public Byte getProductsDiscountType() {
        return this.productsDiscountType;
    }
    
    public void setProductsDiscountType(Byte productsDiscountType) {
        this.productsDiscountType = productsDiscountType;
    }
    public String getProductsPrid() {
        return this.productsPrid;
    }
    
    public void setProductsPrid(String productsPrid) {
        this.productsPrid = productsPrid;
    }
    public int getStoreModuleId() {
        return this.storeModuleId;
    }
    
    public void setStoreModuleId(int storeModuleId) {
        this.storeModuleId = storeModuleId;
    }
    public String getProductsAttrValue() {
        return this.productsAttrValue;
    }
    
    public void setProductsAttrValue(String productsAttrValue) {
        this.productsAttrValue = productsAttrValue;
    }
    public Short getShippingStatus() {
        return this.shippingStatus;
    }
    
    public void setShippingStatus(Short shippingStatus) {
        this.shippingStatus = shippingStatus;
    }
    public Short getStockDecreased() {
        return this.stockDecreased;
    }
    
    public void setStockDecreased(Short stockDecreased) {
        this.stockDecreased = stockDecreased;
    }
    public Date getLastModified() {
        return this.lastModified;
    }
    
    public void setLastModified(Date lastModified) {
        this.lastModified = lastModified;
    }
    public Integer getPmId() {
        return this.pmId;
    }
    
    public void setPmId(Integer pmId) {
        this.pmId = pmId;
    }
    public String getDiscountType() {
        return this.discountType;
    }
    
    public void setDiscountType(String discountType) {
        this.discountType = discountType;
    }
    public Float getDiscountQuantity() {
        return this.discountQuantity;
    }
    
    public void setDiscountQuantity(Float discountQuantity) {
        this.discountQuantity = discountQuantity;
    }
    public String getCouponId() {
        return this.couponId;
    }
    
    public void setCouponId(String couponId) {
        this.couponId = couponId;
    }
    public BigDecimal getDiscountAmount() {
        return this.discountAmount;
    }
    
    public void setDiscountAmount(BigDecimal discountAmount) {
        this.discountAmount = discountAmount;
    }
    public Integer getRedeemPoints() {
        return this.redeemPoints;
    }
    
    public void setRedeemPoints(Integer redeemPoints) {
        this.redeemPoints = redeemPoints;
    }




}


