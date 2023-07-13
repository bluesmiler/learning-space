package com.pm.entity;


public class Unit {
    private int unitId;
    private String unitName;
    private int commId;
    private Comm comm;

    public int getUnitId() {
        return unitId;
    }

    public void setUnitId(int unitId) {
        this.unitId = unitId;
    }

    public String getUnitName() {
        return unitName;
    }

    public void setUnitName(String unitName) {
        this.unitName = unitName;
    }

    public int getCommId() {
        return commId;
    }

    public void setCommId(int commId) {
        this.commId = commId;
    }

    public Comm getComm() {
        return comm;
    }

    public void setComm(Comm comm) {
        this.comm = comm;
    }
}
