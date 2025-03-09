package com.example.demo.vo;

import java.time.LocalDate;
import java.util.Date;

public class Notice_BoardVO {
    private int ntc_board; //게시물 id
    private String crt_time; //게시물 생성시간
    private String mod_time; //게시물 수정시간
    private String ntc_title; // 게시글 제목
    private String ntc_contents; //게시글 내용
    private Boolean board_deleted; // 게시글 삭제 여부
    private String file_name; //파일 이름
    private String file_origin_name; //파일 원래 이름
    private String file_path; //파일경로
    private long file_size; //파일 크기
    private String user_id;

    public Notice_BoardVO() {

    }

    public Notice_BoardVO(int ntc_board, String crt_time, String mod_time, String ntc_title,
                          String ntc_contents, Boolean board_deleted, String file_name, String file_origin_name,
                          String file_path, long file_size, String user_id) {
        this.ntc_board = ntc_board;
        this.crt_time = crt_time;
        this.mod_time = mod_time;
        this.ntc_title = ntc_title;
        this.ntc_contents = ntc_contents;
        this.board_deleted = board_deleted;
        this.file_name = file_name;
        this.file_origin_name = file_origin_name;
        this.file_path = file_path;
        this.file_size = file_size;
        this.user_id = user_id;
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

    public String getNtc_contents() {
        return ntc_contents;
    }

    public void setNtc_contents(String ntc_contents) {
        this.ntc_contents = ntc_contents;
    }

    public Boolean getBoard_deleted() {
        return board_deleted;
    }

    public void setBoard_deleted(Boolean board_deleted) {
        this.board_deleted = board_deleted;
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

    public long getFile_size() {
        return file_size;
    }

    public void setFile_size(long file_size) {
        this.file_size = file_size;
    }


    public String getUser_id() {
        return user_id;
    }

    public void setUser_id(String user_id) {
        this.user_id = user_id;
    }

    @Override
    public String toString() {
        return "Notice_BoardVO{" +
                "ntc_board=" + ntc_board +
                ", crt_time='" + crt_time + '\'' +
                ", mod_time='" + mod_time + '\'' +
                ", ntc_title='" + ntc_title + '\'' +
                ", ntc_contents='" + ntc_contents + '\'' +
                ", board_deleted=" + board_deleted +
                ", file_name='" + file_name + '\'' +
                ", file_origin_name='" + file_origin_name + '\'' +
                ", file_path='" + file_path + '\'' +
                ", file_size=" + file_size +
                ", user_id='" + user_id + '\'' +
                '}';
    }
}
