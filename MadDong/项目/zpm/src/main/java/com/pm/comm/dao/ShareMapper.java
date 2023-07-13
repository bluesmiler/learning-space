package com.pm.comm.dao;

import com.pm.entity.Share;
import org.mybatis.spring.annotation.MapperScan;

import java.util.List;

@MapperScan
public interface ShareMapper {

    List<Share> findByAll();

    void insert(Share share);

    Share findById(Integer shareId);

    void delete(Integer shareId);

    List<Share> findByUsertId(int userId);
}