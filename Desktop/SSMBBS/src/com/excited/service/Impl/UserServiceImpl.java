package com.excited.service.Impl;

import com.excited.dao.UserDao;
import com.excited.domain.User;
import com.excited.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserDao userDao;

    @Override
    public void addUser(User user) {
        if (user != null) {
            userDao.addUser(user);
        }
    }

    @Override
    public void updateUserByUserName(User user) {
        if (user != null) {
            userDao.updateUserByUserName(user);
        }
    }

    @Override
    public User getUserByUserName(String userName) {
    	User user=userDao.findUserByUserName(userName);
        if (userName == null) {
            return null;
        }	
        if(user==null){
        	 return null;
        }
        	SimpleDateFormat sdfDateTime = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
    		Date date1 = user.getCreateTime();
    		Date date2 = user.getLastLoginTime();
			user.setCreatetime(sdfDateTime.format(date1));
			user.setLoginTime(sdfDateTime.format(date2));
        return user;
    }

    @Override
    public String getPassword(String userName) {
        if (userName == null) {
            return null;
        }
        return userDao.getUserPasswordByUserName(userName);
    }

    @Override
    public void deleteUserByUserName(String userName) {
    	userDao.deleteUserByUserName(userName);
    }

    @Override
    public void loginSuccess(User user) {

    }

    @Override
    public List<User> getAllUser() {
    	List<User> userlist=userDao.getAllUserInfo();
    	for(User user:userlist) {
    		Date date = user.getLastLoginTime();
			SimpleDateFormat sdfDateTime = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
			user.setLoginTime(sdfDateTime.format(date));
    	}
        return userlist;
    }

	@Override
	public void updateuserstate(int userState,int id) {
		System.out.println("Ω˚—‘≤‚ ‘ "+userState+"”√ªßid"+id);
		userDao.updateuserstate(userState,id);
	}

	@Override
	public List<User> findByuser(String name) {
		// TODO Auto-generated method stub
		return userDao.findByuser(name);
	}
}
