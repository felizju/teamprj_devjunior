package com.board.mvc.web.reply.controller;

import com.board.mvc.web.reply.domain.Reply;
import com.board.mvc.web.reply.service.ReplyService;
import com.board.mvc.web.users.domain.User;
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
@Log4j2
@RequestMapping("/reply")
public class ReplyController {

    private ReplyService replyService;

    private static final String LOGIN_USER = "loginUser";

    @Autowired
    public ReplyController(ReplyService replyService){
        this.replyService = replyService;
    }

    // 댓글 정보 삭제 요청
    @GetMapping("/delete")
    public String delete(int replyNo, int boardNo){
        log.info("/reply/delete GET!!!");
        replyService.deleteReply(replyNo);
        return "redirect:/bulletin/detail?boardNo="+boardNo+"&viewFlag=false";
    }

    // 댓글 등록 처리 요청
    @PostMapping("/insert")
    public String insert(Reply reply, HttpSession session, Model model){
        User user = (User) session.getAttribute(LOGIN_USER);
        if (user == null) {
            //현재 로그인중인 유저가 없으면 그냥 진행
            return "/users/logIn";
        } else {
            reply.setWriter(user.getUserId());
            reply.setUserName(user.getUserName());
            model.addAttribute("nowUser", user);
            log.info("/reply/insert POST - " + reply);
            replyService.saveReply(reply);
            return "redirect:/bulletin/detail?boardNo=" + reply.getBoardNo() + "&viewFlag=false";
        }
    }

    // 본인 확인 요청
    @GetMapping("/reIdentify/{id}")
    @ResponseBody
    public ResponseEntity<Boolean> identify(@PathVariable String id, HttpSession session) {
        log.info("/users/identify" + id + " GET 비동기 요청!");
        User user = (User) session.getAttribute(LOGIN_USER);
        if (user == null) {
            return new ResponseEntity<>(false, HttpStatus.OK);
        } else if (replyService.isAuthor(user.getUserId(), id)) {//해당 아이디가 이미 존재하면 true 리턴
            return new ResponseEntity<>(true, HttpStatus.OK);
        } else {//해당 아이디가 존재하지 않으면 false 리턴
            return new ResponseEntity<>(false, HttpStatus.OK);
        }

    }


    // 댓글 수정 처리 요청
    @GetMapping("/modify")
    public String modify(Reply reply, HttpSession session, Model model){
        User user = (User) session.getAttribute(LOGIN_USER);
        if (user == null) {
            //현재 로그인중인 유저가 없으면 그냥 진행
            return "/users/logIn";
        } else {
            reply.setWriter(user.getUserId());
            reply.setUserName(user.getUserName());
            model.addAttribute("nowUser", user);
        }
        log.info("/reply/modify POST -" + reply);
        replyService.changeReply(reply);
        return "redirect:/bulletin/detail?boardNo="+reply.getReplyNo()+"&viewFlag=false";
    }



}
