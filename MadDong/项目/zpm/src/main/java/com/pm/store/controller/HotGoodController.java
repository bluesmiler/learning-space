package com.pm.store.controller;

import com.pm.entity.HotGoods;
import com.pm.store.biz.HotGoodBiz;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import java.util.List;

@Controller
@RequestMapping("/hot")
public class HotGoodController {
    @Resource
    private HotGoodBiz hotGoodBiz;

    @RequestMapping("list")
    public String list(Model model){
        List<HotGoods> list=hotGoodBiz.findAll();
        model.addAttribute("list",list);
        return "/Good/hotGood";
    }

    @RequestMapping("/more")
    public String more(int id,Model model){
        HotGoods hotGoods=hotGoodBiz.findById(id);
        model.addAttribute("busGood",hotGoods);
        return "/Good/detail";
    }
}
