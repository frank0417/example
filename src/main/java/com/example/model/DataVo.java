package com.example.model;

import net.sf.json.JSONArray;

import java.util.List;

/**
 * Created by yangfan on 2017/5/27.
 */
public class DataVo {
    private int draw; // Client request times
    private int recordsTotal; // Total records number without conditions
    private int recordsFiltered; // Total records number with conditions
    private JSONArray data; // The data we should display on the page
    // getter and setter method

    public int getDraw() {
        return draw;
    }

    public void setDraw(int draw) {
        this.draw = draw;
    }

    public int getRecordsTotal() {
        return recordsTotal;
    }

    public void setRecordsTotal(int recordsTotal) {
        this.recordsTotal = recordsTotal;
    }

    public int getRecordsFiltered() {
        return recordsFiltered;
    }

    public void setRecordsFiltered(int recordsFiltered) {
        this.recordsFiltered = recordsFiltered;
    }

    public JSONArray getData() {
        return data;
    }

    public void setData(JSONArray data) {
        this.data = data;
    }
}
