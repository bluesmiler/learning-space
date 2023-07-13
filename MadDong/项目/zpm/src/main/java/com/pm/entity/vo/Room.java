package com.pm.entity.vo;

/**
 * 房间
 */
public class Room {
    //房间编码
    private Integer coding;
    //房间名称
    private String roomName;
    //楼层
    private String floor;
    //是否有铺位
    private boolean statusBunk;
    //可用面积
    private double userableArea;
    //租用面积
    private double rentedArea;
    //铺位数
    private Integer bunk;
    //使用状态（枚举类）

    //备注
    private String remark;

    public Integer getCoding() {
        return coding;
    }

    public void setCoding(Integer coding) {
        this.coding = coding;
    }

    public String getRoomName() {
        return roomName;
    }

    public void setRoomName(String roomName) {
        this.roomName = roomName;
    }

    public String getFloor() {
        return floor;
    }

    public void setFloor(String floor) {
        this.floor = floor;
    }

    public boolean isStatusBunk() {
        return statusBunk;
    }

    public void setStatusBunk(boolean statusBunk) {
        this.statusBunk = statusBunk;
    }

    public double getUserableArea() {
        return userableArea;
    }

    public void setUserableArea(double userableArea) {
        this.userableArea = userableArea;
    }

    public double getRentedArea() {
        return rentedArea;
    }

    public void setRentedArea(double rentedArea) {
        this.rentedArea = rentedArea;
    }

    public Integer getBunk() {
        return bunk;
    }

    public void setBunk(Integer bunk) {
        this.bunk = bunk;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }
}
