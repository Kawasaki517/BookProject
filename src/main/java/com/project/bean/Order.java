package com.project.bean;

import org.springframework.stereotype.Component;

import java.math.BigDecimal;
import java.util.Date;


@Component
public class Order {
    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column t_order.orderId
     *
     * @mbg.generated Mon Feb 28 15:00:05 CST 2022
     */
    private String orderid;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column t_order.createTime
     *
     * @mbg.generated Mon Feb 28 15:00:05 CST 2022
     */
    private Date createtime;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column t_order.price
     *
     * @mbg.generated Mon Feb 28 15:00:05 CST 2022
     */
    private BigDecimal price;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column t_order.userId
     *
     * @mbg.generated Mon Feb 28 15:00:05 CST 2022
     */
    private Integer userid;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column t_order.status
     *
     * @mbg.generated Mon Feb 28 15:00:05 CST 2022
     */
    private Integer status;

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column t_order.orderId
     *
     * @return the value of t_order.orderId
     *
     * @mbg.generated Mon Feb 28 15:00:05 CST 2022
     */
    public String getOrderid() {
        return orderid;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column t_order.orderId
     *
     * @param orderid the value for t_order.orderId
     *
     * @mbg.generated Mon Feb 28 15:00:05 CST 2022
     */
    public void setOrderid(String orderid) {
        this.orderid = orderid == null ? null : orderid.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column t_order.createTime
     *
     * @return the value of t_order.createTime
     *
     * @mbg.generated Mon Feb 28 15:00:05 CST 2022
     */
    public Date getCreatetime() {
        return createtime;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column t_order.createTime
     *
     * @param createtime the value for t_order.createTime
     *
     * @mbg.generated Mon Feb 28 15:00:05 CST 2022
     */
    public void setCreatetime(Date createtime) {
        this.createtime = createtime;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column t_order.price
     *
     * @return the value of t_order.price
     *
     * @mbg.generated Mon Feb 28 15:00:05 CST 2022
     */
    public BigDecimal getPrice() {
        return price;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column t_order.price
     *
     * @param price the value for t_order.price
     *
     * @mbg.generated Mon Feb 28 15:00:05 CST 2022
     */
    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column t_order.userId
     *
     * @return the value of t_order.userId
     *
     * @mbg.generated Mon Feb 28 15:00:05 CST 2022
     */
    public Integer getUserid() {
        return userid;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column t_order.userId
     *
     * @param userid the value for t_order.userId
     *
     * @mbg.generated Mon Feb 28 15:00:05 CST 2022
     */
    public void setUserid(Integer userid) {
        this.userid = userid;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column t_order.status
     *
     * @return the value of t_order.status
     *
     * @mbg.generated Mon Feb 28 15:00:05 CST 2022
     */
    public Integer getStatus() {
        return status;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column t_order.status
     *
     * @param status the value for t_order.status
     *
     * @mbg.generated Mon Feb 28 15:00:05 CST 2022
     */
    public void setStatus(Integer status) {
        this.status = status;
    }
}