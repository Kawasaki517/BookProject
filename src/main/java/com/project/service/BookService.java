package com.project.service;

import com.github.pagehelper.PageHelper;
import com.project.bean.Book;
import com.project.bean.BookExample;
import com.project.dao.BookMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.util.List;

@Service
public class BookService {

    @Autowired
    private BookMapper bookMapper;
    @Autowired
    private BookExample bookExample;
    public List<Book> getAllBook(int page,int size){
        PageHelper.startPage(page, size);
        return bookMapper.selectByExample(null);
    }

    public List<Book> limitBook(int page, int size,Integer low,Integer high){
        BookExample.Criteria criteria = bookExample.createCriteria();
        PageHelper.startPage(page,size);
        criteria.andPriceBetween(new BigDecimal(low),new BigDecimal(high));
        List<Book> bookList = bookMapper.selectByExample(bookExample);
        bookExample.clear();
        return bookList;

    }

    public Book getBookById(Integer id){
        return bookMapper.selectByPrimaryKey(id);
    }
}
