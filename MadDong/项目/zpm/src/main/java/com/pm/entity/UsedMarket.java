package com.pm.entity;

import java.util.Date;

public class UsedMarket {
    private Integer goodId;

    private String goodName;

    private Integer goodPrice;

    private Integer userId;

    private String commAddress;

    private Date publishTime;

    private String goodDetail;

    public Integer getGoodId() {
        return goodId;
    }

    public void setGoodId(Integer goodId) {
        this.goodId = goodId;
    }

    public String getGoodName() {
        return goodName;
    }

    public void setGoodName(String goodName) {
        this.goodName = goodName == null ? null : goodName.trim();
    }

    public Integer getGoodPrice() {
        return goodPrice;
    }

    public void setGoodPrice(Integer goodPrice) {
        this.goodPrice = goodPrice;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getCommAddress() {
        return commAddress;
    }

    public void setCommAddress(String commAddress) {
        this.commAddress = commAddress == null ? null : commAddress.trim();
    }

    public Date getPublishTime() {
        return publishTime;
    }

    public void setPublishTime(Date publishTime) {
        this.publishTime = publishTime;
    }

    public String getGoodDetail() {
        return goodDetail;
    }

    public void setGoodDetail(String goodDetail) {
        this.goodDetail = goodDetail == null ? null : goodDetail.trim();
    }
}