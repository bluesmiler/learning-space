package com.pm.entity;

import java.util.Date;

public class Repairs {
    private Integer repId;

    private User user;

    private String repMan;

    private Date repCreatetime;

    private Date repTime;

    private Date repFinishTime;

    private Integer handleSituation;

    private String repContent;

    public Integer getRepId() {
        return repId;
    }

    public void setRepId(Integer repId) {
        this.repId = repId;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public String getRepMan() {
        return repMan;
    }

    public void setRepMan(String repMan) {
        this.repMan = repMan == null ? null : repMan.trim();
    }

    public Date getRepCreatetime() {
        return repCreatetime;
    }

    public void setRepCreatetime(Date repCreatetime) {
        this.repCreatetime = repCreatetime;
    }

    public Date getRepTime() {
        return repTime;
    }

    public void setRepTime(Date repTime) {
        this.repTime = repTime;
    }

    public Date getRepFinishTime() {
        return repFinishTime;
    }

    public void setRepFinishTime(Date repFinishTime) {
        this.repFinishTime = repFinishTime;
    }

    public Integer getHandleSituation() {
        return handleSituation;
    }

    public void setHandleSituation(Integer handleSituation) {
        this.handleSituation = handleSituation;
    }

    public String getRepContent() {
        return repContent;
    }

    public void setRepContent(String repContent) {
        this.repContent = repContent == null ? null : repContent.trim();
    }
}