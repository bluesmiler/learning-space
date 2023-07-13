package com.pm.entity.vo;

/**
 * 楼栋
 */

public class Bulidings {

    //楼栋编码
    private Integer coding;

    //楼栋名称
    private String bulidName;

    //房产证权利人
    private String obligee;

    //当前权利人
    private String nowObligee;

    //楼栋区域
    private String region;

    //小区(项目地址)
    private String address;

    //固定资产卡片号
    private String cardNumber;

    public Integer getCoding() {
        return coding;
    }

    public void setCoding(Integer coding) {
        this.coding = coding;
    }

    public String getBulidName() {
        return bulidName;
    }

    public void setBulidName(String bulidName) {
        this.bulidName = bulidName;
    }

    public String getObligee() {
        return obligee;
    }

    public void setObligee(String obligee) {
        this.obligee = obligee;
    }

    public String getNowObligee() {
        return nowObligee;
    }

    public void setNowObligee(String nowObligee) {
        this.nowObligee = nowObligee;
    }

    public String getRegion() {
        return region;
    }

    public void setRegion(String region) {
        this.region = region;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getCardNumber() {
        return cardNumber;
    }

    public void setCardNumber(String cardNumber) {
        this.cardNumber = cardNumber;
    }
}
