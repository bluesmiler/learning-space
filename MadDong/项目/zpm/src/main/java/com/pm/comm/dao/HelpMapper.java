package com.pm.comm.dao;

import com.pm.entity.Help;
import org.mybatis.spring.annotation.MapperScan;

import java.util.List;

@MapperScan
public interface HelpMapper {

    List<Help> findByAll();

    void insert(Help help);

    Help findById(Integer helpId);
}