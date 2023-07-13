package com.pm.comm.dao;

import com.pm.entity.UsedMarket;
import org.mybatis.spring.annotation.MapperScan;

@MapperScan
public interface UsedMarketMapper {
    int deleteByPrimaryKey(Integer goodId);

    int insert(UsedMarket record);

    int insertSelective(UsedMarket record);

    UsedMarket selectByPrimaryKey(Integer goodId);

    int updateByPrimaryKeySelective(UsedMarket record);

    int updateByPrimaryKeyWithBLOBs(UsedMarket record);

    int updateByPrimaryKey(UsedMarket record);
}