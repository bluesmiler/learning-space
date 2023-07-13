package com.pm.store.dao;

import com.pm.entity.Business;
import org.apache.ibatis.annotations.Param;
import org.mybatis.spring.annotation.MapperScan;

import java.util.List;

@MapperScan
public interface BusinessDao {
    void save(Business business);

    void delete(int id);

    Business login(@Param("userName")String userName,@Param("password")String password);

    List<Business> findAll();

    Business findById(int id);
}
