package com.board.mvc.web.board.domain;

import lombok.Getter;
import lombok.Setter;

import java.util.Date;

// DTO역할
@Getter @Setter
public class ModifyBulletin {

    private int boardNo; // 글번호 board_no
    private String writer; // 작성자 ID
    private String userName; // 작성자 이름
    private String title; // 글제목 title
    private String content; // 글내용 content
    private int recommend; // 추천수 recommend

}