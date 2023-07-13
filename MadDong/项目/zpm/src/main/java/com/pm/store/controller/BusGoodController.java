package com.pm.store.controller;

import com.pm.store.biz.BusGoodBiz;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;

@Controller
@RequestMapping("/busGood")
public class BusGoodController {
    @Resource
    private BusGoodBiz busGoodBiz;


}
