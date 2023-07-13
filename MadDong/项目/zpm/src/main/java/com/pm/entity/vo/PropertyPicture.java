package com.pm.entity.vo;

import com.pm.entity.Picture;

public class PropertyPicture extends Picture{
    private Integer ppId;

    private Integer repId;

    private Picture picture;

    private Integer complainId;

    private Integer waterId;

    private Integer fbkId;

    public Integer getPpId() {
        return ppId;
    }

    public void setPpId(Integer ppId) {
        this.ppId = ppId;
    }

    public Integer getRepId() {
        return repId;
    }

    public void setRepId(Integer repId) {
        this.repId = repId;
    }

    public Picture getPicture() {
        return picture;
    }

    public void setPicture(Picture picture) {
        this.picture = picture;
    }

    public Integer getComplainId() {
        return complainId;
    }

    public void setComplainId(Integer complainId) {
        this.complainId = complainId;
    }

    public Integer getWaterId() {
        return waterId;
    }

    public void setWaterId(Integer waterId) {
        this.waterId = waterId;
    }

    public Integer getFbkId() {
        return fbkId;
    }

    public void setFbkId(Integer fbkId) {
        this.fbkId = fbkId;
    }
}