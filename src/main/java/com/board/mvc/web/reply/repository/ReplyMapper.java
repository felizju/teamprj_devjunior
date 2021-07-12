package com.board.mvc.web.reply.repository;

import com.board.mvc.web.reply.domain.ModifyReply;
import com.board.mvc.web.reply.domain.Reply;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface ReplyMapper {

    // 댓글 저장 기능
    void saveReply(Reply reply);

    // 댓글 삭제 기능
    void deleteReply(int replyNo);

    // 댓글 수정 기능
    void changeReply(Reply reply);

    // 단일 댓글 조회 기능
    Reply findOneReply(int replyNo);

    // 전체 댓글 조회 기능
    List<Reply> findAllReply(int boardNo);
}
