package com.board.mvc.web.board.controller;

import com.board.mvc.web.board.domain.Bulletin;
import com.board.mvc.web.board.domain.ModifyBulletin;
import com.board.mvc.web.board.service.BulletinService;
import com.board.mvc.web.common.paging.Criteria;
import com.board.mvc.web.common.paging.PageMaker;
import com.board.mvc.web.reply.domain.Reply;
import com.board.mvc.web.reply.service.ReplyService;
import com.board.mvc.web.users.domain.User;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@Log4j2
@RequestMapping("/bulletin")
@RequiredArgsConstructor
@CrossOrigin
public class BulletinController {

    private final BulletinService bulletinService;
    private final ReplyService replyService; // 댓글서비스 주입

    private static final String LOGIN_USER = "loginUser";

    // 게시글 등록 화면 요청
    @GetMapping("/insert")
    public String insert(HttpSession session, Model model) {
        log.info("/bulletin/insert GET");
        User user = (User) session.getAttribute(LOGIN_USER);
        model.addAttribute("nowUser", user);
//        log.info("/myInfo : " + user + " GET 요청!");
        //현재 로그인된 사용자가 없으면 로그인 화면으로 이동
        if (user == null) {
            return "/users/logIn";
        } else {
            return "bulletin/insert";
        }
    }

    // 게시글 등록 처리 요청
    @PostMapping("/insert")
    public String insert(Bulletin bulletin, HttpSession session, Model model) {
        log.info("/bulletin/insert POST");
        User user = (User) session.getAttribute(LOGIN_USER);
        if (user == null) {
            //현재 로그인중인 유저가 없으면 그냥 진행
        } else {
            bulletin.setWriter(user.getUserId());
            bulletin.setUserName(user.getUserName());
            model.addAttribute("nowUser", user);
        }
        bulletinService.insertArticle(bulletin);
        return "redirect:/bulletin/list";
    }

    // 본인 확인 요청
    @GetMapping("/bulIdentify/{id}")
    @ResponseBody
    public ResponseEntity<Boolean> identify(@PathVariable String id, HttpSession session) {
        log.info("/users/identify" + id + " GET 비동기 요청!");
        User user = (User) session.getAttribute(LOGIN_USER);
        if (user == null) {
            return new ResponseEntity<>(false, HttpStatus.OK);
        } else if (bulletinService.isAuthor(user.getUserId(), id)) {//해당 아이디가 이미 존재하면 true 리턴
            return new ResponseEntity<>(true, HttpStatus.OK);
        } else {//해당 아이디가 존재하지 않으면 false 리턴
            return new ResponseEntity<>(false, HttpStatus.OK);
        }

    }

    // 게시물 전체 조회 - paging 처리
    @GetMapping("/list")
    public String list(Model model, Criteria criteria) {
        log.info("/bulletin/list GET- " + criteria);
        model.addAttribute("bulletinList", bulletinService.getArticles(criteria));
        model.addAttribute("pageMaker", new PageMaker(criteria, bulletinService.getTotalCount(criteria)));
        return "bulletin/list";
    }

    // 게시글 정보 삭제 요청
    @GetMapping("/delete")
    public String delete(int boardNo) {
        log.info("/bulletin/delete GET!!!");
        bulletinService.deleteArticle(boardNo);
        return "redirect:/bulletin/list";
    }


    // 게시글 세부 정보
    @GetMapping("/detail")
    public String detail(Model model, int boardNo, boolean viewFlag) {
        bulletinService.viewCount(boardNo);
        Bulletin bulletin = bulletinService.getArticleContent(boardNo, viewFlag);
        model.addAttribute("bulletin", bulletin);

        // 전체 댓글 조회
        List<Reply> replyList = replyService.finedAllReply(boardNo);
        log.info(replyList);
        model.addAttribute("replyList", replyList);
        return "bulletin/detail";
    }


    // 게시글 수정 화면 요청
    @GetMapping("/modify")
    public String modify(Model model, int boardNo, boolean viewFlag, HttpSession session) {
        User user = (User) session.getAttribute(LOGIN_USER);
        Bulletin bulletin = bulletinService.getArticleContent(boardNo, viewFlag);
        model.addAttribute("nowUser", user);
        model.addAttribute("bulletin", bulletin);
        return "bulletin/modify";
    }


    // 게시글 수정 처리 요청
    @PostMapping("/modify")
    public String modify(ModifyBulletin modifyBulletin, boolean viewFlag, HttpSession session, Model model) {
        User user = (User) session.getAttribute(LOGIN_USER);
        if (user == null) {
            //현재 로그인중인 유저가 없으면 그냥 진행
        } else {
            modifyBulletin.setWriter(user.getUserId());
            modifyBulletin.setUserName(user.getUserName());
            model.addAttribute("nowUser", user);
        }
        bulletinService.modifyArticle(modifyBulletin);
        return "redirect:/bulletin/detail?boardNo=" + modifyBulletin.getBoardNo() + "&viewFlag=" + viewFlag;
    }

    // 추천 수 증가 요청
    @GetMapping("/recommend")
    public String recommend(Model model, int boardNo, boolean viewFlag) {
        bulletinService.recCntUp(boardNo);
        Bulletin bulletin = bulletinService.getArticleContent(boardNo, viewFlag);
        model.addAttribute("bulletin", bulletin);
        return "redirect:/bulletin/detail?boardNo=" + boardNo + "&viewFlag=false";
    }


}