package com.pm.property.dao;

import com.pm.entity.Picture;
import org.mybatis.spring.annotation.MapperScan;

@MapperScan
public interface PictureMapper {
    int deleteByPrimaryKey(Integer pictureId);

    int insert(Picture record);

    int insertSelective(Picture record);

    Picture selectByPrimaryKey(Integer pictureId);

    int updateByPrimaryKeySelective(Picture record);

    int updateByPrimaryKey(Picture record);
}