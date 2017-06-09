package com.example.model;

import net.sf.json.JSONArray;

/**
 * Created by yangfan on 2017/6/2.
 */
public class JsTreeVo {
    private String id;
    private String text;
    private String parent;
    private JSONArray children;

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

    public JSONArray getChildren() {
        return children;
    }

    public void setChildren(JSONArray children) {
        this.children = children;
    }
}
