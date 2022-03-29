package com.project.service;

import com.project.bean.User;
import com.project.bean.UserExample;
import com.project.dao.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class UserService {
    @Autowired
    UserMapper userMapper;


    @Autowired
    UserExample userExample;




    public User isExistUser(String username,String password) {
        UserExample.Criteria criteria = userExample.createCriteria();
        criteria.andUsernameEqualTo(username).andPasswordEqualTo(password);
        List<User> users = userMapper.selectByExample(userExample);
        userExample.clear();
        for (User user :users) {
            return user;
        }
        return null;
    }

    public String isRegisterUser(String username){
        UserExample.Criteria criteria = userExample.createCriteria();
        criteria.andUsernameEqualTo(username);
        List<User> users = userMapper.selectByExample(userExample);
        userExample.clear();
        if(users.size()!=0)return "true";
        else return "false";
    }



}
