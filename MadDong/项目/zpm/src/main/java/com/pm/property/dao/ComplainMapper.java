package com.pm.property.dao;

import com.pm.entity.Complain;
import com.pm.entity.ComplainWithBLOBs;
import org.mybatis.spring.annotation.MapperScan;

import java.util.List;

/**
 * @author cjd
 *
 */
@MapperScan
public interface ComplainMapper {
    int deleteByPrimaryKey(Integer complainId);

    int insert(ComplainWithBLOBs record);

    int insertSelective(ComplainWithBLOBs record);

    ComplainWithBLOBs selectByPrimaryKey(Integer complainId);

    int updateByPrimaryKeySelective(ComplainWithBLOBs record);

    int updateByPrimaryKeyWithBLOBs(ComplainWithBLOBs record);

    int updateByPrimaryKey(Complain record);

    List<ComplainWithBLOBs> findAll();

    int findCount();

    void deleteBatch(int[] complainId);
}