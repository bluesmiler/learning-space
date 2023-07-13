package com.pm.comm.dao;

import com.pm.entity.Comment;
import org.mybatis.spring.annotation.MapperScan;

import java.util.List;

@MapperScan
public interface CommentMapper {

    void insert(Comment comment);
//    根据帖子Id查询评论
    List<Comment> findById(Integer congressHallId);
}