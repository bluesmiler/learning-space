package com.pm.personal.dao;

import com.pm.entity.Visitor;

import java.util.List;

public interface VisitorDao {

    List<Visitor> findVisitorByUserId(int userId);

    void deleteVisitorByUserId(int userId);

    void saveVisitor(Visitor visitor);

    void deleteVisitorByVisitorId(int visitorId);

}
