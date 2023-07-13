package com.pm.store.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.pm.entity.GoodType;
import com.pm.entity.Goods;
import com.pm.store.biz.GoodTypeBiz;
import com.pm.store.biz.GoodsBiz;
import com.pm.utils.Constants;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.util.List;
import java.util.UUID;

@Controller
@RequestMapping("/good")
public class GoodsController {
    @Resource
    private GoodsBiz goodsBiz;
    @Resource
    private GoodTypeBiz goodTypeBiz;



    @RequestMapping("/preAdd")
    public String preAdd(Model model){
        List<GoodType> typeList=goodTypeBiz.findAll();
        model.addAttribute("type",typeList);
        return "/Good/test";
    }

    @RequestMapping("/add")
    public String add(MultipartHttpServletRequest request,Goods goods)throws Exception{
        MultipartFile file=request.getFile("file");
        String imageName= UUID.randomUUID().toString();
        File photo=new File(Constants.IMAGE_PATH+imageName);
        file.transferTo(photo);
        goods.setImage(imageName);
        goods.setImageReName(file.getOriginalFilename());
        goodsBiz.save(goods);
        return "redirect:/good/list";
    }

    @RequestMapping("/show/{image}")
    public void show(@PathVariable("image")String image, HttpServletResponse response){
        File file=new File(Constants.IMAGE_PATH+image);
        if(file.exists()){
            try {
                FileInputStream in=new FileInputStream(file);
                OutputStream out=response.getOutputStream();
                byte []buff=new byte[1024];
                int len=0;
                while ((len=in.read(buff))!=-1){
                    out.write(buff,0,len);
                }
                in.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }


    @RequestMapping("/delete")
    public String delete(int id){
        goodsBiz.delete(id);
        return "redirect:/good/list";
    }

    @RequestMapping("/preModify")
    public String preModify(int id,Model model){
        Goods goods=goodsBiz.findById(id);
        model.addAttribute("good",goods);
        List<GoodType> typeList=goodTypeBiz.findAll();
        model.addAttribute("type",typeList);
        return "Good/modify";
    }

    @RequestMapping("/modify")
    public String modify(Goods goods,MultipartHttpServletRequest request)throws Exception{
        if(goods.getImage()==null){
            goods.setImage(goodsBiz.findById(goods.getId()).getImage());
            goods.setImageReName(goodsBiz.findById(goods.getId()).getImageReName());
            goodsBiz.updateBy(goods);
        }else {
            MultipartFile file=request.getFile("file");
            String imageName=UUID.randomUUID().toString();
            File photo=new File(Constants.IMAGE_PATH+imageName);
            file.transferTo(photo);
            goods.setImage(imageName);
            goods.setImageReName(file.getOriginalFilename());
            goodsBiz.updateBy(goods);
        }
        return "redirect:/good/list";
    }

    //商品的前端显示
    //显示所有商品
    @RequestMapping("/list")
    public String list(Model model,@RequestParam(required=true,defaultValue="1") Integer page){
        PageHelper.startPage(page, 5);
        List<Goods> list = goodsBiz.findAll();
        PageInfo<Goods> p=new PageInfo<Goods>(list);
        model.addAttribute("page", p);
        model.addAttribute("list",list);
        return "/Good/shop";
    }

    //显示商品详情
    @RequestMapping("/detail")
    public String detail(int id,Model model){
        Goods goods=goodsBiz.findById(id);
        model.addAttribute("good",goods);
        return "/Good/goodDetail";
    }

    //按照分类显示商品（1,2,3,4个种类）
    @RequestMapping("/typeGood")
    public String type(int id,Model model,@RequestParam(required=true,defaultValue="1")Integer page){
        PageHelper.startPage(page, 5);
        List<Goods> list=goodsBiz.findByTypeId(id);
        PageInfo<Goods> p=new PageInfo<Goods>(list);
        model.addAttribute("list",list);
        model.addAttribute("page", p);
        GoodType goodType=goodTypeBiz.findById(id);
        model.addAttribute("type",goodType);
        return "/Good/typeGood";
    }

}
