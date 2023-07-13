package com.pm.personal.dao;

import com.pm.entity.Role;

import java.util.List;

public interface RoleDao {

    Role findById(int roleId);
    List<Role> findAll();

    void deleteById(int roleId);

    Role findRoleByName(String roleName);
    void saveRole(Role role);

    void updateByRole(Role role);
}
