package com.pm.comm.biz;

import com.pm.comm.dao.Homedao;
import com.pm.entity.Home;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class  HomeBiz {
    @Autowired
    private Homedao homedao;

    public List<Home> findAllByUnitId(int commId){
        return homedao.findAllByUnitId(commId);
    }
}
