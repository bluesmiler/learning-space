package com.pm.property.biz;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.pm.entity.ComplainWithBLOBs;
import com.pm.property.dao.ComplainMapper;

@Service
public class ComplainBiz {
	@Resource
	private ComplainMapper complainMapper;
	public int insertSelective(ComplainWithBLOBs complainWithBLOBs){
		complainWithBLOBs.setComplainTime(new Date());
		return complainMapper.insertSelective(complainWithBLOBs);
	}

	public int updateSelective(ComplainWithBLOBs complainWithBLOBs) {
		return complainMapper.updateByPrimaryKeySelective(complainWithBLOBs);
	}


	public int findCount() {
		return complainMapper.findCount();
	}

	public List<ComplainWithBLOBs> findAll(int pageNum, int pageSize) {
//		int firstResult= (pageNum-1)*pageSize;
		return complainMapper.findAll();
	}

	public void deleteByPrimaryKey(int complainId) {
		complainMapper.deleteByPrimaryKey(complainId);
	}

	public void deleteBatch(int[] arr) {
		complainMapper.deleteBatch(arr);
	}

	public void updateByPrimaryKeySelective(ComplainWithBLOBs complainWithBLOBs) {
		complainMapper.updateByPrimaryKeySelective(complainWithBLOBs);
	}

	public ComplainWithBLOBs findById(int complainId) {
		return complainMapper.selectByPrimaryKey(complainId);
	}
}
