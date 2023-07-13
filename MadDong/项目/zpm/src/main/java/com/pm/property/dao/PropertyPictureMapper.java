package com.pm.property.dao;

import com.pm.entity.vo.PropertyPicture;
import org.mybatis.spring.annotation.MapperScan;

import java.util.List;

@MapperScan
public interface PropertyPictureMapper {
    int deleteByPrimaryKey(Integer ppId);

    int insert(PropertyPicture record);

    int insertSelective(PropertyPicture record);

    PropertyPicture selectByPrimaryKey(Integer ppId);

    int updateByPrimaryKeySelective(PropertyPicture record);

    int updateByPrimaryKey(PropertyPicture record);

    List<PropertyPicture> findByComplainId(Integer complainId);

    List<PropertyPicture> findByFbkId(Integer fbkId);

    List<PropertyPicture> findByRepId(Integer repId);
}