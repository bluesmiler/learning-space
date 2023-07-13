package com.blues.test;

import com.blues.jedis.util.JedisConnectionFactory;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import redis.clients.jedis.Jedis;

public class JedisTest {
    private Jedis jedis;

    @BeforeEach
    void setUp(){
        jedis = JedisConnectionFactory.getJedis();
        jedis.auth("200217");
        jedis.select(0);
    }

    @Test
    void testString(){
        String result = jedis.set("name", "蔡徐坤");
        System.out.println("result = "+ result);

        String name = jedis.get("name");
        System.out.println("name = "+ name);
    }

    @AfterEach
    void tearDown(){
        if (jedis != null){
            jedis.close();
        }
    }
}
