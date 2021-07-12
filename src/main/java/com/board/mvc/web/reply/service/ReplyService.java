package com.board.mvc.web.reply.service;


import com.board.mvc.web.reply.domain.ModifyReply;
import com.board.mvc.web.reply.domain.Reply;
import com.board.mvc.web.reply.repository.ReplyMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class ReplyService {

    private final ReplyMapper replyMapper;

    // 댓글 저장 기능
    public void saveReply(Reply reply){
        replyMapper.saveReply(reply);
    }

    // 댓글 삭제 기능
    public void deleteReply(int replyNo){
        replyMapper.deleteReply(replyNo);
    }

    // 댓글 수정 기능
    public void changeReply(Reply reply){
        replyMapper.changeReply(reply);
    }

    // 전체 댓글 조회 기능
    public List<Reply> finedAllReply(int boardNo){
        return replyMapper.findAllReply(boardNo);
    }

    // 단일 댓글 조회 기능
    public Reply findOneReply(int replyNo){
        return replyMapper.findOneReply(replyNo);
    }

    public boolean isAuthor(String loginId, String bulId) {
        if (loginId.equals(bulId)) {
            return true;
        } else {
            return false;
        }
    }

}
