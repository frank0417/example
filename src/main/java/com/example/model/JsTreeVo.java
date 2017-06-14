package com.example.model;

import net.sf.json.JSONArray;

import java.util.Map;

/**
 * Created by yangfan on 2017/6/2.
 */
public class JsTreeVo {
    private String id;
    private String text;
    private String parent;
    //异步children只判断有无
    private boolean children;
    //节点状态
    private State state;

    public void setId(String id) {
        this.id = id;
    }

    public String getId() {
        return id;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public String getParent() {
        return parent;
    }

    public void setParent(String parent) {
        this.parent = parent;
    }

    public boolean isChildren() {
        return children;
    }

    public void setChildren(boolean children) {
        this.children = children;
    }

    public State getState() {
        return state;
    }

    public void setState(State state) {
        this.state = state;
    }
}
