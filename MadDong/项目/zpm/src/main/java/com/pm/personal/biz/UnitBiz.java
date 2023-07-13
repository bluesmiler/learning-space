package com.pm.personal.biz;

import com.pm.entity.Unit;
import com.pm.personal.dao.UnitDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UnitBiz {
    @Autowired
    private UnitDao unitDao;

    public List<Unit> findAll(){
        return unitDao.findAll();
    }



    public List<Unit> findUnitByCommId(int commId){
        return unitDao.findAllByCommId(commId);
    }
}
