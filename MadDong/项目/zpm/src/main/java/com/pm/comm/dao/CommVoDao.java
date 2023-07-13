package com.pm.comm.dao;

import com.pm.entity.vo.Project;
import org.apache.ibatis.annotations.Many;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.mapping.FetchType;
import org.mybatis.spring.annotation.MapperScan;

import java.util.List;

@MapperScan
public interface CommVoDao {


    @Results(id = "commVoMap",value = {
            @Result(id = true,column = "comm_id",property = "commId"),
            @Result(column = "comm_name",property = "commName"),
            @Result(column = "comm_id" ,
                    property = "units",
                    many = @Many(fetchType = FetchType.LAZY,
                           select = "com.pm.comm.dao.UnitVoDao.findAllByCommId")
            )
    })
    @Select("select comm_id,comm_name from tb_comm ")
    List<Project> findAll();
}
