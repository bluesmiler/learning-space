package com.pm.store.dao;

import com.pm.entity.Goods;
import org.mybatis.spring.annotation.MapperScan;

import java.util.List;
@MapperScan
public interface GoodsDao {
    List<Goods> findAll();

    void delete(int id);

    Goods findById(int id);

    void save(Goods goods);

    int getCount();

    List<Goods> findByTypeId(int id);

    Goods findByName(String name);

    void updateBy(Goods goods);
}
