package com.pm.comm.dao;

import com.pm.entity.CongPictuer;
import org.mybatis.spring.annotation.MapperScan;

@MapperScan
public interface CongPictureMapper {
    void insert(CongPictuer congPictuer);
}
