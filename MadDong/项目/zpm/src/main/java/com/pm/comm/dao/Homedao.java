package com.pm.comm.dao;

import com.pm.entity.Unit;
import org.apache.ibatis.annotations.*;
import org.mybatis.spring.annotation.MapperScan;

import com.pm.entity.Home;

import java.util.List;

@MapperScan
public interface Homedao {
	@Results(id = "homeMap",value = {
			@Result(id = true,column = "home_id",property = "home_id"),
			@Result(column = "home_name",property = "home_name"),
			@Result(column = "unit_id",property = "unit_id"),
			@Result(column = "unit_id",property = "unit",
					one = @One(select = "com.pm.personal.dao.UnitDao.findUnitById"))
	})
	@Select({"SELECT home_id,home_name,unit_id FROM  tb_home WHERE home_id=#{home_id}"})
	Home findById(int home_id);

	@ResultMap("homeMap")
	@Select("SELECT home_id,home_name,unit_id FROM  tb_home WHERE unit_id=#{unitId}")
	List<Home> findAllByUnitId(int unitId);
}
