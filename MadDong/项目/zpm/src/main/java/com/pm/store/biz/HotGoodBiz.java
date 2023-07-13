package com.pm.store.biz;

import com.pm.entity.HotGoods;
import com.pm.store.dao.HotGoodsDao;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class HotGoodBiz {
    @Resource
    private HotGoodsDao hotGoodsDao;

    public List<HotGoods> findAll(){
        return hotGoodsDao.findAll();
    }

    public HotGoods findById(int id){
        return hotGoodsDao.findById(id);
    }
}
