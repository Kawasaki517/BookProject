package com.project.bean;

import org.springframework.stereotype.Component;

import java.math.BigDecimal;
import java.util.LinkedHashMap;
import java.util.Map;


@Component
public class Cart {

   private Map<Integer,CartItem> map =new LinkedHashMap<Integer, CartItem>();
   private String lastName=null;
    //添加物品到购物车
    public void addCartItem(CartItem cartItem , Integer id){
        this.lastName = cartItem.getBook().getName();
        if (!map.containsKey(id)) {
            map.put(id, cartItem);
        }
        map.get(id).setCount(map.get(id).getCount()+1);
    }

    public Integer getTotalCount() {
        Integer totalCount=0;
        for (Map.Entry<Integer, CartItem> entry:map.entrySet()){
            totalCount+=entry.getValue().getCount();
        }
        return totalCount;
    }

    //得到总的价格
    public BigDecimal getTotalPrice(){
        BigDecimal totalPrice=new BigDecimal(0);
        for (Map.Entry<Integer, CartItem> entry:map.entrySet()){
            totalPrice=totalPrice.add(entry.getValue().getTotalPrice());
        }
        return totalPrice;
    }
    //清空购物车
    public void clear(){
        map.clear();
    }

    //删除商品
    public Book remove(Integer id){
        CartItem cartItem=map.remove(id);
        if(cartItem !=null){
            return cartItem.getBook();
        }
        else return null;
    }
    public Map<Integer,CartItem> getMap(){
        return map;
    }

    public String getLastName() {
        return lastName;
    }

    @Override
    public String toString() {
        return "Cart{" +
                "map=" + map +
                ", totalPrice=" + getTotalPrice() +
                ", totalCount=" + getTotalCount() +
                ", lastName=" + this.lastName +
                '}';
    }

}
