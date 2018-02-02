package com.jz.springbootdemo.producer.impl;

import com.jz.springbootdemo.producer.TestService;

public class TestServiceImpl implements TestService {
    @Override
    public String sayHello(String name) {
        return "Hello " + name + "!";
    }
}
