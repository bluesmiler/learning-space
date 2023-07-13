package com.pm.store.dao;

import com.pm.entity.HotGoods;
import org.mybatis.spring.annotation.MapperScan;

import java.util.List;

@MapperScan
public interface HotGoodsDao {
    List<HotGoods> findAll();

    void delete(int id);

    void save(HotGoods hotGoods);

    HotGoods findById(int id);
}
