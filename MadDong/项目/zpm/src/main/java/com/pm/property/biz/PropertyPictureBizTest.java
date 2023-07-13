package com.pm.property.biz;

import com.pm.property.dao.FeedbackMapper;
import com.pm.property.dao.PropertyPictureMapper;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;

@ContextConfiguration("classpath:spring.xml")
@RunWith(SpringJUnit4ClassRunner.class)
public class PropertyPictureBizTest {
    @Resource
    private PropertyPictureBiz propertyPictureBiz;
    @Resource
    private ComplainBiz complainBiz;
    @Resource
    private PropertyPictureMapper propertyPictureMapper;
    @Resource
    private FeedbackMapper feedbackMapper;
    @Test
    public void findByComplainId() throws Exception {
//        List<PropertyPicture> list=propertyPictureBiz.findByComplainId(12);
//        for(PropertyPicture pp:list){
//            System.out.println(pp.getPpId());
//        }
//        PropertyPicture pp=propertyPictureMapper.selectByPrimaryKey(28);
        feedbackMapper.findAll();
    }

}
