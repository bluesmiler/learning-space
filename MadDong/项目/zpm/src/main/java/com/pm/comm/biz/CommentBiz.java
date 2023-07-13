package com.pm.comm.biz;

import com.pm.comm.dao.CommentMapper;
import com.pm.entity.Comment;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
/**
 * @Author  张子杰
 * @Description: 评论
 * @Date: 11:56 2017/10/31 0031
 **/
@Service
public class CommentBiz {
    @Resource
    private CommentMapper commentMapper;

    public void saveComment(Comment comment){
        Date date = new Date();
        SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String nowTime=sdf.format(date);
        comment.setCommentTime(nowTime);
        commentMapper.insert(comment);
    }

    public List<Comment> findById(Integer congressHallId){
        return commentMapper.findById(congressHallId);
    }
}
