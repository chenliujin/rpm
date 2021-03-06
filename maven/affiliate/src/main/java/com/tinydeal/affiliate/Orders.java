package com.tinydeal.affiliate;
// Generated 2015-1-9 10:59:18 by Hibernate Tools 4.3.1


import java.math.BigDecimal;
import java.util.Date;

/**
 * Orders generated by hbm2java
 */
public class Orders  implements java.io.Serializable {


     private Integer ordersId;
     private int customersId;
     private String customersName;
     private String customersCompany;
     private String customersStreetAddress;
     private String customersSuburb;
     private String customersCity;
     private String customersPostcode;
     private String customersState;
     private String customersCountry;
     private String customersTelephone;
     private String customersEmailAddress;
     private int customersAddressFormatId;
     private String deliveryName;
     private String deliveryCompany;
     private String deliveryStreetAddress;
     private String deliverySuburb;
     private String deliveryCity;
     private String deliveryPostcode;
     private String deliveryState;
     private String deliveryCountry;
     private int deliveryAddressFormatId;
     private String deliveryTelephone;
     private String deliveryCpf;
     private String billingName;
     private String billingCompany;
     private String billingStreetAddress;
     private String billingSuburb;
     private String billingCity;
     private String billingPostcode;
     private String billingState;
     private String billingCountry;
     private int billingAddressFormatId;
     private String paymentMethod;
     private String paymentModuleCode;
     private String shippingMethod;
     private String shippingModuleCode;
     private String couponCode;
     private String ccType;
     private String ccOwner;
     private String ccNumber;
     private String ccExpires;
     private byte[] ccCvv;
     private Date lastModified;
     private Date datePurchased;
     private int ordersStatus;
     private Date ordersDateFinished;
     private String currency;
     private BigDecimal currencyValue;
     private BigDecimal orderTotal;
     private BigDecimal orderTax;
     private int paypalIpnId;
     private String ipAddress;
     private String ordersTag;
     private String ordersFromCountry;
     private String ordersToCountry;
     private String trackNumber;
     private Integer visitSessionsId;
     private String transactionId;
     private String paypalAccount;
     private String salerId;
     private Integer omsOrderId;
     private Integer cookieVisitSessionsId;
     private int storeModuleId;
     private short isPackaged;
     private Boolean asAGift;
     private int usePaypalAddress;
     private String versionOfCode;
     private Integer transportationsId;
     private Short sendStoredProducts;
     private String promoteReferral;
     private int addressBookId;
     private Short paymentStatus;
     private String ordersToken;
     private String ordersSource;

