package com.pm.entity;

import java.util.Date;

public class Complain {
    private Integer complainId;

    private User user;

    private Date complainTime;

    private Date fdbTime;

    private Integer fdbSituation;

    private String handleman;

    public Integer getComplainId() {
        return complainId;
    }

    public void setComplainId(Integer complainId) {
        this.complainId = complainId;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Date getComplainTime() {
        return complainTime;
    }

    public void setComplainTime(Date complainTime) {
        this.complainTime = complainTime;
    }

    public Date getFdbTime() {
        return fdbTime;
    }

    public void setFdbTime(Date fdbTime) {
        this.fdbTime = fdbTime;
    }

    public Integer getFdbSituation() {
        return fdbSituation;
    }

    public void setFdbSituation(Integer fdbSituation) {
        this.fdbSituation = fdbSituation;
    }

    public String getHandleman() {
        return handleman;
    }

    public void setHandleman(String handleman) {
        this.handleman = handleman == null ? null : handleman.trim();
    }
}