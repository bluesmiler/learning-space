package com.pm.entity;

public class Picture {
    private Integer pictureId;

    private String pictureImg;

    private String pictureName;

    public Integer getPictureId() {
        return pictureId;
    }

    public void setPictureId(Integer pictureId) {
        this.pictureId = pictureId;
    }

    public String getPictureImg() {
        return pictureImg;
    }

    public void setPictureImg(String pictureImg) {
        this.pictureImg = pictureImg == null ? null : pictureImg.trim();
    }

    public String getPictureName() {
        return pictureName;
    }

    public void setPictureName(String pictureName) {
        this.pictureName = pictureName == null ? null : pictureName.trim();
    }
}