<%--
  Created by IntelliJ IDEA.
  User: rabbikim
  Date: 4/30/24
  Time: 11:23 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css" />

<html>
    <head>
        <title>ReHousing</title>
    </head>
    <style>
        body {
            margin: 0;
        }

        /*Header CSS*/

        header {
            height: 25px;
            padding: 25px 15%;
            font-size: 20px;
            display: flex;
            align-items: center;
            background: #FFFFFF;
        }

        .header-link {
            text-decoration: none;
            color: #C6C4C4;
            transition: color 0.3s; /* 색상 전환 애니메이션 설정 */
            margin: 0 40px;
            font-weight: bold;
        }

        .header-link:hover {
            color: black;
        }

        #header-links {
            margin-left: auto;
            display: flex;
            justify-content: center;
            align-items: center;
            flex-grow: 1;
        }

        #logo {
            margin-right: auto;
            height: 50px;
        }

        /*Main Page CSS*/

        #mainPageDiv {
            display: flex;
            flex-direction: column;
            height: calc(100% - 75px);
        }

        #mainSection {
            height: 64%;
        }

        #mainDiv {
            background: #FFFFFF;
            height: 100%;
            margin: 0 15%;
        }

        #mainSectionDiv {
            display: flex;
            height: 90%;
        }

        #likesDiv {
            width: 60%;
            height: 93%;
            margin-right: 30px;
            border-radius: 60px;
            background: #FFFFFF;
            display: flex;
            justify-content: center;
            align-items: center;
            box-shadow: 0px 4px 70px rgba(0, 0, 0, 0.1);
        }

        #myInfoDiv {
            width: 40%;
            height: 93%;
            margin-left: 30px;
            border-radius: 60px;
            background: #FFFFFF;
            box-shadow: 0px 4px 70px rgba(0, 0, 0, 0.1);
        }

        /*로그인 하지 않았을 때 CSS*/

        #infoDiv {
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            align-items: center;
            padding: 10%;
            height: 80%;
        }

        #infoLogo {
            height: 70px;
        }

        .aboutDiv {
            text-align: center;
            font-weight: bold;
            font-size: 1.2rem;
        }

        #memberIdDiv {
            display: flex;
            justify-content: space-between;
            width: 100%;
        }

        #memberIdDiv a{
            text-decoration: none;
            color: #797979;
        }

        #findIdBtn {
            padding-right: 5px;
            border-right: 1.5px solid #797979;
        }

        #findPwdBtn {
            padding-left: 3px;
        }

        /*로그인 되었을 때 CSS*/

        #info {
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            font-size: 1.5rem;
            padding: 10%;
            height: 80%;
        }

        #memberName {
            font-weight: bold;
        }

        .myInfoClass {
            display: flex;
            flex-direction: row;
            align-items: center;
            font-weight: bold;
            padding: 5% 0;
        }

        .myInfoClass img {
            width: 40px;
            height: 40px;
            padding-right: 15px;
        }

        .infoContent {
            margin-left: auto;
            padding-right: 10%;
        }

        .loginBtnDiv {
            display: flex;
            height: 15%;
            width: 100%;
            justify-content: center;
            margin-top: 3%;
        }

        .loginBtn {
            position: relative;
            width: 100%;
            font-weight: bold;
            font-size: 1.2rem;
            color: #FFFFFF;
            background: #142231;
            border-radius: 10px;
            border: 0;
            cursor: pointer;
        }

        #mainDiv > h2 {
            margin: 0;
        }

        #citySection {
            background: #F4F4F4;
            flex: 1;
            padding: 3% 0;
        }

        #cityDiv {
            padding: 0 15%;
        }

        .swiperWrapper {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .cityContainer {
            display: flex;
            justify-content: center;
            align-items: center;
            width: calc(100% / 7);
            height: 80%;
            margin-left: 30px;
            border-radius: 20px;
            background: #FFFFFF;
            box-shadow: 0px 4px 70px rgba(0, 0, 0, 0.1);
            border: 1px solid transparent;
            cursor: pointer;
        }

        .cityContainer:hover {
            display: flex;
            justify-content: center;
            align-items: center;
            width: calc(100% / 7);
            height: 80%;
            margin-left: 30px;
            border-radius: 20px;
            background: #FFFFFF;
            box-shadow: 0px 4px 70px rgba(0, 0, 0, 0.1);
            border: 1px solid cornflowerblue;
            cursor: pointer;
        }

        .swiper-button-prev,
        .swiper-button-next {
            position: absolute;
            top: 87%;
            transform: translateY(-50%);
            z-index: 1;
        }

        .swiper-button-prev {
            left: 10%;
        }

        .swiper-button-next {
            right: 10%;
        }

        .cityContainer > img {
            height: 80px;
        }

        #rightSectionLogo {
            height: 80px;
            margin-bottom: 10%;
        }
    </style>
    <script>
        function checkLogin() {
            var memberId = "${memberId}";

            if (memberId) {
                window.location.href = "<c:url value="/qualify"/>";
            } else {
                alert("로그인이 필요합니다.");
                window.location.href = "<c:url value="/login"/>";
            }
        }
    </script>
    <body>
        <header>
            <a href="<c:url value="/"/>"><img id="logo" src="<c:url value="/img/logo.png"/>"/></a>
            <div id="header-links">
                <a href="#" class="header-link">전체 조회</a>
                <a href="#" class="header-link" onclick="checkLogin()">지원자격 확인</a>
                <a href="#" class="header-link">사업 소개</a>
            </div>
        </header>
        <c:choose>
            <c:when test="${center == null}">
                <jsp:include page="center.jsp"/>
            </c:when>
            <c:otherwise>
                <jsp:include page="${center}.jsp"/>
            </c:otherwise>
        </c:choose>
    </body>
</html>
