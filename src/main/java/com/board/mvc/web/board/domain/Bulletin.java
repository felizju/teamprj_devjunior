
package com.board.mvc.web.board.domain;

import lombok.*;

import java.util.Date;

@Getter @Setter @ToString
@AllArgsConstructor
@NoArgsConstructor
public class Bulletin {

    private int boardNo; // 글번호 board_no
    private String writer; // 작성자 ID
    private String userName; // 작성자 이름
    private String title; // 글제목 title
    private String content; // 글내용 content
    private int recommend; // 추천수 recommend
    private int viewCnt; // 조회수 views
    private Date postTime; // 등록일자 post_time

}