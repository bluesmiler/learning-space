package com.pm.property.dao;

import com.pm.entity.Sendwater;
import org.mybatis.spring.annotation.MapperScan;

import java.util.List;

/**
 * @author cjd
 * 
 *
 */
@MapperScan
public interface SendwaterMapper {
    int deleteByPrimaryKey(Integer waterId);

    int insert(Sendwater record);

    int insertSelective(Sendwater record);

    Sendwater selectByPrimaryKey(Integer waterId);

    int updateByPrimaryKeySelective(Sendwater record);

    int updateByPrimaryKey(Sendwater record);

    List<Sendwater> findAll();

    int findCount();

    void deleteBatch(int[] arr);
}