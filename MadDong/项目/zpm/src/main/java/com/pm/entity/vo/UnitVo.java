package com.pm.entity.vo;

import com.pm.entity.Home;

import java.util.List;

public class UnitVo {
    private int unitId;
    private String unitName;
    private int commId;
    private List<Home> homes;


    public int getCommId() {
        return commId;
    }

    public void setCommId(int commId) {
        this.commId = commId;
    }

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

    public List<Home> getHomes() {
        return homes;
    }

    public void setHomes(List<Home> homes) {
        this.homes = homes;
    }
}
