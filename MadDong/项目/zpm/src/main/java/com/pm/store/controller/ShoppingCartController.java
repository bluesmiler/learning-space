package com.pm.store.controller;

import com.pm.entity.Goods;
import com.pm.entity.HotGoods;
import com.pm.entity.ShoppingCart;
import com.pm.store.biz.GoodsBiz;
import com.pm.store.biz.ShoppingCartBiz;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/cart")
public class ShoppingCartController {
    @Resource
    private ShoppingCartBiz shoppingCartBiz;
    @Resource
    private GoodsBiz goodsBiz;

    @ResponseBody
    @RequestMapping("/addGood")
    public String addGood(HttpServletRequest request){
        String name=request.getParameter("goodName");
        Goods goods=goodsBiz.findByName(name);
        Calendar calendar=Calendar.getInstance();
        String orderName=calendar.getTimeInMillis()+"";
        ShoppingCart shoppingCart=new ShoppingCart();
        shoppingCart.setOrderName(orderName);
        Date date=new Date();
        SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String nowTime=sdf.format(date);
        shoppingCart.setTime(nowTime);
        shoppingCart.setCount(1);
        shoppingCart.setName(goods.getName());
        shoppingCart.setPrice(goods.getPrice());
        shoppingCart.setImage(goods.getImage());
        shoppingCart.setUserId(1);
        shoppingCartBiz.save(shoppingCart);
        return "success";
    }

    @RequestMapping("/addHotGood")
    public String addHotGood(HotGoods hotGoods){
        Calendar calendar=Calendar.getInstance();
        String orderName=calendar.getTimeInMillis()+"";
        ShoppingCart shoppingCart=new ShoppingCart();
        shoppingCart.setOrderName(orderName);
        Date date=new Date();
        SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String nowTime=sdf.format(date);
        shoppingCart.setTime(nowTime);
        shoppingCart.setName(hotGoods.getName());
        return "/Good/test";
    }

    /**
     *根据用户id查找其购物车
     **/
    @RequestMapping("/list")
    public String list(Model model){
        int userId=1;
        List<ShoppingCart> list=shoppingCartBiz.findAll(userId);
        model.addAttribute("shoppingList",list);
        return "/Good/shopCart";
    }

    @RequestMapping("/delete")
    public String delete(int id){
        shoppingCartBiz.delete(id);
        return "redirect:/cart/list";
    }

    @ResponseBody
    @RequestMapping("/deleteBatch")
    public String deleteBatch(String newId){
        String ids=newId;
        String id[]=ids.split(",");
        List<String> list= Arrays.asList(id);
        for(String is:list){
            int in=Integer.parseInt(is);
            shoppingCartBiz.delete(in);
        }
        return "success";
    }
}
