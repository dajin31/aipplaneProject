package com.example.demo.vo;

import java.util.Date;

public class AirVO {
    private String pay_code;
    private int pay_amount;
    private int res_code;
    private int ptype_code;
    private String user_id;
    private Date res_date;
    private String p_num;
    private String pass_num;
    private int reg_num;
    private String sear_code;
    private int flt_code;
    private String dpt_date;
    private String arr_date;
    private String dpt_time;
    private String arr_time;
    private int flt_time;
    private int air_code;
    private String dpt_apt_code;
    private String arr_apt_code;
    private String air_name;
    private String air_class;
    private String to_apt_name;
    private String to_cnt_category;
    private String from_apt_name;
    private String from_cnt_name;
    private String from_cnt_category;
    private int total_price;
    private int ticket_price;
    private String seat_class;




    public Date getRes_date() {
        return res_date;
    }
    public void setRes_date(Date res_date) {
        this.res_date = res_date;
    }
    public String getP_num() {
        return p_num;
    }
    public void setP_num(String p_num) {
        this.p_num = p_num;
    }
    public String getPass_num() {
        return pass_num;
    }
    public void setPass_num(String pass_num) {
        this.pass_num = pass_num;
    }
    public int getReg_num() {
        return reg_num;
    }
    public void setReg_num(int reg_num) {
        this.reg_num = reg_num;
    }
    public String getSear_code() {
        return sear_code;
    }
    public void setSear_code(String sear_code) {
        this.sear_code = sear_code;
    }
    public int getFlt_code() {
        return flt_code;
    }
    public void setFlt_code(int flt_code) {
        this.flt_code = flt_code;
    }
    public String getDpt_date() {
        return dpt_date;
    }
    public void setDpt_date(String dpt_date) {
        this.dpt_date = dpt_date;
    }
    public String getArr_date() {
        return arr_date;
    }
    public void setArr_date(String arr_date) {
        this.arr_date = arr_date;
    }
    public String getDpt_time() {
        return dpt_time;
    }
    public void setDpt_time(String dpt_time) {
        this.dpt_time = dpt_time;
    }
    public String getArr_time() {
        return arr_time;
    }
    public void setArr_time(String arr_time) {
        this.arr_time = arr_time;
    }
    public int getFlt_time() {
        return flt_time;
    }
    public void setFlt_time(int flt_time) {
        this.flt_time = flt_time;
    }
    public int getAir_code() {
        return air_code;
    }
    public void setAir_code(int air_code) {
        this.air_code = air_code;
    }
    public String getDpt_apt_code() {
        return dpt_apt_code;
    }
    public void setDpt_apt_code(String dpt_apt_code) {
        this.dpt_apt_code = dpt_apt_code;
    }
    public String getArr_apt_code() {
        return arr_apt_code;
    }
    public void setArr_apt_code(String arr_apt_code) {
        this.arr_apt_code = arr_apt_code;
    }
    public String getAir_name() {
        return air_name;
    }
    public void setAir_name(String air_name) {
        this.air_name = air_name;
    }
    public String getAir_class() {
        return air_class;
    }
    public void setAir_class(String air_class) {
        this.air_class = air_class;
    }
    public String getTo_apt_name() {
        return to_apt_name;
    }
    public void setTo_apt_name(String to_apt_name) {
        this.to_apt_name = to_apt_name;
    }
    public String getTo_cnt_category() {
        return to_cnt_category;
    }
    public void setTo_cnt_category(String to_cnt_category) {
        this.to_cnt_category = to_cnt_category;
    }
    public String getFrom_apt_name() {
        return from_apt_name;
    }
    public void setFrom_apt_name(String from_apt_name) {
        this.from_apt_name = from_apt_name;
    }
    public String getFrom_cnt_name() {
        return from_cnt_name;
    }
    public void setFrom_cnt_name(String from_cnt_name) {
        this.from_cnt_name = from_cnt_name;
    }
    public String getFrom_cnt_category() {
        return from_cnt_category;
    }
    public void setFrom_cnt_category(String from_cnt_category) {
        this.from_cnt_category = from_cnt_category;
    }
    public int getTotal_price() {
        return total_price;
    }
    public void setTotal_price(int total_price) {
        this.total_price = total_price;
    }
    public int getTicket_price() {
        return ticket_price;
    }
    public void setTicket_price(int ticket_price) {
        this.ticket_price = ticket_price;
    }
    public String getSeat_class() {
        return seat_class;
    }
    public void setSeat_class(String seat_class) {
        this.seat_class = seat_class;
    }
    public String getUser_id() {
        return user_id;
    }
    public void setUser_id(String user_id) {
        this.user_id = user_id;
    }
    public String getPay_code() {
        return pay_code;
    }
    public void setPay_code(String pay_code) {
        this.pay_code = pay_code;
    }
    public int getPay_amount() {
        return pay_amount;
    }
    public void setPay_amount(int pay_amount) {
        this.pay_amount = pay_amount;
    }
    public int getRes_code() {
        return res_code;
    }
    public void setRes_code(int res_code) {
        this.res_code = res_code;
    }
    public int getPtype_code() {
        return ptype_code;
    }
    public void setPtype_code(int ptype_code) {
        this.ptype_code = ptype_code;
    }
    @Override
    public String toString() {
        return "AirVO [pay_code=" + pay_code + ", pay_amount=" + pay_amount + ", res_code=" + res_code + ", ptype_code="
                + ptype_code + ", user_id=" + user_id + ", res_date=" + res_date + ", p_num=" + p_num + ", pass_num="
                + pass_num + ", reg_num=" + reg_num + ", sear_code=" + sear_code + ", flt_code=" + flt_code
                + ", dpt_date=" + dpt_date + ", arr_date=" + arr_date + ", dpt_time=" + dpt_time + ", arr_time="
                + arr_time + ", flt_time=" + flt_time + ", air_code=" + air_code + ", dpt_apt_code=" + dpt_apt_code
                + ", arr_apt_code=" + arr_apt_code + ", air_name=" + air_name + ", air_class=" + air_class
                + ", to_apt_name=" + to_apt_name + ", to_cnt_category=" + to_cnt_category + ", from_apt_name="
                + from_apt_name + ", from_cnt_name=" + from_cnt_name + ", from_cnt_category=" + from_cnt_category
                + ", total_price=" + total_price + ", ticket_price=" + ticket_price + ", seat_class=" + seat_class
                + "]";
    }





}
