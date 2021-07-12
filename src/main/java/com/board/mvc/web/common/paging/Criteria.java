package com.board.mvc.web.common.paging;

import lombok.Getter;
import lombok.ToString;

@Getter @ToString
public class Criteria {

    // 페이징
    private int page;
    private int amount;

    // 검색
    private String type; // 타입
    private String keyword; // 고객이 검색할 키워드

    public Criteria(String type, String keyword) {
        this.type = type;
        this.keyword = keyword;
    }

    public void setType(String type) {
        this.type = type;
    }

    public void setKeyword(String keyword) {
        this.keyword = keyword;
    }

    public Criteria(){
        this(1,10);
    }

    public Criteria(int page, int amount){
        this.page = page;
        this.amount = amount;
    }

    public void setPage(int page){
        if(page <= 0){
            this.page = 1;
            return;
        }
        this.page = page;
    }

    public void setAmount(int amount){
        if(amount <= 0 || amount > 100){
            this.amount = 10;
            return;
        }
        this.amount = amount;
    }

}
