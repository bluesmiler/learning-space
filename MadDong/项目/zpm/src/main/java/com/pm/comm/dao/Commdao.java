package com.pm.comm.dao;

import com.fasterxml.jackson.annotation.JsonTypeInfo;
import org.apache.ibatis.annotations.*;
import org.apache.ibatis.mapping.FetchType;
import org.mybatis.spring.annotation.MapperScan;

import com.pm.entity.Comm;

import java.util.List;

@MapperScan
public interface Commdao {

	@Select("SELECT comm_id,comm_name,comm_address,comm_brief FROM tb_comm WHERE comm_id=#{comm_id}")
	Comm findById(int comm_id);


	@Select("SELECT comm_id, comm_name,comm_address,comm_brief FROM tb_comm")
	List<Comm> findAll();
}
