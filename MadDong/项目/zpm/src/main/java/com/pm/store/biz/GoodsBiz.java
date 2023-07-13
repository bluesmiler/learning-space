package com.pm.store.biz;

import com.pm.entity.Goods;
import com.pm.store.dao.GoodsDao;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class GoodsBiz {
    @Resource
    private GoodsDao goodsDao;

    public List<Goods> findAll(){
        return goodsDao.findAll();
    }

    public Goods findById(int id){
        return goodsDao.findById(id);
    }

    public void delete(int id){
        goodsDao.delete(id);
    }

    public void save(Goods goods){
        goodsDao.save(goods);
    }

    public int getCount(){
        return goodsDao.getCount();
    }

    public List<Goods> findByTypeId(int id){
        return goodsDao.findByTypeId(id);
    }

    public Goods findByName(String name){
        return goodsDao.findByName(name);
    }

    public void updateBy(Goods goods){
        goodsDao.updateBy(goods);
    }
}
