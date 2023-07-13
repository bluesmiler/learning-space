package com.pm.entity;

import java.util.Date;

public class Reply {
    private Integer replyId;

    private String replyTime;

    private Integer userId;

    private Integer replyDianzan;

    private Integer commentId;

    private String replyContent;

    private User user;

    private int congressHallId;

    public int getCongressHallId() {
        return congressHallId;
    }

    public void setCongressHallId(int congressHallId) {
        this.congressHallId = congressHallId;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Integer getReplyId() {
        return replyId;
    }

    public void setReplyId(Integer replyId) {
        this.replyId = replyId;
    }

    public String getReplyTime() {
        return replyTime;
    }

    public void setReplyTime(String replyTime) {
        this.replyTime = replyTime;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public Integer getReplyDianzan() {
        return replyDianzan;
    }

    public void setReplyDianzan(Integer replyDianzan) {
        this.replyDianzan = replyDianzan;
    }

    public Integer getCommentId() {
        return commentId;
    }

    public void setCommentId(Integer commentId) {
        this.commentId = commentId;
    }

    public String getReplyContent() {
        return replyContent;
    }

    public void setReplyContent(String replyContent) {
        this.replyContent = replyContent == null ? null : replyContent.trim();
    }
}