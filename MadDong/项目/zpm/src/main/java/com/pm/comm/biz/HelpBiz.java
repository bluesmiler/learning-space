package com.pm.comm.biz;

import com.pm.comm.dao.HelpMapper;
import com.pm.entity.Help;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Service
public class HelpBiz {

    @Resource
    private HelpMapper helpMapper;

    public List<Help> findByAll(){
        return helpMapper.findByAll();
    }

    public void saveHelp(Help help){
        Date date = new Date();
        SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String nowTime=sdf.format(date);
        help.setHelpTime(nowTime);
        helpMapper.insert(help);
    }

    public Help findById(Integer helpId){
       return helpMapper.findById(helpId);
    }
}
