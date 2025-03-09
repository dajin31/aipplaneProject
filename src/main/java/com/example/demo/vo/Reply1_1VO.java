package com.example.demo.vo;

public class Reply1_1VO {
    private int reply_id;
    private String crt_time;
    private String mod_time;
    private String rpy_contents;
    private String rpy_delete;
    private String user_id;
    private int board_id;

    public Reply1_1VO() {
    }

    public Reply1_1VO(int reply_id, String crt_time, String mod_time, String rpy_contents, String rpy_delete, String user_id, int board_id) {
        this.reply_id = reply_id;
        this.crt_time = crt_time;
        this.mod_time = mod_time;
        this.rpy_contents = rpy_contents;
        this.rpy_delete = rpy_delete;
        this.user_id = user_id;
        this.board_id = board_id;
    }

    public int getReply_id() {
        return reply_id;
    }

    public void setReply_id(int reply_id) {
        this.reply_id = reply_id;
    }

    public String getCrt_time() {
        return crt_time;
    }

    public void setCrt_time(String crt_time) {
        this.crt_time = crt_time;
    }

    public String getMod_time() {
        return mod_time;
    }

    public void setMod_time(String mod_time) {
        this.mod_time = mod_time;
    }

    public String getRpy_contents() {
        return rpy_contents;
    }

    public void setRpy_contents(String rpy_contents) {
        this.rpy_contents = rpy_contents;
    }

    public String getRpy_delete() {
        return rpy_delete;
    }

    public void setRpy_delete(String rpy_delete) {
        this.rpy_delete = rpy_delete;
    }

    public String getUser_id() {
        return user_id;
    }

    public void setUser_id(String user_id) {
        this.user_id = user_id;
    }

    public int getBoard_id() {
        return board_id;
    }

    public void setBoard_id(int board_id) {
        this.board_id = board_id;
    }

    @Override
    public String toString() {
        return "Reply1_1VO{" +
                "reply_id=" + reply_id +
                ", crt_time='" + crt_time + '\'' +
                ", mod_time='" + mod_time + '\'' +
                ", rpy_contents='" + rpy_contents + '\'' +
                ", rpy_delete='" + rpy_delete + '\'' +
                ", user_id='" + user_id + '\'' +
                ", board_id=" + board_id +
                '}';
    }
}
