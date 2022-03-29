package com.project.controller;

import com.project.bean.Book;
import com.project.bean.Cart;
import com.project.bean.CartItem;
import com.project.service.BookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/cart")
public class CartController {

    @Autowired
    private BookService bookService;

    @Autowired
    private Cart cart;


    @RequestMapping(value = "/add",params = "id")
    @ResponseBody
    public Cart addCartItem(@RequestParam("id") Integer id, HttpSession session){
        Book book = bookService.getBookById(id);
        CartItem cartItem=new CartItem(book);
        cart.addCartItem(cartItem,id);
        session.setAttribute("cart",cart);
        System.out.println(cart);
        return cart;
    }

    @RequestMapping("/delete")
    @ResponseBody
    public Cart deleteCartItem(@RequestParam("id") Integer id){
        cart.remove(id);
        return cart;
    }

    @RequestMapping("/update")
    @ResponseBody
    public Cart updateCartItem(@RequestParam("id") Integer id,
                               @RequestParam("totalCount") Integer totalCount){

        cart.getMap().get(id).setCount(totalCount);
        return cart;
    }

    @RequestMapping("/clear")
    @ResponseBody
    public void clearCartItem(HttpSession session){
        cart.clear();
        session.removeAttribute("cart");
    }

}
