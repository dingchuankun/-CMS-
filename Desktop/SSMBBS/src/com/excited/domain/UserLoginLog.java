package com.excited.domain;

import java.io.Serializable;
import java.sql.Timestamp;
import java.util.Date;

public class UserLoginLog implements Serializable {
    private int loginLogId;
    private String userName;
    private String loginIp;
    private Date login_datetime;
    private String logintime;
    public String getLogintime() {
		return logintime;
	}

	public void setLogintime(String logintime) {
		this.logintime = logintime;
	}

	public Date getLoginDateTime() {
		return login_datetime;
	}

	public void setLoginDateTime(Date login_datetime) {
		this.login_datetime = login_datetime;
	}

	private User user;

    public int getLoginLogId() {
        return loginLogId;
    }

    public void setLoginLogId(int loginLogId) {
        this.loginLogId = loginLogId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getLoginIp() {
        return loginIp;
    }

    public void setLoginIp(String loginIp) {
        this.loginIp = loginIp;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    @Override
    public String toString() {
        return "UserLoginLog{" +
                "LoginLogId=" + loginLogId +
                ", UserName=" + userName +
                ", LoginIp=" + loginIp +
                ", login_datetime=" + login_datetime + "}";
    }
}