    public Orders() {
    }

	
    public Orders(int customersId, String customersName, String customersCity, String customersCountry, String customersTelephone, String customersEmailAddress, int customersAddressFormatId, String deliveryName, String deliveryCity, String deliveryCountry, int deliveryAddressFormatId, String deliveryTelephone, String deliveryCpf, String billingName, String billingCity, String billingCountry, int billingAddressFormatId, String paymentMethod, String paymentModuleCode, String shippingMethod, String couponCode, int ordersStatus, int paypalIpnId, String ipAddress, int storeModuleId, short isPackaged, int usePaypalAddress, String promoteReferral, int addressBookId) {
        this.customersId = customersId;
        this.customersName = customersName;
        this.customersCity = customersCity;
        this.customersCountry = customersCountry;
        this.customersTelephone = customersTelephone;
        this.customersEmailAddress = customersEmailAddress;
        this.customersAddressFormatId = customersAddressFormatId;
        this.deliveryName = deliveryName;
        this.deliveryCity = deliveryCity;
        this.deliveryCountry = deliveryCountry;
        this.deliveryAddressFormatId = deliveryAddressFormatId;
        this.deliveryTelephone = deliveryTelephone;
        this.deliveryCpf = deliveryCpf;
        this.billingName = billingName;
        this.billingCity = billingCity;
        this.billingCountry = billingCountry;
        this.billingAddressFormatId = billingAddressFormatId;
        this.paymentMethod = paymentMethod;
        this.paymentModuleCode = paymentModuleCode;
        this.shippingMethod = shippingMethod;
        this.couponCode = couponCode;
        this.ordersStatus = ordersStatus;
        this.paypalIpnId = paypalIpnId;
        this.ipAddress = ipAddress;
        this.storeModuleId = storeModuleId;
        this.isPackaged = isPackaged;
        this.usePaypalAddress = usePaypalAddress;
        this.promoteReferral = promoteReferral;
        this.addressBookId = addressBookId;
    }
    public Orders(int customersId, String customersName, String customersCompany, String customersStreetAddress, String customersSuburb, String customersCity, String customersPostcode, String customersState, String customersCountry, String customersTelephone, String customersEmailAddress, int customersAddressFormatId, String deliveryName, String deliveryCompany, String deliveryStreetAddress, String deliverySuburb, String deliveryCity, String deliveryPostcode, String deliveryState, String deliveryCountry, int deliveryAddressFormatId, String deliveryTelephone, String deliveryCpf, String billingName, String billingCompany, String billingStreetAddress, String billingSuburb, String billingCity, String billingPostcode, String billingState, String billingCountry, int billingAddressFormatId, String paymentMethod, String paymentModuleCode, String shippingMethod, String shippingModuleCode, String couponCode, String ccType, String ccOwner, String ccNumber, String ccExpires, byte[] ccCvv, Date lastModified, Date datePurchased, int ordersStatus, Date ordersDateFinished, String currency, BigDecimal currencyValue, BigDecimal orderTotal, BigDecimal orderTax, int paypalIpnId, String ipAddress, String ordersTag, String ordersFromCountry, String ordersToCountry, String trackNumber, Integer visitSessionsId, String transactionId, String paypalAccount, String salerId, Integer omsOrderId, Integer cookieVisitSessionsId, int storeModuleId, short isPackaged, Boolean asAGift, int usePaypalAddress, String versionOfCode, Integer transportationsId, Short sendStoredProducts, String promoteReferral, int addressBookId, Short paymentStatus, String ordersToken, String ordersSource) {
       this.customersId = customersId;
       this.customersName = customersName;
       this.customersCompany = customersCompany;
       this.customersStreetAddress = customersStreetAddress;
       this.customersSuburb = customersSuburb;
       this.customersCity = customersCity;
       this.customersPostcode = customersPostcode;
       this.customersState = customersState;
       this.customersCountry = customersCountry;
       this.customersTelephone = customersTelephone;
       this.customersEmailAddress = customersEmailAddress;
       this.customersAddressFormatId = customersAddressFormatId;
       this.deliveryName = deliveryName;
       this.deliveryCompany = deliveryCompany;
       this.deliveryStreetAddress = deliveryStreetAddress;
       this.deliverySuburb = deliverySuburb;
       this.deliveryCity = deliveryCity;
       this.deliveryPostcode = deliveryPostcode;
       this.deliveryState = deliveryState;
       this.deliveryCountry = deliveryCountry;
       this.deliveryAddressFormatId = deliveryAddressFormatId;
       this.deliveryTelephone = deliveryTelephone;
       this.deliveryCpf = deliveryCpf;
       this.billingName = billingName;
       this.billingCompany = billingCompany;
       this.billingStreetAddress = billingStreetAddress;
       this.billingSuburb = billingSuburb;
       this.billingCity = billingCity;
       this.billingPostcode = billingPostcode;
       this.billingState = billingState;
       this.billingCountry = billingCountry;
       this.billingAddressFormatId = billingAddressFormatId;
       this.paymentMethod = paymentMethod;
       this.paymentModuleCode = paymentModuleCode;
       this.shippingMethod = shippingMethod;
       this.shippingModuleCode = shippingModuleCode;
       this.couponCode = couponCode;
       this.ccType = ccType;
       this.ccOwner = ccOwner;
       this.ccNumber = ccNumber;
       this.ccExpires = ccExpires;
       this.ccCvv = ccCvv;
       this.lastModified = lastModified;
       this.datePurchased = datePurchased;
       this.ordersStatus = ordersStatus;
       this.ordersDateFinished = ordersDateFinished;
       this.currency = currency;
       this.currencyValue = currencyValue;
       this.orderTotal = orderTotal;
       this.orderTax = orderTax;
       this.paypalIpnId = paypalIpnId;
       this.ipAddress = ipAddress;
       this.ordersTag = ordersTag;
       this.ordersFromCountry = ordersFromCountry;
       this.ordersToCountry = ordersToCountry;
       this.trackNumber = trackNumber;
       this.visitSessionsId = visitSessionsId;
       this.transactionId = transactionId;
       this.paypalAccount = paypalAccount;
       this.salerId = salerId;
       this.omsOrderId = omsOrderId;
       this.cookieVisitSessionsId = cookieVisitSessionsId;
       this.storeModuleId = storeModuleId;
       this.isPackaged = isPackaged;
       this.asAGift = asAGift;
       this.usePaypalAddress = usePaypalAddress;
       this.versionOfCode = versionOfCode;
       this.transportationsId = transportationsId;
       this.sendStoredProducts = sendStoredProducts;
       this.promoteReferral = promoteReferral;
       this.addressBookId = addressBookId;
       this.paymentStatus = paymentStatus;
       this.ordersToken = ordersToken;
       this.ordersSource = ordersSource;
    }
   
