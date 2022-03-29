package com.project.controller;

import com.project.bean.User;
import com.project.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

@Controller

public class UserController {
    @Autowired
    UserService userService;
    @RequestMapping(value = "/login" , method = RequestMethod.POST)
    public ModelAndView login(@RequestParam("username") String username, @RequestParam("password") String password, HttpSession session) {
        ModelAndView mav = new ModelAndView();
        User user = userService.isExistUser(username, password);
        if (user != null) {
            session.setAttribute("user", user);
            mav.setViewName("pages/user/login_success");
        } else {
            mav.setViewName("pages/user/login");
            mav.addObject("msg","密码错误或用户不存在！");
            mav.addObject("username",username);
            mav.addObject("password",password);
        }
        return mav;
    }


    @RequestMapping("/register")
    public ModelAndView register(User user,HttpSession session , @RequestParam ("code") String code){

        ModelAndView mav=new ModelAndView();
        return mav;
    }

    @RequestMapping(value = "/verify" , method = RequestMethod.GET)
    @ResponseBody
    public Map<String,String> verify(@RequestParam("username") String username){
        Map<String,String> map=new HashMap<String, String>();
        map.put("result",userService.isRegisterUser(username));
        return map;
    }
}
