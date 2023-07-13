package com.pm.store.dao;

import com.pm.entity.BusGood;
import org.mybatis.spring.annotation.MapperScan;

import java.util.List;

@MapperScan
public interface BusGoodDao {
    List<BusGood> findAllById(int busId);

    void save(BusGood busGood);

    void delete(int id);

    List<BusGood> findAll();

    BusGood findById(int id);

    void updateBy(BusGood busGood);
}
