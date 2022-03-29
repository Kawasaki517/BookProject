package com.project.controller;


import com.github.pagehelper.PageInfo;
import com.project.bean.Book;
import com.project.service.BookService;
import com.project.utils.WebUtils;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
public class IndexController {
    @Autowired
    private BookService bookService;


    @RequestMapping("/client")
    public ModelAndView index(@RequestParam(name = "page",required = true,defaultValue = "1") int page,
                              @RequestParam(name = "size",required = true,defaultValue = "4") int size){
        ModelAndView mav = new ModelAndView();
        mav.setViewName("pages/client/clientFirst");
        List<Book> bookList=bookService.getAllBook(page, size);
        PageInfo pageInfo=new PageInfo(bookList);
        mav.addObject("AllBook",pageInfo);

        return mav;
    }

    @RequestMapping(value = "/client",params = {"low","high"})
    public ModelAndView search(@RequestParam(name = "page",required = true,defaultValue = "1") int page,
                               @RequestParam(name = "size",required = true,defaultValue = "4") int size,
                               @RequestParam(name = "low") String low,@RequestParam(name = "high") String high){
        ModelAndView mav=new ModelAndView();

        List<Book> bookList;
        if(low.equals("")||high.equals("")){
            return index(page,size);
        }
        else {
            mav.setViewName("pages/client/clientFirst");
            bookList=bookService.limitBook(page, size, WebUtils.StrToInt(low,0),WebUtils.StrToInt(high,5000));
            PageInfo pageInfo=new PageInfo(bookList);
            mav.addObject("AllBook",pageInfo);
            mav.addObject("low","&&low="+low);
            mav.addObject("high","&&high="+high);
            mav.addObject("Low",low);
            mav.addObject("High",high);
            return mav;
        }
    }
}