    public Integer getOrdersId() {
        return this.ordersId;
    }
    
    public void setOrdersId(Integer ordersId) {
        this.ordersId = ordersId;
    }
    public int getCustomersId() {
        return this.customersId;
    }
    
    public void setCustomersId(int customersId) {
        this.customersId = customersId;
    }
    public String getCustomersName() {
        return this.customersName;
    }
    
    public void setCustomersName(String customersName) {
        this.customersName = customersName;
    }
    public String getCustomersCompany() {
        return this.customersCompany;
    }
    
    public void setCustomersCompany(String customersCompany) {
        this.customersCompany = customersCompany;
    }
    public String getCustomersStreetAddress() {
        return this.customersStreetAddress;
    }
    
    public void setCustomersStreetAddress(String customersStreetAddress) {
        this.customersStreetAddress = customersStreetAddress;
    }
    public String getCustomersSuburb() {
        return this.customersSuburb;
    }
    
    public void setCustomersSuburb(String customersSuburb) {
        this.customersSuburb = customersSuburb;
    }
    public String getCustomersCity() {
        return this.customersCity;
    }
    
    public void setCustomersCity(String customersCity) {
        this.customersCity = customersCity;
    }
    public String getCustomersPostcode() {
        return this.customersPostcode;
    }
    
    public void setCustomersPostcode(String customersPostcode) {
        this.customersPostcode = customersPostcode;
    }
    public String getCustomersState() {
        return this.customersState;
    }
    
    public void setCustomersState(String customersState) {
        this.customersState = customersState;
    }
    public String getCustomersCountry() {
        return this.customersCountry;
    }
    
    public void setCustomersCountry(String customersCountry) {
        this.customersCountry = customersCountry;
    }
    public String getCustomersTelephone() {
        return this.customersTelephone;
    }
    
    public void setCustomersTelephone(String customersTelephone) {
        this.customersTelephone = customersTelephone;
    }
    public String getCustomersEmailAddress() {
        return this.customersEmailAddress;
    }
    
    public void setCustomersEmailAddress(String customersEmailAddress) {
        this.customersEmailAddress = customersEmailAddress;
    }
    public int getCustomersAddressFormatId() {
        return this.customersAddressFormatId;
    }
    
