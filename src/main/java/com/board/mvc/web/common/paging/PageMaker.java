package com.board.mvc.web.common.paging;

import lombok.Getter;
import lombok.ToString;

@Getter @ToString
public class PageMaker {

    private static final int PAGE_COUNT = 5;

    private int beginPage;
    private int endPage;
    private boolean prev, next;

    private Criteria criteria;
    private int totalCount;

    public PageMaker(Criteria criteria, int totalCount){
        this.criteria = criteria;
        this.totalCount = totalCount;
        this.endPage = (int) Math.ceil((double) criteria.getPage()/PAGE_COUNT) * PAGE_COUNT;
        this.beginPage = endPage - PAGE_COUNT + 1;
        int realEnd = (int) Math.ceil((double) totalCount / criteria.getAmount());
        if(realEnd <= endPage){
            this.endPage = realEnd;
        }
        this.prev = this.beginPage > 1;
        this.next = this.endPage < realEnd;

    }

}