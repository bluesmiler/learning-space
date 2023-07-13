package com.pm.property.biz;

import com.pm.entity.Sendwater;
import com.pm.property.dao.SendwaterMapper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;

@Service
public class SendwaterBiz {
    @Resource
    private SendwaterMapper sendwaterMapper;
    public void insertSelective(Sendwater sendwater) {
        sendwater.setOrderTime(new Date());
        sendwaterMapper.insertSelective(sendwater);
    }

    public List<Sendwater> findAll() {
        return sendwaterMapper.findAll();
    }

    public int findCount() {
        return sendwaterMapper.findCount();
    }

    public void deleteBatch(int[] cjd) {
        sendwaterMapper.deleteBatch(cjd);
    }
}
