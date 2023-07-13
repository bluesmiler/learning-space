package com.pm.store.biz;

import com.pm.entity.Business;
import com.pm.store.dao.BusinessDao;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class BusinessBiz {
    @Resource
    private BusinessDao businessDao;

    public void save(Business business){
        businessDao.save(business);
    }

    public void delete(int id){
        businessDao.delete(id);
    }

    public Business login(String userName,String password){
        return businessDao.login(userName,password);
    }

    public List<Business> findAll(){
        return businessDao.findAll();
    }

    public Business findById(int id){
        return businessDao.findById(id);
    }
}
