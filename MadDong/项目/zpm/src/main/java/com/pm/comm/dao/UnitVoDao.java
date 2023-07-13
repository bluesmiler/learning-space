package com.pm.comm.dao;

import com.pm.entity.Home;
import com.pm.entity.vo.UnitVo;
import org.apache.ibatis.annotations.Many;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.mapping.FetchType;
import org.mybatis.spring.annotation.MapperScan;

import java.util.List;
@MapperScan
public interface UnitVoDao {

    @Results(id = "unitVoMap",value = {
            @Result(id = true,column = "unit_id",property = "unitId"),
            @Result(property = "unitName",column = "unit_name"),
            @Result(property = "commId",column = "comm_id"),
            @Result(property = "homes",
                    column = "unit_id",
                    many = @Many(fetchType = FetchType.LAZY,
                                    select = "com.pm.comm.dao.Homedao.findAllByUnitId")
            )
    })
    @Select("select unit_id,unit_name,comm_id from tb_unit where comm_id=#{commId}")
    List<UnitVo> findAllByCommId(int commId);

}
