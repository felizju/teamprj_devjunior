package com.board.mvc.web.users.controller;

import com.board.mvc.web.users.domain.ModifyUser;
import com.board.mvc.web.users.domain.User;
import com.board.mvc.web.users.service.UserService;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/users")
@Log4j2
@CrossOrigin
public class UserController {

    private final UserService userService;

    private static final String LOGIN_USER = "loginUser";

    @Autowired
    public UserController(UserService userService) {
        this.userService = userService;
    }

    //로그인 화면 요청
    @GetMapping("/login")
    public String signIn() {
        return "/users/logIn";
        //id, pw 입력화면 호출
    }

    //로그인 정보 저장 요청
    @PostMapping("/login")
    public String signIn(User user, HttpSession session, Model model) {
        User loginUser = userService.findOne(user.getUserId());
        if (userService.isIdFound(user.getUserId())) {
            if (userService.isPwRight(user)) {
                log.info("로그인 성공한 유저 : " + loginUser);
                session.setAttribute(LOGIN_USER, loginUser);
                User user1 = (User) session.getAttribute(LOGIN_USER);
                log.info("로그인 됨?" + user1);
                model.addAttribute("userId", loginUser.getUserId());
                return "/users/login-success";
            } else {
                log.info("err : wrong password!!");
                return "/users/login-fail";
            }
        } else {
            log.info("err : incorrect id!!");
            return "/users/login-fail";
        }

    }


    //회원가입 화면 요청
    @GetMapping("/sign-up")
    public String singUp() {
        return "/users/signUp";
        //회원 정보 작성 화면 호출
    }

    //회원가입 시 아이디 중복 여부 확인 요청
    @GetMapping("/exist/{id}")
    @ResponseBody
    public ResponseEntity<Boolean> checkId(@PathVariable String id) {
        log.info("/users/exist" + id + " GET 비동기 요청!");
        if (userService.isIdFound(id)) {//해당 아이디가 이미 존재하면 true 리턴
            return new ResponseEntity<>(true, HttpStatus.OK);
        } else {//해당 아이디가 존재하지 않으면 false 리턴
            return new ResponseEntity<>(false, HttpStatus.OK);
        }

    }

    //회원가입 또는 닉네임 변경시 닉네임 중복 여부 확인 요청
    @GetMapping("/nick/{nick}")
    @ResponseBody
    public ResponseEntity<Boolean> checkNick(@PathVariable String nick) {
        log.info("/users/nick" + nick + " GET 비동기 요청!");
        List<User> list = userService.findAll();
        if (userService.isNickFound(nick, list)) {//해당 아이디가 이미 존재하면 true 리턴
            return new ResponseEntity<>(true, HttpStatus.OK);
        } else {//해당 아이디가 존재하지 않으면 false 리턴
            return new ResponseEntity<>(false, HttpStatus.OK);
        }

    }

    //현재 로그인 유저 정보 요청
    @GetMapping("/now-user")
    @ResponseBody
    public ResponseEntity<User> nowUserData(HttpSession session) {
        User user = (User) session.getAttribute(LOGIN_USER);
        User tempUser = new User("anonymous", "1234", "anonymous");
        log.info("/users/now-user GET 비동기 요청!");
        if (user == null) {
            log.info("now-user 요청 결과 : null!");
            return new ResponseEntity<>(tempUser, HttpStatus.OK);
        } else {//해당 아이디가 존재하지 않으면 false 리턴
            log.info("now-user 요청 결과 : " + user);
            return new ResponseEntity<>(user, HttpStatus.OK);
        }
    }


    //회원가입 정보 저장 요청
    @PostMapping("/sign-up")
    public String signUp(User user, Model model) {
        userService.register(user);
        model.addAttribute("user", user);
        return "/users/signUp-success";
        //성공시 회원가입 성공 화면 호출
    }

    //회원 상세정보 요청
    @GetMapping("/info")
    public String detail(String userId, HttpSession session, Model model) {
        User user = userService.findOne(userId);
        User user1 = (User) session.getAttribute(LOGIN_USER);
        model.addAttribute("user", user);
        model.addAttribute("nowUser", user1);

        return "/users/user-info";
        //회원 정보 화면 호출
    }

    //회원 정보 수정 화면 요청
    @GetMapping("/modify")
    public String modify(String userId, Model model) {
        User user = userService.findOne(userId);
        model.addAttribute("user", user);
        return "/users/user-info-modify";

    }

    //수정된 회원 정보 저장 요청
    @PostMapping("/modify")
    public String modify(String userId, ModifyUser modifyUser) {
        userService.modify(userId, modifyUser);
        return "redirect:/users/info?userId=" + userId;
    }

    //로그아웃 요청
    @GetMapping("/logout")
    public String logout(HttpSession session, Model model) {
        User user = (User) session.getAttribute(LOGIN_USER);
        log.info("로그아웃 유저 정보" + user);
        model.addAttribute("user", user);
        session.removeAttribute(LOGIN_USER);
        return "/users/logOut";
    }

    //회원 탈퇴 요청
    @GetMapping("/withdraw")
    public String withdraw(String userId) {
        userService.delete(userId);
        return "redirect:/bulletin/list";
        //회원 탈퇴 완료시 탈퇴 완료 화면 또는 완료 메시지와 함께 메인화면 호출
    }

    // 내 정보 보기
    @GetMapping("/myInfo")
    public String myInfo(HttpSession session, Model model) {
        User user = (User) session.getAttribute(LOGIN_USER);
        model.addAttribute("nowUser", user);
//        log.info("/myInfo : " + user + " GET 요청!");
        //현재 로그인된 사용자가 없으면 로그인 화면으로 이동
        if (user == null) {
            return "/users/logIn";
        } else {
            return "redirect:/users/info?userId=" + user.getUserId();
        }
    }


}