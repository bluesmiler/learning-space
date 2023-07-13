package com.pm.comm.biz;

import com.pm.comm.dao.CongPictureMapper;
import com.pm.entity.CongPictuer;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
public class CongPictureBiz {
    @Resource
    CongPictureMapper congPictureMapper;

    public void saveCongPicture(CongPictuer congPictuer){
        congPictureMapper.insert(congPictuer);
    }
}
