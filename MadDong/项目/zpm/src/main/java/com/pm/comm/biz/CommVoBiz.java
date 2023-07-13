package com.pm.comm.biz;

import com.pm.comm.dao.CommVoDao;
import com.pm.entity.vo.Project;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CommVoBiz {
    @Autowired
    private CommVoDao commVoDao;

    public List<Project> findAll(){
        return commVoDao.findAll();
    }
}
