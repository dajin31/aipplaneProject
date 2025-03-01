package com.example.demo.vo;

import java.time.LocalDate;
import java.util.Date;

public class Notice_BoardVO {
    private int ntc_board; //게시물 id
    private String crt_time; //게시물 생성시간
    private String mod_time; //게시물 수정시간
    private String ntc_title; // 게시글 제목
    private String ntc_content; //게시글 내용
    private String admin_id; //
    private Boolean board_deleted; // 게시글 삭제 여부
    private String file_name; //파일 이름
    private String file_origin_name; //파일 원래 이름
    private String file_path; //파일경로
    private Float file_size; //파일 크기
    private UserVO user;

    public Notice_BoardVO() {

    }

    public Notice_BoardVO(int ntc_board, String crt_time, String mod_time, String ntc_content, String ntc_title,
                          Boolean board_deleted, String admin_id, String file_name, String file_origin_name,
                          String file_path, Float file_size) {
        this.ntc_board = ntc_board;
        this.crt_time = crt_time;
        this.mod_time = mod_time;
        this.ntc_content = ntc_content;
        this.ntc_title = ntc_title;
        this.board_deleted = board_deleted;
        this.admin_id = admin_id;
        this.file_name = file_name;
        this.file_origin_name = file_origin_name;
        this.file_path = file_path;
        this.file_size = file_size;
    }

    public int getNtc_board() {
        return ntc_board;
    }

    public void setNtc_board(int ntc_board) {
        this.ntc_board = ntc_board;
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

    public String getNtc_title() {
        return ntc_title;
    }

    public void setNtc_title(String ntc_title) {
        this.ntc_title = ntc_title;
    }

    public String getNtc_content() {
        return ntc_content;
    }

    public void setNtc_content(String ntc_content) {
        this.ntc_content = ntc_content;
    }

    public Boolean getBoard_deleted() {
        return board_deleted;
    }

    public void setBoard_deleted(Boolean board_deleted) {
        this.board_deleted = board_deleted;
    }

    public String getAdmin_id() {
        return admin_id;
    }

    public void setAdmin_id(String admin_id) {
        this.admin_id = admin_id;
    }

    public String getFile_name() {
        return file_name;
    }

    public void setFile_name(String file_name) {
        this.file_name = file_name;
    }

    public String getFile_origin_name() {
        return file_origin_name;
    }

    public void setFile_origin_name(String file_origin_name) {
        this.file_origin_name = file_origin_name;
    }

    public String getFile_path() {
        return file_path;
    }

    public void setFile_path(String file_path) {
        this.file_path = file_path;
    }

    public Float getFile_size() {
        return file_size;
    }

    public void setFile_size(Float file_size) {
        this.file_size = file_size;
    }

    public UserVO getUser() {
        return user;
    }

    public void setUser(UserVO user) {
        this.user = user;
    }

    @Override
    public String toString() {
        return "Notice_BoardVO{" +
                "ntc_board='" + ntc_board + '\'' +
                ", crt_time=" + crt_time +
                ", mod_time=" + mod_time +
                ", ntc_title='" + ntc_title + '\'' +
                ", ntc_content='" + ntc_content + '\'' +
                ", board_deleted=" + board_deleted +
                ", admin_id='" + admin_id + '\'' +
                ", file_name='" + file_name + '\'' +
                ", file_origin_name='" + file_origin_name + '\'' +
                ", file_path='" + file_path + '\'' +
                ", file_size=" + file_size +
                '}';
    }


}