    public void setCustomersAddressFormatId(int customersAddressFormatId) {
        this.customersAddressFormatId = customersAddressFormatId;
    }
    public String getDeliveryName() {
        return this.deliveryName;
    }
    
    public void setDeliveryName(String deliveryName) {
        this.deliveryName = deliveryName;
    }
    public String getDeliveryCompany() {
        return this.deliveryCompany;
    }
    
    public void setDeliveryCompany(String deliveryCompany) {
        this.deliveryCompany = deliveryCompany;
    }
    public String getDeliveryStreetAddress() {
        return this.deliveryStreetAddress;
    }
    
    public void setDeliveryStreetAddress(String deliveryStreetAddress) {
        this.deliveryStreetAddress = deliveryStreetAddress;
    }
    public String getDeliverySuburb() {
        return this.deliverySuburb;
    }
    
    public void setDeliverySuburb(String deliverySuburb) {
        this.deliverySuburb = deliverySuburb;
    }
    public String getDeliveryCity() {
        return this.deliveryCity;
    }
    
    public void setDeliveryCity(String deliveryCity) {
        this.deliveryCity = deliveryCity;
    }
    public String getDeliveryPostcode() {
        return this.deliveryPostcode;
    }
    
    public void setDeliveryPostcode(String deliveryPostcode) {
        this.deliveryPostcode = deliveryPostcode;
    }
    public String getDeliveryState() {
        return this.deliveryState;
    }
    
    public void setDeliveryState(String deliveryState) {
        this.deliveryState = deliveryState;
    }
    public String getDeliveryCountry() {
        return this.deliveryCountry;
    }
    
    public void setDeliveryCountry(String deliveryCountry) {
        this.deliveryCountry = deliveryCountry;
    }
    public int getDeliveryAddressFormatId() {
        return this.deliveryAddressFormatId;
    }
    
    public void setDeliveryAddressFormatId(int deliveryAddressFormatId) {
        this.deliveryAddressFormatId = deliveryAddressFormatId;
    }
    public String getDeliveryTelephone() {
        return this.deliveryTelephone;
    }
    
    public void setDeliveryTelephone(String deliveryTelephone) {
        this.deliveryTelephone = deliveryTelephone;
    }
    public String getDeliveryCpf() {
        return this.deliveryCpf;
    }
    
    public void setDeliveryCpf(String deliveryCpf) {
        this.deliveryCpf = deliveryCpf;
    }
    public String getBillingName() {
        return this.billingName;
    }
    
    public void setBillingName(String billingName) {
        this.billingName = billingName;
    }
    public String getBillingCompany() {
        return this.billingCompany;
    }
    
    public void setBillingCompany(String billingCompany) {
        this.billingCompany = billingCompany;
    }
    public String getBillingStreetAddress() {
        return this.billingStreetAddress;
    }
    
    public void setBillingStreetAddress(String billingStreetAddress) {
        this.billingStreetAddress = billingStreetAddress;
    }
    public String getBillingSuburb() {
        return this.billingSuburb;
    }
    
    public void setBillingSuburb(String billingSuburb) {
        this.billingSuburb = billingSuburb;
    }
    public String getBillingCity() {
        return this.billingCity;
    }
    
    public void setBillingCity(String billingCity) {
        this.billingCity = billingCity;
    }
    public String getBillingPostcode() {
        return this.billingPostcode;
    }
    
    public void setBillingPostcode(String billingPostcode) {
        this.billingPostcode = billingPostcode;
    }
    public String getBillingState() {
        return this.billingState;
    }
    
    public void setBillingState(String billingState) {
        this.billingState = billingState;
    }
    public String getBillingCountry() {
        return this.billingCountry;
    }
    
    public void setBillingCountry(String billingCountry) {
        this.billingCountry = billingCountry;
    }
    public int getBillingAddressFormatId() {
        return this.billingAddressFormatId;
    }
    
