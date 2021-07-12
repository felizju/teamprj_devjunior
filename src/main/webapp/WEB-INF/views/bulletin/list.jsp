<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Developer's Community</title>

    <!-- main css -->
    <link rel="stylesheet" href="/css/main.css">

    <!-- bootstrap css -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootswatch@4.5.2/dist/minty/bootstrap.min.css"
        integrity="sha384-H4X+4tKc7b8s4GoMrylmy2ssQYpDHoqzPa9aKXbDwPoPUA3Ra8PA5dGzijN+ePnH" crossorigin="anonymous">

    <style>
        body {
            position: relative;
        }

        h1 {
            text-align: center;
            padding: 50px;
        }

        #community {
            width: 100%;   
        }

        .d-flex {
            float: right;
            margin: 20px;
        }

        .d-flex .type {
            border: 2px solid lightgray;
            border-radius: 5px;
        }

        .d-flex .search {
            border: 2px solid lightgray;
            border-radius: 5px;
        }

        .gradle-img {
            width: 50px;
            height: 50px;
        }

        .gradle {
            width: 100%;
            height: 100%;
        }

        .pageMaker {
            position: absolute;
            left: 50%;
            bottom: -20%;
            transform: translateX(-50%);
        }

        #btn-write {
            float: right;
            margin: 50px;
        }

        .hide {
            display: none;
        }
        
        td, th{
            text-align: center;
        }

    </style>
</head>

<body>
    <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
        <div class="container-fluid">
            <a class="navbar-brand" href="/bulletin/list">
                <div class="gradle"><img class="gradle-img" src="/images/gradle.png"></div>
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarColor01"
                aria-controls="navbarColor01" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarColor01">
                <ul class="navbar-nav me-auto">
                    <li class="nav-item">
                        <a class="nav-link active" href="/bulletin/list">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link"
                            href="https://itstar.edueroom.co.kr/lecture.php?action=view&no=177&code=0b0104" target="_blank">Education</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="https://github.com/" target="_blank">Git Site</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/users/myInfo">My Info</a>
                    </li>

                    <form class="log-In" id="loginBtn">
                        <a href="/users/login" id="loginBtn" class="btn btn-warning">LOG IN</a>
                        <a href="/users/sign-up" id="singupBtn" class="btn btn-info">SIGN UP</a>
                    </form>
                    <form class="log-In" id="logoutBtn">
                        <a href="/users/logout" id="logoutBtn" class="btn btn-secondary">LOG OUT</a>
                    </form>
            </div>
        </div>
    </nav>

    <img id="community" src="/images/community.png">

    <h1>Developer's Community</h1>

    <!-- 검색 영역 -->
    <div class="d-flex">
        <form action="/bulletin/list">
            <select name="type" class="type">
                <option value="writer">작성자</option>
                <option value="title">제목</option>
                <option value="content">내용</option>
                <option value="titleAndContent">제목+내용</option>
            </select>

            <input class="search" name="keyword" type="text" placeholder="Search">
            <button class="btn btn-secondary my-2 my-sm-0" type="submit">Search</button>
        </form>
    </div>

    <c:if test="${bulletinList.size() <= 0}">
        <p>게시물이 존재하지 않습니다.</p>
    </c:if>

    <c:if test="${bulletinList.size() > 0}">
        <table class="table table-hover" id="bulletinTable">
            <tbody>
                <tr class="table-active">
                    <th scope="col">글번호</th>
                    <th scope="col">작성자</th>
                    <th scope="col">글제목</th>
                    <th scope="col">등록일자</th>
                    <th scope="col">조회수</th>
                    <th scope="col">추천</th>
                </tr>
                <c:forEach var="bulletin" items="${bulletinList}">
                    <tr>
                        <td>${bulletin.boardNo}</td>
                        <td>${bulletin.userName}</td>
                        <td><a href="/bulletin/detail?boardNo=${bulletin.boardNo}&viweFlag=true">${bulletin.title}</a>
                        </td>
                        <td>
                            <fmt:formatDate pattern="yyyy년 MM월 dd일 HH:mm:ss" value="${bulletin.postTime}" />
                        </td>
                        <td>${bulletin.viewCnt}</td>
                        <td>${bulletin.recommend}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>


        <!-- 페이지 영역 -->
        <div class="pageMaker">
            <ul class="pagination">
                <c:if test="${pageMaker.prev}">
                    <li class="page-item">
                        <a class="page-link"
                            href="/bulletin/list?page=${pageMaker.beginPage - 1}&type=${pageMaker.criteria.type}&keyword=${pageMaker.criteria.keyword}">&laquo;</a>
                    </li>
                </c:if>
                <c:forEach var="i" begin="${pageMaker.beginPage}" end="${pageMaker.endPage}" step="1">
                    <li data-page="${i}" class="page-item">
                        <a class="page-link"
                            href="/bulletin/list?page=${i}&type=${pageMaker.criteria.type}&keyword=${pageMaker.criteria.keyword}">[${i}]</a>
                    </li>
                </c:forEach>
                <c:if test="${pageMaker.next}">
                    <li class="page-item">
                        <a class="page-link"
                            href="/bulletin/list?page=${pageMaker.endPage + 1}&type=${pageMaker.criteria.type}&keyword=${pageMaker.criteria.keyword}">&raquo;</a>
                    </li>
                </c:if>
            </ul>
        </div>
    </c:if>

    <p>
        <a href="/bulletin/insert" class="btn btn-primary btn-lg" id="btn-write">글쓰기</a>
    </p>


    <script>
        function appendPageActive(curPageNum) {
            const $ul = document.querySelector('.pagination');
            for (let $li of [...$ul.children]) {
                if ($li.dataset.page === curPageNum) {
                    $li.classList.add('active');
                }
            }
        }

        (function () {
            appendPageActive('${pageMaker.criteria.page}');
            //접속중인 유저 확인
            fetch('http://192.168.1.155:8181/users/now-user')
                .then(res => res.json())
                .then(nowUser => {
                    console.log(nowUser.userName);
                    hideLogin(nowUser.userName);
                    hideLogout(nowUser.userName);
    
                });
        }());


        const $loginBtn = document.getElementById('loginBtn');
        // const $signupBtn = document.getElementById('signupBtn');
        const $logoutBtn = document.getElementById('logoutBtn');

        function hideLogout(uName) {
            if (uName == "anonymous") {
                $logoutBtn.classList.add('hide');
            } else {
                $logoutBtn.classList.remove('hide');
            }
        }

        function hideLogin(uName) {
            if (uName == "anonymous") {
                $loginBtn.classList.remove('hide');
                // $signupBtn.classList.remove('hide');
            } else {
                $loginBtn.classList.add('hide');
                // $signupBtn.classList.add('hide');
            }
        }
    </script>

</body>

</html>