package com.pm.store.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.pm.entity.BusGood;
import com.pm.entity.Business;
import com.pm.store.biz.BusGoodBiz;
import com.pm.store.biz.BusinessBiz;
import com.pm.utils.Constants;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.util.List;
import java.util.UUID;

@Controller
@RequestMapping("/bus")
public class BusinessController {
    @Resource
    private BusinessBiz businessBiz;
    @Resource
    private BusGoodBiz busGoodBiz;

    @RequestMapping("/save")
    public String regist(Business business,MultipartHttpServletRequest request)throws Exception{
        MultipartFile file=request.getFile("file");
        String imageName=UUID.randomUUID().toString();
        File photo=new File(Constants.IMAGE_PATH+imageName);
        file.transferTo(photo);
        business.setImage(imageName);
        businessBiz.save(business);
        return "/Good/login";
    }

    @RequestMapping("/doRegist")
    public  String doRegist(){
        return "/Good/regist";
    }

    @RequestMapping("/login")
    public String login(){
        return "/Good/login";
    }

    @RequestMapping("/doLogin")
    public String myBus(String userName, String passWord, HttpServletRequest request){
        Business business=businessBiz.login(userName,passWord);
        if(business!=null){
            request.getSession().setAttribute("business",business);
            return "redirect:/bus/list";
        }
        return null;
    }

    @RequestMapping("/list")
    public String list(Model model,HttpServletRequest request,@RequestParam(required=true,defaultValue="1") Integer page){
        PageHelper.startPage(page, 5);
        Business business=(Business)request.getSession().getAttribute("business");
        int busId=business.getId();
        List<BusGood> list=busGoodBiz.findAllById(busId);
        PageInfo<BusGood> p=new PageInfo<BusGood>(list);
        model.addAttribute("page", p);
        model.addAttribute("list",list);
        model.addAttribute("business",business);
        return "/Good/busGood";
    }

    @RequestMapping("/preAdd")
    public String preAdd(){
        return "/Good/addGood";
    }

    @RequestMapping("/add")
    public String add(BusGood busGood, HttpServletRequest request, MultipartHttpServletRequest requests)throws Exception{
        MultipartFile file=requests.getFile("file");
        String imageName= UUID.randomUUID().toString();
        File photo=new File(Constants.IMAGE_PATH+imageName);
        file.transferTo(photo);
        busGood.setImage(imageName);
        Business business=(Business)request.getSession().getAttribute("business");
        busGood.setBusId(business.getId());
        busGoodBiz.save(busGood);
        return "redirect:/bus/list";
    }

    @RequestMapping("/delete")
    public String delete(int id){
        busGoodBiz.delete(id);
        return "redirect:/bus/list";
    }

    //后台修改商品信息
    @RequestMapping("/preModify")
    public  String preModify(int id,Model model){
        BusGood good=busGoodBiz.findById(id);
        Business business=businessBiz.findById(good.getBusId());
        model.addAttribute("good",good);
        model.addAttribute("business",business);
        return "/Good/busGoodModify";
    }

    @RequestMapping("/modify")
    public String modify(MultipartHttpServletRequest request,BusGood busGood)throws Exception{
        if(busGood.getImage()==null){
            busGood.setImage(busGoodBiz.findById(busGood.getId()).getImage());
            busGoodBiz.updateBy(busGood);
        }else{
            MultipartFile file=request.getFile("file");
            String imageName=UUID.randomUUID().toString();
            File photo=new File(Constants.IMAGE_PATH+imageName);
            file.transferTo(photo);
            busGood.setImage(imageName);
            busGoodBiz.updateBy(busGood);
        }
        return "redirect:/bus/list";
    }


    //周边商户给前端传值

    //显示所有商户
    @RequestMapping("/allBus")
    public  String allBus(Model model,@RequestParam(required=true,defaultValue="1") Integer page){
        PageHelper.startPage(page, 5);
        List<Business> list=businessBiz.findAll();
        PageInfo<Business> p=new PageInfo<Business>(list);
        model.addAttribute("page", p);
        model.addAttribute("list",list);
        return "/Good/busBefore";
    }

    //查看商户的所拥有的商品
    @RequestMapping("/watch")
    public String watch(int id,Model model,@RequestParam(required=true,defaultValue="1") Integer page){
        PageHelper.startPage(page, 5);
        Business business=businessBiz.findById(id);
        model.addAttribute("business",business);
        List<BusGood> list=busGoodBiz.findAllById(id);
        PageInfo<BusGood> p=new PageInfo<BusGood>(list);
        model.addAttribute("page", p);
        model.addAttribute("list",list);
        return "/Good/shopDetail";
    }

    //查看一个商品的详情
    @RequestMapping("/showDetail")
    public String showDetail(int id,Model model){
        BusGood busGood=busGoodBiz.findById(id);
        model.addAttribute("busGood",busGood);
        return "/Good/detail";
    }
}
