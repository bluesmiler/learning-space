package com.pm.store.biz;

import com.pm.entity.BusGood;
import com.pm.store.dao.BusGoodDao;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class BusGoodBiz {
    @Resource
    private BusGoodDao busGoodDao;

    public List<BusGood> findAllById(int busId){
        return busGoodDao.findAllById(busId);
    }

    public void delete(int id){
        busGoodDao.delete(id);
    }

    public void save(BusGood busGood){
        busGoodDao.save(busGood);
    }

    public BusGood findById(int id){
        return busGoodDao.findById(id);
    }

    public void updateBy(BusGood busGood){
        busGoodDao.updateBy(busGood);
    }
}
