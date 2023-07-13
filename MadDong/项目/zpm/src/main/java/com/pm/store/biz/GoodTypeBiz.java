package com.pm.store.biz;

import com.pm.entity.GoodType;
import com.pm.store.dao.GoodTypeDao;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class GoodTypeBiz {
    @Resource
    private GoodTypeDao goodTypeDao;
    public List<GoodType> findAll(){
        return goodTypeDao.findAll();
    }

    public GoodType findById(int id){
        return goodTypeDao.findById(id);
    }
}
