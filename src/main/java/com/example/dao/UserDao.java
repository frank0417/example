package com.example.dao;


import com.example.model.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import javax.transaction.Transactional;
import java.util.List;

public interface UserDao extends JpaRepository<User,Integer>,JpaSpecificationExecutor<User> {
    //根据id删除数据
    @Query(value = "delete from user where id=?1 ", nativeQuery = true)
    @Modifying
    @Transactional
    public int deleteById(int id);

    //分页查询
    @Query(value = "select * from user where name like CONCAT('%',:searchKey,'%') order by id desc limit :start,:length", nativeQuery = true)
    public List<User> findByPagingAndSerchKey(@Param("start")int start,@Param("length")int length,@Param("searchKey")String searchKey);

    //关键字查询
    @Query(value = "select * from user where name like CONCAT('%',:searchKey,'%')", nativeQuery = true)
    public List<User> findBySerchKey(@Param("searchKey")String searchKey);

}