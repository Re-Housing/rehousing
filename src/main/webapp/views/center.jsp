<%--
  Created by IntelliJ IDEA.
  User: rabbikim
  Date: 4/30/24
  Time: 2:00 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script>
    // var swiper = new Swiper('.swiper-container', {
    //     pagination: {
    //         el: '.swiper-pagination',
    //         clickable: true,
    //     },
    //     navigation: {
    //         nextEl: '.swiper-button-next',
    //         prevEl: '.swiper-button-prev',
    //     },
    // });

    $(function (){
        $('#logoutBtn').click(() => {
            let res = confirm("로그아웃 하시겠습니까?");

            if (res) {
                window.location.href = '<c:url value="/logout"/>'
            }
        })
    })
</script>
<div id="mainPageDiv">
    <section id="mainSection">
        <div id="mainDiv">
            <div id="mainSectionDiv">
                <div id="likesDiv">
                    <p>로그인하여 관심 빈집을 추가하세요.</p>
                </div>
                <div id="myInfoDiv">
                    <c:choose>
                        <c:when test="${memberId == null}">
                            <div id="infoDiv">
                                <img id="infoLogo" src="<c:url value="/img/logo.png"/>"/>
                                <p class="aboutDiv">
                                    지금 빈집 정보를 확인하여<br/>
                                    이용해보세요.
                                </p>
                                <div class="loginBtnDiv">
                                    <button class="loginBtn" onclick="window.location.href='<c:url value="/login"/>'">로그인</button>
                                </div>
                                <div id="memberIdDiv">
                                    <div>
                                        <div>
                                            <a href="<c:url value="/findid"/>" id="findIdBtn">아이디 찾기</a>
                                            <a href="<c:url value="/findpw"/>" id="findPwdBtn">비밀번호 찾기</a>
                                        </div>
                                    </div>
                                    <a href="<c:url value="/signin"/>">회원가입</a>
                                </div>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <div id="info">
                                <div id="memberDiv">
                                    <span id="memberName">${memberName}</span><span>&nbsp;님</span>
                                </div>
                                <div class="myInfoClass">
                                    <img src="<c:url value="/img/qualify.png"/>"/><span>자격 조회 여부</span><span class="infoContent">X</span>
                                </div>
                                <div class="myInfoClass">
                                    <img src="<c:url value="/img/likes.png"/>"/><span>찜 개수</span><span class="infoContent">0 개</span>
                                </div>
                                <div class="myInfoClass">
                                    <img src="<c:url value="/img/reserve.png"/>"/><span>예약 현황</span>
                                </div>
                                <div class="loginBtnDiv">
                                    <button id="logoutBtn" class="loginBtn">로그아웃</button>
                                </div>
                            </div>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
            <h2>지역별 빈집 찾기</h2>
        </div>
    </section>
    <section id="citySection">
        <div id="cityDiv">
            <div class="swiper-container" id="swiperContainer">
                <div class="swiper-wrapper">
                    <div class="swiper-slide swiperWrapper">
                        <div class="cityContainer">
                            <img src="/img/city/seoulIcon.png"/>
                        </div>
                        <div class="cityContainer">
                            <img src="/img/city/busanIcon.png"/>
                        </div>
                        <div class="cityContainer">
                            <img src="/img/city/daeguIcon.png"/>
                        </div>
                        <div class="cityContainer">
                            <img src="/img/city/incheonIcon.png"/>
                        </div>
                        <div class="cityContainer">
                            <img src="/img/city/gwangjuIcon.png"/>
                        </div>
                        <div class="cityContainer">
                            <img src="/img/city/ulsanIcon.png"/>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <img src="<c:url value="/img/prevBtn.png"/>" class="swiper-button-prev">
    <img src="<c:url value="/img/nextBtn.png"/>" class="swiper-button-next">
</div>