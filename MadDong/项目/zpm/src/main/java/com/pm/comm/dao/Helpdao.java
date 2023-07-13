package com.pm.comm.dao;

import java.util.List;

import org.apache.ibatis.annotations.Select;
import org.mybatis.spring.annotation.MapperScan;

import com.pm.entity.Help;

/**
 * 邻里互助
 * @author Administrator
 *
 */
@MapperScan
public interface Helpdao {

	@Select("SELECT h.help_id,h.help_headline,h.help_content,h.help_time,u.user_nickname,p.picture_name,p.picture_imges FROM tb_help h INNER JOIN tb_picture p ON h.help_id = p.help_id INNER JOIN tb_user u ON h.user_id = u.user_id")
	List<Help> findByAll();
	
	
}
