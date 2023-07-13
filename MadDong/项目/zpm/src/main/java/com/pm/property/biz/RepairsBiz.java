package com.pm.property.biz;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.pm.entity.Repairs;
import com.pm.property.dao.RepairsMapper;

@Service
public class RepairsBiz {
	@Resource
	private RepairsMapper repairsMapper;

	public int insertSelective(Repairs repairs){
		repairs.setRepCreatetime(new Date());

		return repairsMapper.insertSelective(repairs);
	}
	public int updateSelective(Repairs repairs){
		return repairsMapper.updateByPrimaryKeySelective(repairs);
	}

	public List<Repairs> findAll(int pageNum, int pageSize) {
		int firstResult =(pageNum-1)*pageSize;
		return repairsMapper.findAll(firstResult,pageSize);
	}

	public int findCount() {
		return repairsMapper.findCount();
	}

	public void deleteByPrimaryKey(int repId) {
		repairsMapper.deleteByPrimaryKey(repId);
	}

	public Repairs findById(int repId) {
		return repairsMapper.selectByPrimaryKey(repId);
	}

	public void deleteBatch(int[] cjd) {
		repairsMapper.deleteBatch(cjd);
	}
}
