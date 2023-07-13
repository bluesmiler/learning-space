package com.pm.comm.dao;

import com.pm.entity.Activity;
import org.mybatis.spring.annotation.MapperScan;

@MapperScan
public interface ActivityMapper {
    int deleteByPrimaryKey(Integer actId);

    int insert(Activity record);

    int insertSelective(Activity record);

    Activity selectByPrimaryKey(Integer actId);

    int updateByPrimaryKeySelective(Activity record);

    int updateByPrimaryKeyWithBLOBs(Activity record);

    int updateByPrimaryKey(Activity record);
}