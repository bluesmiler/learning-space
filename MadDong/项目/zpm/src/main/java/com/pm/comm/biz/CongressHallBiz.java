package com.pm.comm.biz;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.pm.comm.dao.CongressHallMapper;
import com.pm.entity.CongressHall;

@Service
public class CongressHallBiz {

	@Resource
	private CongressHallMapper congressHallMapper;
	
	public List<CongressHall> findByAll(){
		return congressHallMapper.findByAll();
	}

	public void saveCong(CongressHall congressHall){
		Date date = new Date();
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String nowTime=sdf.format(date);
		congressHall.setCongressHallTime(nowTime);
		congressHallMapper.insert(congressHall);
	}

	public CongressHall findById(Integer congressHallId){
		return congressHallMapper.findById(congressHallId);
	}

	public void delete(Integer congressHallId){
		congressHallMapper.delete(congressHallId);
	}

	public List<CongressHall> findByuserId(int userId){
		return congressHallMapper.findByUsertId(userId);
	}
}