    public void setBillingAddressFormatId(int billingAddressFormatId) {
        this.billingAddressFormatId = billingAddressFormatId;
    }
    public String getPaymentMethod() {
        return this.paymentMethod;
    }
    
    public void setPaymentMethod(String paymentMethod) {
        this.paymentMethod = paymentMethod;
    }
    public String getPaymentModuleCode() {
        return this.paymentModuleCode;
    }
    
    public void setPaymentModuleCode(String paymentModuleCode) {
        this.paymentModuleCode = paymentModuleCode;
    }
    public String getShippingMethod() {
        return this.shippingMethod;
    }
    
    public void setShippingMethod(String shippingMethod) {
        this.shippingMethod = shippingMethod;
    }
    public String getShippingModuleCode() {
        return this.shippingModuleCode;
    }
    
    public void setShippingModuleCode(String shippingModuleCode) {
        this.shippingModuleCode = shippingModuleCode;
    }
    public String getCouponCode() {
        return this.couponCode;
    }
    
    public void setCouponCode(String couponCode) {
        this.couponCode = couponCode;
    }
    public String getCcType() {
        return this.ccType;
    }
    
    public void setCcType(String ccType) {
        this.ccType = ccType;
    }
    public String getCcOwner() {
        return this.ccOwner;
    }
    
    public void setCcOwner(String ccOwner) {
        this.ccOwner = ccOwner;
    }
    public String getCcNumber() {
        return this.ccNumber;
    }
    
    public void setCcNumber(String ccNumber) {
        this.ccNumber = ccNumber;
    }
    public String getCcExpires() {
        return this.ccExpires;
    }
    
    public void setCcExpires(String ccExpires) {
        this.ccExpires = ccExpires;
    }
    public byte[] getCcCvv() {
        return this.ccCvv;
    }
    
    public void setCcCvv(byte[] ccCvv) {
        this.ccCvv = ccCvv;
    }
    public Date getLastModified() {
        return this.lastModified;
    }
    
    public void setLastModified(Date lastModified) {
        this.lastModified = lastModified;
    }
    public Date getDatePurchased() {
        return this.datePurchased;
    }
    
    public void setDatePurchased(Date datePurchased) {
        this.datePurchased = datePurchased;
    }
    public int getOrdersStatus() {
        return this.ordersStatus;
    }
    
    public void setOrdersStatus(int ordersStatus) {
        this.ordersStatus = ordersStatus;
    }
    public Date getOrdersDateFinished() {
        return this.ordersDateFinished;
    }
    
    public void setOrdersDateFinished(Date ordersDateFinished) {
        this.ordersDateFinished = ordersDateFinished;
    }
    public String getCurrency() {
        return this.currency;
    }
    
    public void setCurrency(String currency) {
        this.currency = currency;
    }
    public BigDecimal getCurrencyValue() {
        return this.currencyValue;
    }
    
    public void setCurrencyValue(BigDecimal currencyValue) {
        this.currencyValue = currencyValue;
    }
    public BigDecimal getOrderTotal() {
        return this.orderTotal;
    }
    
    public void setOrderTotal(BigDecimal orderTotal) {
        this.orderTotal = orderTotal;
    }
    public BigDecimal getOrderTax() {
        return this.orderTax;
    }
    
    public void setOrderTax(BigDecimal orderTax) {
        this.orderTax = orderTax;
    }
    public int getPaypalIpnId() {
        return this.paypalIpnId;
    }
    
    public void setPaypalIpnId(int paypalIpnId) {
        this.paypalIpnId = paypalIpnId;
    }
    public String getIpAddress() {
        return this.ipAddress;
    }
    
    public void setIpAddress(String ipAddress) {
        this.ipAddress = ipAddress;
    }
    public String getOrdersTag() {
        return this.ordersTag;
    }
    
    public void setOrdersTag(String ordersTag) {
        this.ordersTag = ordersTag;
    }
    public String getOrdersFromCountry() {
        return this.ordersFromCountry;
    }
    
