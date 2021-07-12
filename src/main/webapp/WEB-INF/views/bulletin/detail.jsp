<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>게시글 보기</title>

    <!-- main css -->
    <link rel="stylesheet" href="/css/main.css">

    <!-- bootstrap css -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootswatch@4.5.2/dist/minty/bootstrap.min.css"
        integrity="sha384-H4X+4tKc7b8s4GoMrylmy2ssQYpDHoqzPa9aKXbDwPoPUA3Ra8PA5dGzijN+ePnH" crossorigin="anonymous">

    <!-- linearicons -->
    <link rel="stylesheet" href="https://cdn.linearicons.com/free/1.0.0/icon-font.min.css">

    <script defer></script>
    <style>
        h1 {
            text-align: center;
            margin-top: 50px;
        }

        .gradle-img {
            width: 50px;
            height: 50px;
        }

        .gradle {
            width: 100%;
            height: 100%;
        }

        .insert {
            position: absolute;
            left: 50%;
            top: 50%;
            transform: translate(-50%, -40%);
        }

        .inputA {
            border: 1px solid lightgray;
            border-radius: 5px;
            width: 600px;
            height: 40px;
            padding: 5px;
        }

        .btn-lg {
            width: 150px;
            margin: 10px;
        }

        .post-time {
            font-size: 12px;
            float: right;
        }

        .thumbs {
            font-size: 30px;
            position: absolute;
            right: 50px;
            top: -65px;
        }

        .content-container {
            display: flex;
            position: relative;

        }

        section.content {
            width: 50%;
            margin: 0 auto;
        }

        div.button-group {
            text-align: center;
        }

        .hide {
            display: none;
        }

        td,
        th {
            text-align: center;
        }
        #navbarColor01{
            margin-right: 30px !important;
        }
        .mt-4{
            font-weight: bold;
            font-size: 17px;
        }
        .cont{
            font-size: 17px;
            line-height: 40px;
        }
        #btn-reply{
            margin: 20px;
            margin-top: 30px;
        }
        .replyh1{
            font-size: 15px;
        }

        span.lnr-undo,
        span.lnr-checkmark-circle {
            display: inline-block;
            transform: scale(1.2);
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
                            href="https://itstar.edueroom.co.kr/lecture.php?action=view&no=177&code=0b0104"
                            target="_blank">Education</a>
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

    <h1>게시글 보기</h1>
    <section class="content">
        <div class="form-group">
            <label for="exampleTextarea" class="form-label mt-4">NO</label><br>
            <p class="cont">${bulletin.boardNo}</p>
        </div>
        <div class="form-group">
            <label for="exampleTextarea" class="form-label mt-4">TITLE</label><br>
            <p class="cont">${bulletin.title}</p>
        </div>
        <div class="post-time">
            <label for="exampleTextarea" class="form-label mt-4">DATE</label>
            <p class="cont">
                <fmt:formatDate pattern="yyyy년 MM월 dd일 HH:mm:ss" value="${bulletin.postTime}" />
            </p>
        </div>
        <div class="form-group">
            <label for="exampleTextarea" class="form-label mt-4">WRITER</label><br>
            <p class="cont">${bulletin.userName}</p>
        </div>
        <div class="form-group">
            <label for="exampleTextarea" class="form-label mt-4">VIEWS</label><br>
            <p class="cont">${bulletin.viewCnt}</p>
        </div>
        <div class="form-group">
            <label for="exampleTextarea" class="form-label mt-4">RECOMMEND</label><br>
            <p class="cont">${bulletin.recommend}</p>
        </div>
        <div class="content-container">
            <div class="form-group">
                <label for="exampleTextarea" class="form-label mt-4">CONTENT</label><br>
                <p class="cont">${bulletin.content}</p>
            </div>
            <div class="thumbs">
                <a href="/bulletin/recommend?boardNo=${bulletin.boardNo}&viewFlag=false"><span
                        class="lnr lnr-thumbs-up"></span></a>
            </div>
        </div>
        <br>
        <div class="button-group">
            <a href="/bulletin/list" class="btn btn-primary btn-lg">목록보기</a>
            <a href="/bulletin/modify?boardNo=${bulletin.boardNo}&viewFlag=false" class="btn btn-primary btn-lg"
                id="modify-bulletin">수정하기</a>
            <a href="/bulletin/delete?boardNo=${bulletin.boardNo}" class="btn btn-primary btn-lg"
                id="delete-bulletin">삭제하기</a>
        </div>

        
        <!-- 댓글 입력 -->
        <hr>
        <form action="/reply/insert" method="POST">
            <input type="hidden" name="boardNo" value="${bulletin.boardNo}">
            <input type="hidden" name="writer" value="aa"><br>
            <input type="hidden" name="userName" value="bb">
            <div>
                <div class="form-group">
                    <label for="exampleTextarea" class="form-label mt-4">댓글</label><br>
                </div>
                <div>
                    <textarea class="form-control" name="content" id="exampleTextarea" rows="3"
                        placeholder="댓글을 입력해주세요."></textarea>
                </div>
                <button type="submit" class="btn btn-primary btn-lg" id="btn-reply">댓글 작성</button>
            </div>
        </form>


        <!-- 댓글 목록 출력 -->
        <hr>
        <c:if test="${replyList.size() <= 0}">
            <p>댓글이 존재하지 않습니다.</p>
        </c:if>

        <c:if test="${replyList.size() > 0}">
            <table class="table table-hover">
                <tbody>
                    <tr class="table-active">
                        <th scope="col">작성자</th>
                        <th scope="col">댓글내용</th>
                        <th scope="col">작성일자</th>
                        <th scope="col">수정</th>
                        <th scope="col">삭제</th>
                    </tr>
                    <c:forEach var="reply" items="${replyList}">
                        <tr class="reply-list" value="${reply.replyNo}">
                            <td>${reply.userName}</td>
                            <td class="reply-content"><span>${reply.content}</span></td>

                            <td>
                                <fmt:formatDate pattern="yyyy/MM/dd HH:mm:ss" value="${reply.replyDate}" />
                            </td>
                            <td>
                                <a class="modi" href="#" value="${reply.replyNo}">
                                    <div class="modify">
                                        <span class="lnr lnr-undo"></span>
                                    </div>
                                </a>
                            <td>
                                <a href="/reply/delete?replyNo=${reply.replyNo}&boardNo=${bulletin.boardNo}">
                                    <div class="remove">
                                        <span class="lnr lnr-cross-circle"></span>
                                    </div>
                                </a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
            </fieldset>
        </c:if>
    </section>
    <script>
        const $replyList = document.querySelector('.reply-list');


        //댓글 수정 모드 진입 이벤트 처리 함수
        function enterModifyMode($modSpan) {

            $modSpan.classList.replace('lnr-undo', 'lnr-checkmark-circle');
            // console.log($modSpan);
            const $reList = $modSpan.parentNode.parentNode.parentNode.parentNode;
            console.log($reList.getAttribute('value'));
            // console.log($reList);
            // console.log($reList.firstElementChild.nextElementSibling.firstElementChild);
            const $label = $reList.firstElementChild.nextElementSibling;
            const $textSpan = $label.firstElementChild;

            const $modInput = document.createElement('input');
            $modInput.setAttribute('type', 'text');
            $modInput.classList.add('mod-input');
            $modInput.setAttribute('value', $textSpan.textContent);

            $label.replaceChild($modInput, $textSpan);

        }

        //댓글 수정 완료 이벤트 처리 함수 정의
        function modifyReply($modCompleteSpan) {

            const $btn = $modCompleteSpan.parentNode.parentNode;
            console.log($btn);

            console.log("댓글번호" + $btn.getAttribute('value'));
            
            
            $modCompleteSpan.classList.replace('lnr-checkmark-circle', 'lnr-undo');
            
            // const $reList = $modSpan.parentNode.parentNode.parentNode.parentNode;
            // console.log($reList.getAttribute('value'));
            const $reList = $modCompleteSpan.parentNode.parentNode.parentNode.parentNode;
            console.log($reList);
            
            
            const $label = $reList.firstElementChild.nextElementSibling;
            // const $label = $modCompleteSpan.parentNode.parentNode.parentNode.parentNode;
            console.log($label);
            const $modInput = $label.firstElementChild;
            console.log($modInput);
            $btn.setAttribute('href', '/reply/modify?replyNo='+$btn.getAttribute('value')+'&boardNo=${bulletin.boardNo}&content='+$modInput.value);

            const $textSpan = document.createElement('span');
            $textSpan.classList.add('text');
            $textSpan.textContent = $modInput.value;

            $label.replaceChild($textSpan, $modInput);

        }

        //댓글 삭제 이벤트 처리 함수 정의
        function deleteReply($targetSpan) {

            const $reList = $targetSpan.parentNode.parentNode.parentNode.parentNode;

            const $delForm = document.getElementById('del-form');
            $delForm.submit();

        }



        $replyList.addEventListener('click', e => {
            console.log('target:',e.target);
            if (e.target.matches('div span.lnr-undo')) {
                e.preventDefault();
                enterModifyMode(e.target);
            } else if (e.target.matches('div span.lnr-checkmark-circle')) {
                modifyReply(e.target);
            } else {
                return;
            }
        });

        document.querySelector('div span.lnr-cross-circle').addEventListener('click', e => {

            deleteReply(e.target);

        })
        // function enterModifyMode($modifySpan) {
        //     $modifySpan.classList.replace('lnr-undo', 'lnr-checkmark-circle'); // 아이콘 버튼 수정
        //     const $label = $modifySpan.parentNode.previousElementSibling;
        //     const $textSpan = $label.lastElementChild.previousElementSibling;
        //     const $modInput = document.createElement('input'); // input 텍스트로 교체
        //     $modInput.setAttribute('type', 'text');
        //     $modInput.classList.add('mod-input'); // 클래스 삽입
        //     $modInput.setAttribute('value', $textSpan.textContent);
        //     $label.replaceChild($modInput, $textSpan);
        // }


        // function modifyToDoDate($modifyComSpan) {
        //     $modifyComSpan.classList.replace('lnr-checkmark-circle', 'lnr-undo');
        //     const $label = $modifyComSpan.parentNode.previousElementSibling;
        //     const $modInput = $label.lastElementChild;
        //     const $textSpan = document.createElement('span');
        //     $textSpan.classList.add('span');
        //     $textSpan.textContent = $modInput.value;
        //     $label.replaceChild($textSpan, $modInput);
        // }


        // // 메인 즉시 실행 함수
        // const $list = document.querySelector('.list');
        // console.log($list);

        // // 수정 이벤트
        // $list.addEventListener('click', e => {
        //     if (e.target.matches('.list .modify .lnr-undo')) {
        //         console.log('수정모드 진입');
        //         enterModifyMode(e.target);
        //     } else if (e.target.matches('.list .modify .lnr-checkmark-circle')) {
        //         console.log('수정모드 완료');
        //         modifyToDoDate(e.target);
        //     } else {
        //         return;
        //     }
        // });


        const $modifyBul = document.getElementById('modify-bulletin');
        const $deleteBul = document.getElementById('delete-bulletin');


        fetch('http://192.168.1.155:8181/bulletin/bulIdentify/${bulletin.writer}')
            .then(res => res.json())
            .then(result => {
                console.log("본인 확인 결과 : " + result);
                if (result) { // 글 작성자와 현재 사용자가 같을 때

                } else { //글 작성자와 현재 사용자가 다를 때
                    hideBtn(result);
                }
            });


        function hideBtn(result) {
            if (!result) {
                $modifyBul.classList.add('hide');
                $deleteBul.classList.add('hide');
            }
        }

        //접속중인 유저 확인
        fetch('http://192.168.1.155:8181/users/now-user')
            .then(res => res.json())
            .then(nowUser => {
                console.log(nowUser.userName);
                hideLogin(nowUser.userName);
                hideLogout(nowUser.userName);

            });

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