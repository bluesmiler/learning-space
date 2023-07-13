package com.pm.entity;

import java.util.List;

public class CongressHall {
    private Integer congressHallId;

    private String congressHallHeadline;

    private String congressHallTime;

    private String congressHallContent;

    private int userId;

    private User user;

    private List<CongPictuer> congPictuers;

    public Integer getCongressHallId() {
        return congressHallId;
    }

    public void setCongressHallId(Integer congressHallId) {
        this.congressHallId = congressHallId;
    }

    public String getCongressHallHeadline() {
        return congressHallHeadline;
    }

    public void setCongressHallHeadline(String congressHallHeadline) {
        this.congressHallHeadline = congressHallHeadline;
    }

    public String getCongressHallTime() {
        return congressHallTime;
    }

    public void setCongressHallTime(String congressHallTime) {
        this.congressHallTime = congressHallTime;
    }

    public String getCongressHallContent() {
        return congressHallContent;
    }

    public void setCongressHallContent(String congressHallContent) {
        this.congressHallContent = congressHallContent;
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

    public List<CongPictuer> getCongPictuers() {
        return congPictuers;
    }

    public void setCongPictuers(List<CongPictuer> congPictuers) {
        this.congPictuers = congPictuers;
    }
}