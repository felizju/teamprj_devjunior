package com.board.mvc.web.users.service;

import com.board.mvc.web.users.domain.ModifyUser;
import com.board.mvc.web.users.domain.User;
import com.board.mvc.web.users.repository.UserMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
@RequiredArgsConstructor
public class UserService {

    private final UserMapper userMapper;

    // 회원 정보 저장 기능
    public void register(User user) {
        userMapper.register(user);
    }

    // 회원 정보 삭제 기능
    public void delete(String userId) {
        userMapper.withdraw(userId);
    }

    // 단일 회원 정보 조회 기능
    public User findOne(String userId) {
        return userMapper.findOneUser(userId);
    }

    // 모든 회원 정보 조회 기능
    public List<User> findAll() {
        return userMapper.findAllUser();
    }

    // 회원 정보 수정 기능
    public void modify(String userId, ModifyUser modifyUser) {
        modifyUser.setUserId(userId);//회원 아이디는 PK라 변경 못하게하고 기존 아이디를 이어받도록 함.
        userMapper.changeUser(modifyUser);
    }

    // 아이디 존재 여부 확인 기능
    public boolean isIdFound(String newId) {
        if (userMapper.findOneUser(newId) == null) {
            return false;
        } else {
            return true;
        }
    }


    // 닉네임 존재 여부 확인 기능
    public boolean isNickFound(String newNick, List<User> list) {
        List<String> nickList = new ArrayList<>();
        List<User> allUser = userMapper.findAllUser();
        for (User user : allUser) {
            nickList.add(user.getUserName());
        }

        if (nickList.contains(newNick)) {
            return true;
        } else {
            return false;
        }
    }

    // 비밀번호 확인 기능
    public boolean isPwRight(User loginUser) {
        User user = userMapper.findOneUser(loginUser.getUserId());

        if (user.getUserPw().equals(loginUser.getUserPw())) {
            return true;
        } else {
            return false;
        }
    }

}