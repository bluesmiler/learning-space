package com.pm.property.biz;

import com.pm.entity.Picture;
import com.pm.property.dao.PictureMapper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
public class PictureBiz {
    @Resource
    private PictureMapper pictureMapper;
    public int insertSelective(Picture picture) {
        return pictureMapper.insertSelective(picture);
    }
}
