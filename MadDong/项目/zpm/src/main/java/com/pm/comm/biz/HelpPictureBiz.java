package com.pm.comm.biz;

import com.pm.comm.dao.HelpPictureMapper;
import com.pm.entity.HelpPicture;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
public class HelpPictureBiz {

    @Resource
    HelpPictureMapper helpPictureMapper;

    public void savePicture(HelpPicture helpPicture){
        helpPictureMapper.insert(helpPicture);
    }
}
