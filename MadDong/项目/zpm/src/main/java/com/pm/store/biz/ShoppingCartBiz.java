package com.pm.store.biz;

import com.pm.entity.ShoppingCart;
import com.pm.store.dao.ShoppingCartDao;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class ShoppingCartBiz {
    @Resource
    private ShoppingCartDao shoppingCartDao;

    public List<ShoppingCart> findAll(int userId){
        return shoppingCartDao.findAll(userId);
    }

    public void delete(int id){
        shoppingCartDao.delete(id);
    }

    public void save(ShoppingCart shoppingCart){
        shoppingCartDao.save(shoppingCart);
    }
}
