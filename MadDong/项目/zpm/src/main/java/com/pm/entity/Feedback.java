package com.pm.entity;

import java.util.Date;

/**
 * @author cjd
 *
 */
public class Feedback {
    private Integer fbkId;

    private User user;

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    private Date fbkTime;

    private String fbkState;

    private String fbkContent;

    public Integer getFbkId() {
        return fbkId;
    }

    public void setFbkId(Integer fbkId) {
        this.fbkId = fbkId;
    }

    public Date getFbkTime() {
        return fbkTime;
    }

    public void setFbkTime(Date fbkTime) {
        this.fbkTime = fbkTime;
    }

    public String getFbkState() {
        return fbkState;
    }

    public void setFbkState(String fbkState) {
        this.fbkState = fbkState == null ? null : fbkState.trim();
    }

    public String getFbkContent() {
        return fbkContent;
    }

    public void setFbkContent(String fbkContent) {
        this.fbkContent = fbkContent == null ? null : fbkContent.trim();
    }
}