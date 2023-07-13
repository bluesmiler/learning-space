package com.pm.comm.dao;

import com.pm.entity.ActivityParticipants;
import org.mybatis.spring.annotation.MapperScan;

@MapperScan
public interface ActivityParticipantsMapper {
    int deleteByPrimaryKey(Integer ppId);

    int insert(ActivityParticipants record);

    int insertSelective(ActivityParticipants record);

    ActivityParticipants selectByPrimaryKey(Integer ppId);

    int updateByPrimaryKeySelective(ActivityParticipants record);

    int updateByPrimaryKey(ActivityParticipants record);
}