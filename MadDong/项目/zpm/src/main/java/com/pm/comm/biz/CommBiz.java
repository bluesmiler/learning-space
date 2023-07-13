package com.pm.comm.biz;

import com.pm.comm.dao.Commdao;
import com.pm.entity.Comm;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CommBiz {
    @Autowired
    private Commdao commdao;

    public List<Comm> findAll(){
        return commdao.findAll();
    }
}
