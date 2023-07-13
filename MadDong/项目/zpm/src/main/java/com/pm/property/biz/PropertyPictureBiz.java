package com.pm.property.biz;

import com.pm.entity.vo.PropertyPicture;
import com.pm.property.dao.PropertyPictureMapper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class PropertyPictureBiz {
    @Resource
    private PropertyPictureMapper propertyPictureMapper;
    public int insertSelective(PropertyPicture picture) {
        return propertyPictureMapper.insertSelective(picture);
    }

    public List<PropertyPicture> findByComplainId(Integer complainId) {
        return propertyPictureMapper.findByComplainId(complainId);
    }

    public List<PropertyPicture> findByFeedbackId(Integer fbkId) {
        return propertyPictureMapper.findByFbkId(fbkId);
    }

    public List<PropertyPicture> findByRepId(Integer repId) {
        return propertyPictureMapper.findByRepId(repId);
    }
}
