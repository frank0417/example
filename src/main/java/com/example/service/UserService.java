package com.example.service;

import com.example.dao.UserDao;
import com.example.model.User;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

public interface UserService {
//    User findById(Integer id);
    User save(User user);
    User saveAndFlush(User user);
    List<User> findAll();
    int deleteById(int id);
    List<User> findByPagingAndSerchKey(int start,int length,String serchKey);
    List<User> findBySerchKey(String serchKey);
}
