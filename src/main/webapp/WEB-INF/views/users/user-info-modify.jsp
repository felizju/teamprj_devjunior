<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>user-info-modify</title>
    <!-- main css -->
    <link rel="stylesheet" href="/css/main.css">

    <!-- bootstrap css -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootswatch@4.5.2/dist/minty/bootstrap.min.css"
        integrity="sha384-H4X+4tKc7b8s4GoMrylmy2ssQYpDHoqzPa9aKXbDwPoPUA3Ra8PA5dGzijN+ePnH" crossorigin="anonymous">

    <style>
        h1 {
            text-align: center;
            padding: 50px;
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
            transform: translate(-50%, -50%);
        }

        .inputA {
            border: 1px solid lightgray;
            border-radius: 5px;
            width: 400px;
            height: 40px;
            padding: 5px;
        }

        #register,
        #list {
            width: 200px;
        }

        .wrong {
            color: rgb(235, 68, 68);
        }

        .right {
            color: rgb(81, 81, 206);
        }

        .hide {
            display: none;
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

    <br><br>

    <h1>${user.userId}?????? ???????????? ??????</h1>
    <br><br>

    <form action="/users/modify" id="modify-form" method="POST">
        <fieldset class="insert">
            </div>
            <div class="form-group">
                <label for="exampleTextarea" class="form-label mt-4">NICKNAME</label>
                <input class="inputA" name="userName" id="inputNickName" type="text" placeholder="??? NICKNAME">
            </div>
            <div>
                <p id="nickNameCheck"></p>
            </div>

            <div class="form-group">
                <label for="exampleTextarea" class="form-label mt-4">PW</label>
                <input class="inputA" name="userPw" id="pw1" type="password" placeholder="??? ????????????">
            </div>
            <div class="form-group">
                <label for="exampleTextarea" class="form-label mt-4">PW Check</label>
                <input class="inputA" type="password" id="pw2" placeholder="???????????? ??????">
            </div>
            <div class="checkmsg">
                <p class="msg"></p>


                <br>
                <p>
                    <button type="button" class="btn btn-primary btn-lg" id="modify-done">??????</button>
                </p>
        </fieldset>
    </form>

    <script>
        //???????????? ?????? ??????
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


        //????????? ?????? ??????
        const $inputNick = document.getElementById('inputNickName');
        const $nickCheck = document.getElementById('nickNameCheck');

        function nickCheck() {
            fetch('http://localhost:8181/users/nick/' + $inputNick.value)
                .then(res => res.json())
                .then(result => {
                    console.log(result);
                    if (result) {
                        if ($nickCheck.classList.contains('right')) {
                            $nickCheck.classList.replace('right', 'wrong');
                        } else {
                            $nickCheck.classList.add('wrong');
                        }
                        $nickCheck.textContent = "?????? ???????????? NICKNAME?????????."
                    } else {
                        if ($nickCheck.classList.contains('wrong')) {
                            $nickCheck.classList.replace('wrong', 'right');
                        } else {
                            $nickCheck.classList.add('right');
                        }
                        $nickCheck.textContent = "?????? ????????? NICKNAME?????????.";
                    }
                });
        }

        $inputNick.onkeyup = e => {
            console.log('???????????? ??????');
            nickCheck();
        }

        // ???????????? ?????? ??????
        const $pw1 = document.getElementById('pw1');
        const $pw2 = document.getElementById('pw2');

        const $msg = document.querySelector('.msg');
        //???????????? ?????? ??????
        function passwordCheck() {
            if ($pw1.value === $pw2.value) {
                if ($msg.classList.contains('wrong')) {
                    $msg.classList.replace('wrong', 'right');
                } else {
                    $msg.classList.add('right');
                }
                $msg.textContent = "??????????????? ?????????????????????.";
            } else {
                if ($msg.classList.contains('right')) {
                    $msg.classList.replace('right', 'wrong');
                } else {
                    $msg.classList.add('wrong');
                }
                $msg.textContent = "??????????????? ????????????."
            }
        }
        $pw2.addEventListener("keyup", passwordCheck);


        document.getElementById('modify-done').onclick = e => {
            e.preventDefault();

            const $form = document.getElementById('modify-form');
            if ($msg.classList.contains('right') && $nickCheck.classList.contains('right')) {
                $form.submit();
            } else {
                alert('????????? ?????? ??????????????? ??????????????????.');
            }
        };
    </script>

</body>

</html>