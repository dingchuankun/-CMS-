package com.excited.dao;

import com.excited.domain.User;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface UserDao {
   

    public User findUserByUserId(int id);

    public void addUser(User user);

    public void deleteUserByUserName(String username);

    public void updateUserByUserName(User user);
    
    public User findUserByUserName(String username);
    public String getUserPasswordByUserName(String username);

    public List<User> getAllUserInfo();
    public List<User> findByuser(String name);
    public void updateuserstate(@Param("userState") int userState,@Param("id")int id);
}
