package com.pm.comm.dao;

import com.pm.entity.HelpPicture;
import org.mybatis.spring.annotation.MapperScan;

@MapperScan
public interface HelpPictureMapper {

    void insert(HelpPicture helpPicture);
}
