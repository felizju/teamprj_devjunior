package com.board.mvc.web.users.repository;

import com.board.mvc.web.users.domain.ModifyUser;
import com.board.mvc.web.users.domain.User;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
class UserMapperTest {

    @Autowired
    private UserMapper userMapper;

    //성공
    @Test
    @DisplayName("입력한 User 정보가 DB에 저장되어야 한다.")
    void registerTest() {
        User user = new User();
        user.setUserId("bb");
        user.setUserPw("12312312");
        user.setUserName("333");
        userMapper.register(user);
    }

    //성공
    @Test
    @DisplayName("지정한 User 정보가 DB에서 삭제되어야 한다.")
    void deleteTest() {
        userMapper.withdraw("ddd");
    }

    //성공
    @Test
    @DisplayName("전체 User가 조회되어야 한다.")
    void findAllTest() {
        List<User> userList = userMapper.findAllUser();
        System.out.println("총 사용자 수 : " + userList.size());
        for (User user : userList) {
            System.out.println("유저들 : " + user);
        }
    }

    //성공
    @Test
    @DisplayName("입력한 userId에 맞는 User객체가 조회되어야 한다.")
    void findOneTest() {
        User user = userMapper.findOneUser("aaa");
        System.out.println("해당 사용자 : " + user);
    }

    //성공
    @Test
    @DisplayName("입력한 userId에 맞는 User객체의 정보가 변경되어야 한다.")
    void changeTest() {
        ModifyUser modifyUser = new ModifyUser();
        modifyUser.setUserId("bbb");
        modifyUser.setUserPw("111");
        modifyUser.setUserName("1111");
        userMapper.changeUser(modifyUser);
    }
}