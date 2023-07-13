package com.pm.entity;

import java.util.Date;

public class Activity {
    private Integer actId;

    private String actTheme;

    private Integer commId;

    private Date sTime;

    private Date fTime;

    private String actContent;

    public Integer getActId() {
        return actId;
    }

    public void setActId(Integer actId) {
        this.actId = actId;
    }

    public String getActTheme() {
        return actTheme;
    }

    public void setActTheme(String actTheme) {
        this.actTheme = actTheme == null ? null : actTheme.trim();
    }

    public Integer getCommId() {
        return commId;
    }

    public void setCommId(Integer commId) {
        this.commId = commId;
    }

    public Date getsTime() {
        return sTime;
    }

    public void setsTime(Date sTime) {
        this.sTime = sTime;
    }

    public Date getfTime() {
        return fTime;
    }

    public void setfTime(Date fTime) {
        this.fTime = fTime;
    }

    public String getActContent() {
        return actContent;
    }

    public void setActContent(String actContent) {
        this.actContent = actContent == null ? null : actContent.trim();
    }
}