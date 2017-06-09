package com.example.dao;


import com.example.model.Org;
import com.example.model.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface OrgDao extends JpaRepository<Org,Integer>,JpaSpecificationExecutor<Org> {
    //根据id查询部门信息
    @Query(value = "select * from org where id = :id ", nativeQuery = true)
    public List<Org> findById(@Param("id") int id);

    //根据ParentByid查询部门信息
    @Query(value = "select * from org where parentId = :id ", nativeQuery = true)
    public List<Org> findByParentId(@Param("id") int id);
}