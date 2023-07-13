package com.pm.store.dao;

import com.pm.entity.GoodType;
import org.mybatis.spring.annotation.MapperScan;

import java.util.List;
@MapperScan
public interface GoodTypeDao {
    List<GoodType> findAll();

    GoodType findById(int id);
}
