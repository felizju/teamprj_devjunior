package com.board.mvc.web.users.domain;

import lombok.*;

@Getter @Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class User {

    private String userId;      // 사용자 아이디
    private String userPw;      // 사용자 비밀번호
    private String userName;        // 사용자 이름

}
