package com.board.mvc.web.reply.domain;

import lombok.*;

import java.util.Date;

@Getter @Setter @ToString
@AllArgsConstructor
@NoArgsConstructor
public class Reply {

    private int replyNo;        // 댓글 번호
    private int boardNo;        // 게시글 번호
    private String writer;      // 댓글 작성자 ID
    private String userName;    // 댓글 작성자 이름
    private String content;     // 댓글 내용
    private Date replyDate;     // 댓글 작성 시간

}
