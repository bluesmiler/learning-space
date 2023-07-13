package com.pm.property.dao;

import com.pm.entity.Feedback;
import org.mybatis.spring.annotation.MapperScan;

import java.util.List;

/**
 * @author cjd
 *
 */
@MapperScan
public interface FeedbackMapper {
    int deleteByPrimaryKey(Integer fbkId);

    int insert(Feedback record);

    int insertSelective(Feedback record);

    Feedback selectByPrimaryKey(Integer fbkId);

    int updateByPrimaryKeySelective(Feedback record);

    int updateByPrimaryKeyWithBLOBs(Feedback record);

    int updateByPrimaryKey(Feedback record);

    int findCount();

    List<Feedback> findAll();

    void deleteBatch(int[] cjd);
}