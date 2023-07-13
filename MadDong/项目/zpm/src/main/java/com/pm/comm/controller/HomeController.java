package com.pm.comm.controller;

import com.pm.comm.biz.HomeBiz;
import com.pm.comm.dao.Homedao;
import com.pm.entity.Home;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/home")
public class HomeController {
    @Autowired
    private HomeBiz homeBiz;

    @ResponseBody
    @RequestMapping("/findByUnitId")
    public List<Home> findAllByUnitId(int unitId){
       return homeBiz.findAllByUnitId(unitId);
    }
}
