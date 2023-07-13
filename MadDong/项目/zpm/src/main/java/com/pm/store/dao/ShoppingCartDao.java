package com.pm.store.dao;

import com.pm.entity.ShoppingCart;
import org.mybatis.spring.annotation.MapperScan;

import java.util.List;
@MapperScan
public interface ShoppingCartDao {
    List<ShoppingCart> findAll(int userId);

    void save(ShoppingCart shoppingCart);

    void delete(int id);

}
