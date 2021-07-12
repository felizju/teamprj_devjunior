package com.board.mvc.web.board.repository;

import com.board.mvc.web.board.domain.Bulletin;
import com.board.mvc.web.board.domain.ModifyBulletin;
import com.board.mvc.web.common.paging.Criteria;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface BulletinMapper {

    // 게시글 등록하기
    void insertArticle(Bulletin bulletin);

    // 게시글 삭제하기
    void deleteArticle(int boardNo);

    // 게시글 전체보기
    List<Bulletin> getArticles();

    // 게시글 전체보기 - paging 처리
    List<Bulletin> getArticles(Criteria criteria);

    // 게시글 내용보기
    Bulletin getArticleContent(int boardNo);

    // 게시글 수정하기
    void modifyArticle(ModifyBulletin modifyBulletin);

    // 조회 수 증가
    void viewCntUp(int boardNo);

    // 추천 수 증가
    void recCntUp(int boardNo);

    // 총 게시글 수 조회
    int getTotalCount(Criteria criteria);

    //게시글 검색
    List<Bulletin> listSearch(Criteria criteria);

}