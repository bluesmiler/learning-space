package com.pm.personal.controller;

import com.pm.entity.Unit;
import com.pm.personal.biz.UnitBiz;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/unit")
public class UnitController {

    @Autowired
    private UnitBiz unitBiz;

    @ResponseBody
    @RequestMapping("/findByCommId" )
    public List<Unit> findByCommId(int commId){
        List<Unit> unitList = unitBiz.findUnitByCommId(commId);
        return unitList;
    }

}
