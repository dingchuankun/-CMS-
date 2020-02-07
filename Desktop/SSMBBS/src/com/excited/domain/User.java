package com.excited.domain;

import java.io.Serializable;
import java.sql.Timestamp;
import java.util.Date;

public class User implements Serializable {
    // 0代表管理员,  1代表普通用户
    private static final int USER_ADMIN = 0;
    private static final int USER_NORMAL = 1;
    // 0代表用户未被锁定, 1代表用户锁定
    private static final int USER_UNLOCK = 0;
    private static final int USER_LOCK = 1;
    // 用户属性
    private int userId;
    private String userName;
    private String password;
    private String userPhone;
    private String userEmail;
    private String userSex;
    private Date createTime;
    private String createtime;
	private int userType;
    private int userState;
    private int credit;
    private Date lastLoginTime;
    private String LoginTime;
    private String lastIp;
    private String user_img;
    public String getUser_img() {
		return user_img;
	}

	public void setUser_img(String user_img) {
		this.user_img = user_img;
	}

	public String getLoginTime() {
		return LoginTime;
	}

	public void setLoginTime(String loginTime) {
		LoginTime = loginTime;
	}

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

   

    public String getUserPhone() {
		return userPhone;
	}

	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}

	public String getUserEmail() {
        return userEmail;
    }

    public void setUserEmail(String userEmail) {
        this.userEmail = userEmail;
    }

    public String getUserSex() {
        return userSex;
    }

    public void setUserSex(String userSex) {
        this.userSex = userSex;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public int getUserType() {
        return userType;
    }

    public void setUserType(int userType) {
        this.userType = userType;
    }

    public int getUserState() {
        return userState;
    }

    public void setUserState(int userState) {
        this.userState = userState;
    }

    public int getCredit() {
        return credit;
    }

    public void setCredit(int credit) {
        this.credit = credit;
    }

    public Date getLastLoginTime() {
        return lastLoginTime;
    }

    public void setLastLoginTime(Date lastLoginTime) {
        this.lastLoginTime = lastLoginTime;
    }

    public String getLastIp() {
        return lastIp;
    }

    @Override
	public String toString() {
		return "User [userId=" + userId + ", userName=" + userName + ", password=" + password + ", userPhone="
				+ userPhone + ", userEmail=" + userEmail + ", userSex=" + userSex + ", createTime=" + createTime
				+ ", createtime=" + createtime + ", userType=" + userType + ", userState=" + userState + ", credit="
				+ credit + ", lastLoginTime=" + lastLoginTime + ", LoginTime=" + LoginTime + ", lastIp=" + lastIp
				+ ", user_img=" + user_img + "]";
	}

	public void setLastIp(String lastIp) {
        this.lastIp = lastIp;
    }

	public String getCreatetime() {
		return createtime;
	}

	public void setCreatetime(String createtime) {
		this.createtime = createtime;
	}


}
