package com.board.mvc.web.users.repository;

import com.board.mvc.web.users.domain.ModifyUser;
import com.board.mvc.web.users.domain.User;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface UserMapper {

    //회원 가입 기능
    void register(User user);

    //회원 탈퇴 기능
    void withdraw(String userId);

    //전체 회원 조회 기능
    List<User> findAllUser();

    //단일 회원 조회 기능
    User findOneUser(String userId);

    //회원 정보 수정 기능
    void changeUser(ModifyUser modifyUser);



}