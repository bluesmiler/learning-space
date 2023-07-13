package com.pm.property.dao;

import com.pm.entity.Repairs;
import org.mybatis.spring.annotation.MapperScan;

import java.util.List;

/**
 * @author cjd
 *
 *
 */
@MapperScan
public interface RepairsMapper {
    int deleteByPrimaryKey(Integer repId);

    int insert(Repairs record);

    int insertSelective(Repairs record);

    Repairs selectByPrimaryKey(Integer repId);

    int updateByPrimaryKeySelective(Repairs record);

    int updateByPrimaryKeyWithBLOBs(Repairs record);

    int updateByPrimaryKey(Repairs record);

    List<Repairs> findAll(int firstResult, int pageSize);

    int findCount();

    void deleteBatch(int[] arr);
}