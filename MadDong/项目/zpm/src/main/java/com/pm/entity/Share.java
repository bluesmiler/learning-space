package com.pm.entity;

import java.util.List;

public class Share {
    private Integer shareId;

    private String shareTime;

    private Integer userId;

    private String shareHeadline;

    private String shareContent;

    private User user;

    private List<SharePicture> sharePictures;

    public Integer getShareId() {
        return shareId;
    }

    public void setShareId(Integer shareId) {
        this.shareId = shareId;
    }

    public String getShareTime() {
        return shareTime;
    }

    public void setShareTime(String shareTime) {
        this.shareTime = shareTime;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getShareHeadline() {
        return shareHeadline;
    }

    public void setShareHeadline(String shareHeadline) {
        this.shareHeadline = shareHeadline;
    }

    public String getShareContent() {
        return shareContent;
    }

    public void setShareContent(String shareContent) {
        this.shareContent = shareContent;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public List<SharePicture> getSharePictures() {
        return sharePictures;
    }

    public void setSharePictures(List<SharePicture> sharePictures) {
        this.sharePictures = sharePictures;
    }

}