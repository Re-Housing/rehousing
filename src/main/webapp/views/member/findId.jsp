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
        /*background: #F4F4F4;*/
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

    #findIdForm {
        width: 100%;
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
        padding-left: 5%;
    }

    #kakao {
        width: 300px;
        height: 45px;
    }
</style>

<script>
    $(function () {
        $('#findIdBtn').click(() => {
            let memberName = $('#name').val();
            let memberEmail = $('#email').val();

            $.ajax({
                url: '<c:url value="/findidimpl"/>',
                data: {
                    'memberName': memberName,
                    'memberEmail': memberEmail
                },
                success(response) {
                    if (response == "fail") {
                        alert("일치하는 정보의 아이디가 없습니다.");
                    } else if (response == "success") {
                        alert("회원가입 시 등록하신 이메일 주소로 아이디를 발송하였습니다.");
                        wi
                    }
                }
            })
        })
    })
</script>

<div class="bodyDiv">
    <div class="container">
        <h1>아이디 찾기</h1>
        <div id="loginDiv">
            <div id="loginInputDiv">
                <div class="loginInput">
                    <label for="name">이름 또는 닉네임</label><br/>
                    <input id="name" placeholder="이름을 입력하세요">
                </div>
                <div class="loginInput">
                    <label for="email">이메일</label><br/>
                    <input id="email" placeholder="이메일을 입력하세요">
                </div>
                <div class="loginBtnDiv">
                    <button id="findIdBtn" class="loginBtn">확인</button>
                </div>
            </div>
            <div id="hrWrap">
                <hr class="bar">
            </div>
            <div id="kakaoDiv">
                <img id="rightSectionLogo" src="<c:url value="/img/logo.png"/>"/>
                <p class="aboutDiv">
                    지금 빈집 정보를 확인하여<br/>
                    이용해보세요.
                </p>
            </div>
        </div>
    </div>
</div>