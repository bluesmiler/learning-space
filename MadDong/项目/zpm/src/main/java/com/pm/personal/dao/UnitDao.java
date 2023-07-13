package com.pm.personal.dao;

import com.pm.entity.Unit;

import java.util.List;

public interface UnitDao {

    List<Unit> findAllByCommId(int commId);

    Unit findUnitById(int unitId);

    List<Unit> findAll();
}
