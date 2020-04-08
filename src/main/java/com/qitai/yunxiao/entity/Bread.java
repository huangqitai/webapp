package com.qitai.yunxiao.entity;

public class Bread {
    private int id;
    private String loginName;
    private String loginPassword;

    public Bread(int id, String loginName, String loginPassword) {
        this.id = id;
        this.loginName = loginName;
        this.loginPassword = loginPassword;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getId() {
        return id;
    }

    public void setLoginName(String loginName) {
        this.loginName = loginName;
    }

    public void setLoginPassword(String loginPassword) {
        this.loginPassword = loginPassword;
    }

    public String getLoginName() {
        return loginName;
    }

    public String getLoginPassword() {
        return loginPassword;
    }

    @Override
    public String toString() {
        return loginName+"-----------"+loginPassword;
    }
}
