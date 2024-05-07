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

    #signInForm {
        width: 100%;
    }

    .loginInput {
        padding: 2% 5%;
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

    #loginInputDiv #id {
        width: 70%;
    }

    #idValidBtn {
        width: 25%;
        padding: 14.5px 0;
        margin-left: 10px;
        font-weight: bold;
        font-size: 1.2rem;
        color: #FFFFFF;
        background: #142231;
        border-radius: 10px;
        border: 0;
        cursor: pointer;
    }

    #idValidityMessage {
        margin-top: 1px;
        height: 20px;
        line-height: 20px;
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
    }

    #kakao {
        width: 300px;
        height: 45px;
    }
</style>
<script>
    let signin = {
        init: function () {
            $('#signInBtn').click(() => {
                let memberName = $('#name').val();
                let memberEmail = $('#email').val();
                let memberId = $('#id').val();
                let memberPw = $('#pwd').val();

                if (!memberName) {
                    alert("이름 또는 닉네임을 입력해주세요");
                    return;
                }

                if (!memberEmail) {
                    alert("이메일을 입력해주세요");
                    return;
                }

                if (!memberId) {
                    alert("아이디를 입력해주세요");
                    return;
                }

                if (!memberPw) {
                    alert("비밀번호를 입력해주세요");
                    return;
                }
                this.send();
            })

            $('#idValidBtn').click(() => {
                let memberId = $('#id').val();

                if (memberId == null || memberId == '') {
                    alert("아이디를 입력해주세요.");
                    return;
                }

                $.ajax({
                    url: '<c:url value="/checkidvalid"/>',
                    data: {
                        'memberId': memberId
                    },
                    success: function (response) {
                        if (response == "success") {
                            // 중복되지 않은 아이디일 경우
                            $('#id').css('border-color', 'green');
                            $('#idValidityMessage').text('사용 가능한 아이디입니다.').css('color', 'green');
                            $('#signInBtn').prop('disabled', false); // 회원가입 버튼 활성화
                        } else if (response == "fail") {
                            // 중복된 아이디일 경우
                            $('#id').css('border-color', 'red');
                            $('#idValidityMessage').text('중복되는 아이디입니다.').css('color', 'red');
                            $('#signInBtn').prop('disabled', true); // 회원가입 버튼 비활성화
                        }
                    }
                })
            })
        },
        send: function () {
            alert("환영합니다!");
            $('#signInForm').attr({
                'method': 'post',
                'action': '<c:url value="/signinimpl"/>'
            })
            $('#signInForm').submit();
        }
    }

    $(function () {
        signin.init();
    })
</script>

<div class="bodyDiv">
    <div class="container">
        <h1>회원가입</h1>
        <div id="loginDiv">
            <div id="loginInputDiv">
                <form id="signInForm">
                    <div class="loginInput">
                        <label for="name">이름 또는 닉네임</label><br/>
                        <input id="name" name="memberName" placeholder="이름을 입력하세요">
                    </div>
                    <div class="loginInput">
                        <label for="email">이메일</label><br/>
                        <input id="email" name="memberEmail" placeholder="이메일을 입력하세요">
                    </div>
                    <div class="loginInput">
                        <label for="id">아이디</label><br/>
                        <input id="id" name="memberId" placeholder="아이디를 입력하세요">
                        <button type="button" id="idValidBtn">중복 체크</button>
                        <div id="idValidityMessage"></div>
                    </div>
                    <div class="loginInput">
                        <label for="pwd">비밀번호</label><br/>
                        <input id="pwd" name="memberPw" placeholder="비밀번호를 입력하세요">
                    </div>
                    <div class="loginBtnDiv">
                        <button type="button" id="signInBtn" class="loginBtn">회원가입</button>
                    </div>
                </form>
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