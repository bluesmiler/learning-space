package com.pm.entity.vo;

/**
 * 项目
 */
public class Project {
    //项目编码
    private Integer coding;
    //项目名称
    private String proName;
    //项目地址
    private String address;
    //项目区域
    private String region;
    //项目区域
    private String area;
    //启用状态
    private Integer status;
    //项目备注
    private String remark;

    public int getCoding() {
        return coding;
    }

    public void setCoding(int coding) {
        this.coding = coding;
    }

    public String getProName() {
        return proName;
    }

    public void setProName(String proName) {
        this.proName = proName;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getRegion() {
        return region;
    }

    public void setRegion(String region) {
        this.region = region;
    }

    public String getArea() {
        return area;
    }

    public void setArea(String area) {
        this.area = area;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }
}
