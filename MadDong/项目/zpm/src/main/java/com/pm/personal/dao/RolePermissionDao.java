package com.pm.personal.dao;

import com.pm.entity.RolePermission;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface RolePermissionDao {

    void saveBatchRP(List<RolePermission> list);

    void deleteByRoleId(int roleId);

    void deleteBatch(@Param("roleId") int roleId,@Param("array") String[] perArray);

    void saveBatch(@Param("roleId") int roleId,@Param("array") String[] perArray);
}
