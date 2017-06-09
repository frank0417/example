package com.example.model;

import javax.persistence.*;

@Entity
@Table(name="org")
public class Org {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)

    private Integer id;
    private Integer parentId;
    private String orgName;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getParentId() {
        return parentId;
    }

    public void setParentId(Integer parentId) {
        this.parentId = parentId;
    }

    public String getOrgName() {
        return orgName;
    }

    public void setOrgName(String orgName) {
        this.orgName = orgName;
    }
}