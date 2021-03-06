package com.project.bean;

import org.springframework.stereotype.Component;

import java.math.BigDecimal;

@Component
public class OrderItem {
    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column t_order_item.id
     *
     * @mbg.generated Mon Feb 28 15:00:05 CST 2022
     */
    private Integer id;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column t_order_item.name
     *
     * @mbg.generated Mon Feb 28 15:00:05 CST 2022
     */
    private String name;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column t_order_item.count
     *
     * @mbg.generated Mon Feb 28 15:00:05 CST 2022
     */
    private Integer count;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column t_order_item.totalPrice
     *
     * @mbg.generated Mon Feb 28 15:00:05 CST 2022
     */
    private BigDecimal totalprice;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column t_order_item.orderId
     *
     * @mbg.generated Mon Feb 28 15:00:05 CST 2022
     */
    private String orderid;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column t_order_item.price
     *
     * @mbg.generated Mon Feb 28 15:00:05 CST 2022
     */
    private BigDecimal price;

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column t_order_item.id
     *
     * @return the value of t_order_item.id
     *
     * @mbg.generated Mon Feb 28 15:00:05 CST 2022
     */
    public Integer getId() {
        return id;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column t_order_item.id
     *
     * @param id the value for t_order_item.id
     *
     * @mbg.generated Mon Feb 28 15:00:05 CST 2022
     */
    public void setId(Integer id) {
        this.id = id;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column t_order_item.name
     *
     * @return the value of t_order_item.name
     *
     * @mbg.generated Mon Feb 28 15:00:05 CST 2022
     */
    public String getName() {
        return name;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column t_order_item.name
     *
     * @param name the value for t_order_item.name
     *
     * @mbg.generated Mon Feb 28 15:00:05 CST 2022
     */
    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column t_order_item.count
     *
     * @return the value of t_order_item.count
     *
     * @mbg.generated Mon Feb 28 15:00:05 CST 2022
     */
    public Integer getCount() {
        return count;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column t_order_item.count
     *
     * @param count the value for t_order_item.count
     *
     * @mbg.generated Mon Feb 28 15:00:05 CST 2022
     */
    public void setCount(Integer count) {
        this.count = count;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column t_order_item.totalPrice
     *
     * @return the value of t_order_item.totalPrice
     *
     * @mbg.generated Mon Feb 28 15:00:05 CST 2022
     */
    public BigDecimal getTotalprice() {
        return totalprice;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column t_order_item.totalPrice
     *
     * @param totalprice the value for t_order_item.totalPrice
     *
     * @mbg.generated Mon Feb 28 15:00:05 CST 2022
     */
    public void setTotalprice(BigDecimal totalprice) {
        this.totalprice = totalprice;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column t_order_item.orderId
     *
     * @return the value of t_order_item.orderId
     *
     * @mbg.generated Mon Feb 28 15:00:05 CST 2022
     */
    public String getOrderid() {
        return orderid;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column t_order_item.orderId
     *
     * @param orderid the value for t_order_item.orderId
     *
     * @mbg.generated Mon Feb 28 15:00:05 CST 2022
     */
    public void setOrderid(String orderid) {
        this.orderid = orderid == null ? null : orderid.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column t_order_item.price
     *
     * @return the value of t_order_item.price
     *
     * @mbg.generated Mon Feb 28 15:00:05 CST 2022
     */
    public BigDecimal getPrice() {
        return price;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column t_order_item.price
     *
     * @param price the value for t_order_item.price
     *
     * @mbg.generated Mon Feb 28 15:00:05 CST 2022
     */
    public void setPrice(BigDecimal price) {
        this.price = price;
    }
}