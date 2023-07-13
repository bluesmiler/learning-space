package com.pm.comm.biz;

import com.pm.comm.dao.SharePictureMapper;
import com.pm.entity.SharePicture;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
public class SharePictureBiz {
    @Resource
    SharePictureMapper sharePictureMapper;

    public void savepicture(SharePicture sharePicture){
        sharePictureMapper.insert(sharePicture);
    }
}
