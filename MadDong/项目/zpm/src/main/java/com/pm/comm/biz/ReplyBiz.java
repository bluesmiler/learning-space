package com.pm.comm.biz;

import com.pm.comm.dao.ReplyMapper;
import com.pm.entity.Reply;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Service
public class ReplyBiz {

    @Resource
    private ReplyMapper replyMapper;

    public List<Reply> findById(Integer commentId){
        return replyMapper.findById(commentId);
    }

    public void saveReply(Reply reply){
        Date date = new Date();
        SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String nowTime=sdf.format(date);
        reply.setReplyTime(nowTime);
        replyMapper.insert(reply);
    }
}
