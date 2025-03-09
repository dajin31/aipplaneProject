package com.example.demo.vo;

public class Board1_1VO {
    private int board_id;
    private String crt_date;
    private String mod_date;
    private String ind_title;
    private String ind_contents;
    private String user_id;
    private String mem_code;

    public Board1_1VO() {
    }

    public Board1_1VO(int board_id, String crt_date, String mod_date, String ind_title, String ind_contents, String user_id, String mem_code) {
        this.board_id = board_id;
        this.crt_date = crt_date;
        this.mod_date = mod_date;
        this.ind_title = ind_title;
        this.ind_contents = ind_contents;
        this.user_id = user_id;
        this.mem_code = mem_code;
    }

    public int getBoard_id() {
        return board_id;
    }

    public void setBoard_id(int board_id) {
        this.board_id = board_id;
    }

    public String getCrt_date() {
        return crt_date;
    }

    public void setCrt_date(String crt_date) {
        this.crt_date = crt_date;
    }

    public String getMod_date() {
        return mod_date;
    }

    public void setMod_date(String mod_date) {
        this.mod_date = mod_date;
    }

    public String getInd_title() {
        return ind_title;
    }

    public void setInd_title(String ind_title) {
        this.ind_title = ind_title;
    }

    public String getInd_contents() {
        return ind_contents;
    }

    public void setInd_contents(String ind_contents) {
        this.ind_contents = ind_contents;
    }

    public String getUser_id() {
        return user_id;
    }

    public void setUser_id(String user_id) {
        this.user_id = user_id;
    }

    public String getMem_code() {
        return mem_code;
    }

    public void setMem_code(String mem_code) {
        this.mem_code = mem_code;
    }

    @Override
    public String toString() {
        return "Board1_1VO{" +
                "board_id=" + board_id +
                ", crt_date='" + crt_date + '\'' +
                ", mod_date='" + mod_date + '\'' +
                ", ind_title='" + ind_title + '\'' +
                ", ind_contents='" + ind_contents + '\'' +
                ", user_id='" + user_id + '\'' +
                ", mem_code='" + mem_code + '\'' +
                '}';
    }
}
