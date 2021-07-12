package com.board.mvc.web.board.repository;

import com.board.mvc.web.board.domain.Bulletin;
import com.board.mvc.web.common.paging.Criteria;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;

@SpringBootTest
class BulletinMapperTest {

    @Autowired BulletinMapper bulletinMapper;
    @Test
    void insertTest(){
        Bulletin bulletin = new Bulletin();
        bulletin.setWriter("aa");
        bulletin.setTitle("제목3");
        bulletin.setContent("내용3");
        bulletinMapper.insertArticle(bulletin);
    }

    @Test
    void deleteArticle(){
        bulletinMapper.deleteArticle(21);
    }

    @Test
    void getArticle(){
        List<Bulletin> list = bulletinMapper.getArticles();
        for (Bulletin bulletin : list) {
            System.out.println(bulletin);
        }
    }

    @Test
    @DisplayName("300개의 게시글을 등록")
    void bulkInsert(){
        for (int i = 0; i < 300; i++) {
            Bulletin bulletin = new Bulletin();
            bulletin.setTitle("테스트제목"+i);
            bulletin.setContent("테스트내용"+i);
            bulletin.setWriter("aa");

            bulletinMapper.insertArticle(bulletin);
        }
    }

    @Test
    @DisplayName("검색 테스트")
    void searchTest() {
        Criteria criteria = new Criteria("titleAndContent", "바바");
        List<Bulletin> list = bulletinMapper.listSearch(criteria);
        System.out.println("================================================");
        for (Bulletin bulletin : list) {
            System.out.println(bulletin);
        }
    }

}