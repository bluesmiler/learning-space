package com.pm.comm.biz;

import com.pm.comm.dao.ShareMapper;
import com.pm.entity.Share;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Service
public class ShareBiz {
    @Resource
    private ShareMapper shareMapper;

    public List<Share> findByAll(){
        return shareMapper.findByAll();
    }

    public void saveshare(Share share){
        Date date = new Date();
        SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String nowTime=sdf.format(date);
        share.setShareTime(nowTime);
        shareMapper.insert(share);
    }

    public Share findById(Integer shareId){
        return shareMapper.findById(shareId);
    }

    public void delete(Integer shareId){
        shareMapper.delete(shareId);
    }

    public List<Share> findByuserId(int userId){
        return shareMapper.findByUsertId(userId);
    }
}
