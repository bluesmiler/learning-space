package com.pm.store.controller;

import com.pm.store.dao.GoodTypeDao;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
@RequestMapping("/type")
@Controller
public class GoodTypeController {
    @Resource
    private GoodTypeDao goodTypeDao;



}
