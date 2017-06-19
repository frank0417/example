package com.example.model;

import net.sf.json.JSONArray;

/**
 * Created by yangfan on 2017/5/27.
 */
public class DataVoOld {
    private int sEcho; // Client request times
    private int iTotalRecords; // Total records number without conditions
    private int iTotalDisplayRecords; // Total records number with conditions
    private JSONArray aaData; // The data we should display on the page
    // getter and setter method


    public int getsEcho() {
        return sEcho;
    }

    public void setsEcho(int sEcho) {
        this.sEcho = sEcho;
    }

    public int getiTotalRecords() {
        return iTotalRecords;
    }

    public void setiTotalRecords(int iTotalRecords) {
        this.iTotalRecords = iTotalRecords;
    }

    public int getiTotalDisplayRecords() {
        return iTotalDisplayRecords;
    }

    public void setiTotalDisplayRecords(int iTotalDisplayRecords) {
        this.iTotalDisplayRecords = iTotalDisplayRecords;
    }

    public JSONArray getAaData() {
        return aaData;
    }

    public void setAaData(JSONArray aaData) {
        this.aaData = aaData;
    }
}
