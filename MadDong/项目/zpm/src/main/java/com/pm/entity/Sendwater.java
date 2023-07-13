package com.pm.entity;

import java.util.Date;

public class Sendwater {
    private Integer waterId;

    private User user;

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    private Date orderTime;

    private Integer orderCount;

    private String orderBand;

    private Integer orderBarrel;

    public Integer getWaterId() {
        return waterId;
    }

    public void setWaterId(Integer waterId) {
        this.waterId = waterId;
    }


    public Date getOrderTime() {
        return orderTime;
    }

    public void setOrderTime(Date orderTime) {
        this.orderTime = orderTime;
    }

    public Integer getOrderCount() {
        return orderCount;
    }

    public void setOrderCount(Integer orderCount) {
        this.orderCount = orderCount;
    }

    public String getOrderBand() {
        return orderBand;
    }

    public void setOrderBand(String orderBand) {
        this.orderBand = orderBand == null ? null : orderBand.trim();
    }

    public Integer getOrderBarrel() {
        return orderBarrel;
    }

    public void setOrderBarrel(Integer orderBarrel) {
        this.orderBarrel = orderBarrel;
    }
}