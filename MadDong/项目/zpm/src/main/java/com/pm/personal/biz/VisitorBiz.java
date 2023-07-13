package com.pm.personal.biz;

import com.pm.entity.Visitor;
import com.pm.personal.dao.VisitorDao;
import com.pm.utils.QRCodeUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.sql.Date;
import java.util.List;
import java.util.UUID;

@Service
public class VisitorBiz {
    @Autowired
    private VisitorDao visitorDao;

    public List<Visitor> findVisitorByUserId(int userId){
        return visitorDao.findVisitorByUserId(userId);
    }

    public void deleteVisitorByUserId(int userId){
        visitorDao.deleteVisitorByUserId(userId);
    }


    public void saveVisitor(Visitor visitor){

        Date createTime =Date.valueOf(LocalDate.now());
        visitor.setCreateTime(createTime);

        //保存visitor
        visitorDao.saveVisitor(visitor);
        //创建二维码图片并且保存到磁盘中
        QRCodeUtil.saveQRC(visitor.getCodeName());
    }
    public void deleteVisitorByVisitorId(int visitorId){
        visitorDao.deleteVisitorByVisitorId(visitorId);
    }

}