    public void setOrdersFromCountry(String ordersFromCountry) {
        this.ordersFromCountry = ordersFromCountry;
    }
    public String getOrdersToCountry() {
        return this.ordersToCountry;
    }
    
    public void setOrdersToCountry(String ordersToCountry) {
        this.ordersToCountry = ordersToCountry;
    }
    public String getTrackNumber() {
        return this.trackNumber;
    }
    
    public void setTrackNumber(String trackNumber) {
        this.trackNumber = trackNumber;
    }
    public Integer getVisitSessionsId() {
        return this.visitSessionsId;
    }
    
    public void setVisitSessionsId(Integer visitSessionsId) {
        this.visitSessionsId = visitSessionsId;
    }
    public String getTransactionId() {
        return this.transactionId;
    }
    
    public void setTransactionId(String transactionId) {
        this.transactionId = transactionId;
    }
    public String getPaypalAccount() {
        return this.paypalAccount;
    }
    
    public void setPaypalAccount(String paypalAccount) {
        this.paypalAccount = paypalAccount;
    }
    public String getSalerId() {
        return this.salerId;
    }
    
    public void setSalerId(String salerId) {
        this.salerId = salerId;
    }
    public Integer getOmsOrderId() {
        return this.omsOrderId;
    }
    
    public void setOmsOrderId(Integer omsOrderId) {
        this.omsOrderId = omsOrderId;
    }
    public Integer getCookieVisitSessionsId() {
        return this.cookieVisitSessionsId;
    }
    
    public void setCookieVisitSessionsId(Integer cookieVisitSessionsId) {
        this.cookieVisitSessionsId = cookieVisitSessionsId;
    }
    public int getStoreModuleId() {
        return this.storeModuleId;
    }
    
    public void setStoreModuleId(int storeModuleId) {
        this.storeModuleId = storeModuleId;
    }
    public short getIsPackaged() {
        return this.isPackaged;
    }
    
    public void setIsPackaged(short isPackaged) {
        this.isPackaged = isPackaged;
    }
    public Boolean getAsAGift() {
        return this.asAGift;
    }
    
    public void setAsAGift(Boolean asAGift) {
        this.asAGift = asAGift;
    }
    public int getUsePaypalAddress() {
        return this.usePaypalAddress;
    }
    
    public void setUsePaypalAddress(int usePaypalAddress) {
        this.usePaypalAddress = usePaypalAddress;
    }
    public String getVersionOfCode() {
        return this.versionOfCode;
    }
    
    public void setVersionOfCode(String versionOfCode) {
        this.versionOfCode = versionOfCode;
    }
    public Integer getTransportationsId() {
        return this.transportationsId;
    }
    
    public void setTransportationsId(Integer transportationsId) {
        this.transportationsId = transportationsId;
    }
    public Short getSendStoredProducts() {
        return this.sendStoredProducts;
    }
    
    public void setSendStoredProducts(Short sendStoredProducts) {
        this.sendStoredProducts = sendStoredProducts;
    }
    public String getPromoteReferral() {
        return this.promoteReferral;
    }
    
    public void setPromoteReferral(String promoteReferral) {
        this.promoteReferral = promoteReferral;
    }
    public int getAddressBookId() {
        return this.addressBookId;
    }
    
    public void setAddressBookId(int addressBookId) {
        this.addressBookId = addressBookId;
    }
    public Short getPaymentStatus() {
        return this.paymentStatus;
    }
    
    public void setPaymentStatus(Short paymentStatus) {
        this.paymentStatus = paymentStatus;
    }
    public String getOrdersToken() {
        return this.ordersToken;
    }
    
    public void setOrdersToken(String ordersToken) {
        this.ordersToken = ordersToken;
    }
    public String getOrdersSource() {
        return this.ordersSource;
    }
    
    public void setOrdersSource(String ordersSource) {
        this.ordersSource = ordersSource;
    }




}


