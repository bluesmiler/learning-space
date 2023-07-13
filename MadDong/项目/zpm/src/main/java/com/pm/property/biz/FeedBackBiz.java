package com.pm.property.biz;

import com.pm.entity.Feedback;
import com.pm.property.dao.FeedbackMapper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;

@Service
public class FeedBackBiz {
    @Resource
    private FeedbackMapper feedbackMapper;

    public int findCount() {
        return feedbackMapper.findCount();
    }

    public void insertSelective(Feedback feedback) {
        feedback.setFbkTime(new Date());
        feedbackMapper.insertSelective(feedback);
    }

    public List<Feedback> findAll() {
        return feedbackMapper.findAll();
    }

    public void deleteBatch(int[] cjd) {
        feedbackMapper.deleteBatch(cjd);
    }

    public Feedback findById(int feedbackId) {
        return feedbackMapper.selectByPrimaryKey(feedbackId);
    }

    public void updateByPrimaryKeySelective(Feedback feedback) {
        feedbackMapper.updateByPrimaryKeySelective(feedback);
    }
}
