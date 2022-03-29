package com.project.bean;

import java.math.BigDecimal;

public class CartItem {
    private Book book;
    private Integer count;
    private BigDecimal totalPrice;

    public CartItem() {
    }

    public CartItem(Book book) {
        count=0;
        totalPrice=new BigDecimal(0);
        this.book = book;
    }

    public Book getBook() {
        return book;
    }

    public void setBook(Book book) {
        this.book = book;
    }

    public Integer getCount() {
        return count;
    }

    public void setCount(Integer count) {
        this.count = count;
    }

    public BigDecimal getTotalPrice() {
        return new BigDecimal(count).multiply(book.getPrice());
    }

    public void setTotalPrice(BigDecimal totalPrice) {
        this.totalPrice=totalPrice;
    }
}
