package com.pm.comm.dao;

import com.pm.entity.Reply;
import org.mybatis.spring.annotation.MapperScan;

import java.util.List;

@MapperScan
public interface ReplyMapper {

    void insert(Reply reply);

    List<Reply> findById(Integer commentId);
    List<Reply> findByCommentId(Integer commentId);
}