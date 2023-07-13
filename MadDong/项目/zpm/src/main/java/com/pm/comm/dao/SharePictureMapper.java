package com.pm.comm.dao;

import com.pm.entity.SharePicture;
import org.mybatis.spring.annotation.MapperScan;

@MapperScan
public interface SharePictureMapper {

    void insert(SharePicture sharePicture);
}
