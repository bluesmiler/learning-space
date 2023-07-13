package com.pm.comm.dao;

import com.pm.entity.CongressHall;
import org.mybatis.spring.annotation.MapperScan;

import java.util.List;

@MapperScan
public interface CongressHallMapper {

    List<CongressHall> findByAll();

    void insert(CongressHall congressHall);

    CongressHall findById(Integer congressHallId);

    void delete(Integer congressHallId);

    List<CongressHall> findByUsertId(int userId);
}