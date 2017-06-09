package com.example.service.impl;

import com.example.dao.OrgDao;
import com.example.model.Org;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by yangfan on 2017/6/2.
 */
@Service
public class OrgServiceImpl {
    @Autowired
    OrgDao orgDao;

    public List<Org> findById(Integer id) {
        return orgDao.findById(id);
    }

    public List<Org> findByParentId(Integer id) {
        return orgDao.findByParentId(id);
    }

    public List<Org> findAll() {
        return orgDao.findAll();
    }
}
