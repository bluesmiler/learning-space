package com.pm.entity;

import java.util.List;

public class Help {
    private Integer helpId;

    private String helpHeadline;

    private String helpTime;

    private String helpContent;

    private int userId;

    private User user;

    private List<HelpPicture> helpPictures;

    public Integer getHelpId() {
        return helpId;
    }

    public void setHelpId(Integer helpId) {
        this.helpId = helpId;
    }

    public String getHelpHeadline() {
        return helpHeadline;
    }

    public void setHelpHeadline(String helpHeadline) {
        this.helpHeadline = helpHeadline;
    }


    public String getHelpContent() {
        return helpContent;
    }

    public void setHelpContent(String helpContent) {
        this.helpContent = helpContent;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public List<HelpPicture> getHelpPictures() {
        return helpPictures;
    }

    public void setHelpPictures(List<HelpPicture> helpPictures) {
        this.helpPictures = helpPictures;
    }

    public String getHelpTime() {
        return helpTime;
    }

    public void setHelpTime(String helpTime) {
        this.helpTime = helpTime;
    }
}