package com.example.service.impl;

import com.example.dao.UserDao;
import com.example.model.User;
import com.example.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    UserDao userDao;
//    @Override
//    public User findById(Integer id) {
//        return userDao.findById(id);
//    }
    @Override
    public User save(User user) {
        return userDao.save(user);
    }

    @Override
    public User saveAndFlush(User user) {
        return userDao.saveAndFlush(user);
    }

    @Override
    public List<User> findAll() {
//        List<User> list = new ArrayList<User>();
//        list.add(new User(1,"yangfan"));

        return userDao.findAll();
    }

    @Override
    public List<User> findByPagingAndSerchKey(int start,int length,String serchKey) {
        return userDao.findByPagingAndSerchKey(start,length,serchKey);
    }

    @Override
    public List<User> findBySerchKey(String serchKey) {
        return userDao.findBySerchKey(serchKey);
    }

    /**
     * 根据id删除
     * */
    @Override
    public int deleteById(int id){
        return userDao.deleteById(id);
    }
}
