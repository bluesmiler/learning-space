package com.pm.entity;


import java.util.List;

public class Comment {
    private Integer commentId;

    private String commentTime;

    private Integer userId;

    private Integer helpId;

    private Integer commentDianzan;

    private Integer shareId;

    private Integer congressHallId;

    private Integer actId;

    private Integer goodId;

    private String commentContent;

    private User user;

    private List<Reply> replyList;

    public List<Reply> getReplyList() {
        return replyList;
    }

    public void setReplyList(List<Reply> replyList) {
        this.replyList = replyList;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Integer getCommentId() {
        return commentId;
    }

    public void setCommentId(Integer commentId) {
        this.commentId = commentId;
    }

    public String getCommentTime() {
        return commentTime;
    }

    public void setCommentTime(String commentTime) {
        this.commentTime = commentTime;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public Integer getHelpId() {
        return helpId;
    }

    public void setHelpId(Integer helpId) {
        this.helpId = helpId;
    }

    public Integer getCommentDianzan() {
        return commentDianzan;
    }

    public void setCommentDianzan(Integer commentDianzan) {
        this.commentDianzan = commentDianzan;
    }

    public Integer getShareId() {
        return shareId;
    }

    public void setShareId(Integer shareId) {
        this.shareId = shareId;
    }

    public Integer getCongressHallId() {
        return congressHallId;
    }

    public void setCongressHallId(Integer congressHallId) {
        this.congressHallId = congressHallId;
    }

    public Integer getActId() {
        return actId;
    }

    public void setActId(Integer actId) {
        this.actId = actId;
    }

    public Integer getGoodId() {
        return goodId;
    }

    public void setGoodId(Integer goodId) {
        this.goodId = goodId;
    }

    public String getCommentContent() {
        return commentContent;
    }

    public void setCommentContent(String commentContent) {
        this.commentContent = commentContent == null ? null : commentContent.trim();
    }
}