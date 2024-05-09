<%--
  Created by IntelliJ IDEA.
  User: rabbikim
  Date: 5/2/24
  Time: 12:02 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
    .bodyDiv {
        height: calc(100% - 175px);
        max-height: 100vh;
        padding: 50px 15%;
    }

    .container {
        height: 100%;
        padding: 0 5%;
        border-radius: 60px;
        background: #FFFFFF;
        box-shadow: 0px 4px 70px rgba(0, 0, 0, 0.1);
        display: flex;
        flex-direction: column;
        align-items: center;
    }

    #loginDiv {
        display: flex;
        width: 100%;
        height: 100%;
    }

    #loginInputDiv {
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
        width: 55%;
        height: calc(100% - 50px);
        padding: 0 5%;
    }

    .loginInput {
        padding: 5% 5%;
        width: 100%;
    }

    #loginInputDiv input {
        padding: 3%;
        margin-top: 1%;
        border: 1px solid #C6C4C4;
        border-radius: 10px;
        width: 90%;
        height: 50px;
    }

    #loginFindDiv {
        width: 100%;
        margin-bottom: 10%;
        padding: 0 5%;
    }

    #loginFindDiv div {
        padding: 0;
    }

    #loginFindDiv a {
        color: #797979;
        text-decoration: none;
    }

    #signInBtn {
        color: #4562FF;
        text-decoration: none;
    }

    #hrWrap {
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: center;
        height: 90%;
    }

    .bar {
        flex: auto;
    }

    #hrWrap span {
        padding: 0 10px;
        width: 30px;
    }

    #kakaoDiv {
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
        width: 50%;
        height: calc(100% - 50px);
    }

    #kakaoLoginBtn {
        width: 300px;
        height: 45px;
        padding-left: 5%;
        cursor: pointer;
    }
</style>

<script>
    $(function () {
        let loginUser = () => {
            let id = $('#id').val();
            let pw = $('#pw').val();

            if (!id) {
                alert('아이디를 입력해주세요');
                return;
            }

            if (!pw) {
                alert('비밀번호를 입력해주세요');
                return;
            }

            $.ajax({
                url: '<c:url value="/loginimpl"/>',
                data: {
                    'memberId': id,
                    'memberPw': pw
                },
                success(response) {
                    if (response == "idFail") {
                        alert("아이디가 틀렸습니다!");
                    } else if (response == "pwFail") {
                        alert("비밀번호가 틀렸습니다!");
                    } else if (response == "success") {
                        alert("로그인 되셨습니다!");
                        window.location.href = '<c:url value="/"/>'
                    }
                }
            })
        }

        // 엔터 키가 눌렸을 때 로그인 함수 호출
        $('#id, #pw').keydown(function(event) {
            if (event.keyCode === 13) {
                loginUser();
            }
        });

        // 로그인 버튼을 클릭했을 때 로그인 함수 호출
        $('#loginBtn').click(loginUser);

        $('#kakaoLoginBtn').click(() => {
            window.location.href = 'https://kauth.kakao.com/oauth/authorize?response_type=code&prompt=login&client_id=' +
                "${kakaoRestApiKey}" +
                '&redirect_uri=' +
                'http://localhost:80/';
        });
    })
</script>

<div class="bodyDiv">
    <div class="container">
        <h1>로그인</h1>
        <div id="loginDiv">
            <div id="loginInputDiv">
                <div class="loginInput">
                    <label for="id">아이디</label><br/>
                    <input id="id" placeholder="아이디를 입력하세요">
                </div>
                <div class="loginInput">
                    <label for="pw">비밀번호</label><br/>
                    <input id="pw" type="password" placeholder="비밀번호를 입력하세요">
                </div>
                <div id="loginFindDiv">
                    <div>
                        <a href="<c:url value="/findid"/>" id="findIdBtn">아이디 찾기</a>
                        <a href="<c:url value="/findpw"/>" id="findPwdBtn">비밀번호 찾기</a>
                    </div>
                </div>
                <div class="loginBtnDiv">
                    <button id="loginBtn" class="loginBtn">로그인</button>
                </div>
                <p>아직 계정이 없으신가요? <a id="signInBtn" href="<c:url value="signin"/>">가입하기</a></p>
            </div>
            <div id="hrWrap">
                <hr class="bar">
                <span>또는</span>
                <hr class="bar">
            </div>
            <div id="kakaoDiv">
                <img id="kakaoLoginBtn" src="<c:url value="/img/kakao.png"/>"/>
            </div>
        </div>
    </div>
</div>