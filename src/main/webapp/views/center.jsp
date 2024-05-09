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
    $(function () {
        var cityNamesEng = [
            "seoul",
            "busan",
            "daegu",
            "incheon",
            "gwangju",
            "ulsan",
            "sejong",
            "gyeonggi",
            "gangwon",
            "chungbuk",
            "chungnam",
            "jeonbuk",
            "jeonnam",
            "gyeongbuk",
            "gyeongnam",
            "jeju"
        ];

        var cityNamesKor = [
            "서울특별시",
            "부산광역시",
            "대구광역시",
            "인천광역시",
            "광주광역시",
            "울산광역시",
            "세종특별자치도",
            "경기도",
            "강원특별자치도",
            "충청북도",
            "충청남도",
            "전북특별자치도",
            "전라남도",
            "경상북도",
            "경상남도",
            "제주특별자치도"
        ];

        var swiperSlide = document.querySelector('.swiper-wrapper');
        if (!swiperSlide) {
            console.error("Swiper slide not found!");
        } else {
            var startIndex = 0;

            function loadCities(startIndex) {
                swiperSlide.innerHTML = '';
                var endIndex = Math.min(startIndex + 6, cityNamesEng.length);
                for (var i = startIndex; i < endIndex; i++) {
                    var cityNameEng = cityNamesEng[i];
                    var imgSrc = "/img/city/" + cityNameEng + "Icon.png";

                    var cityContainer = document.createElement('div');
                    cityContainer.className = 'cityContainer';

                    var img = document.createElement('img');
                    img.src = imgSrc;

                    // 클릭 이벤트 핸들러 설정
                    img.onclick = function(cityNameEng, cityNameKor) {
                        return function() {
                            window.location.href = '<c:url value="/house/region?cityName=' + cityNameKor + '"/>';
                        };
                    }(cityNameEng, cityNamesKor[i]);

                    // cityNamesKor 추가
                    var cityNameKor = cityNamesKor[i];
                    var cityNameElement = document.createElement('p');
                    cityNameElement.className = 'cityName';
                    cityNameElement.textContent = cityNameKor;

                    cityContainer.appendChild(img);

                    var cityDiv = document.createElement('div');
                    cityDiv.className = 'cityDiv';
                    cityDiv.appendChild(cityContainer);
                    cityDiv.appendChild(cityNameElement)
                    swiperSlide.appendChild(cityDiv);
                }
            }

            loadCities(startIndex);

            // Previous 버튼 클릭 시 이벤트 핸들러
            $('.swiper-button-prev').click(function() {
                if (startIndex >= 6) {
                    startIndex -= 6;
                    loadCities(startIndex);
                }
            });

            // Next 버튼 클릭 시 이벤트 핸들러
            $('.swiper-button-next').click(function() {
                if (startIndex + 6 < cityNamesEng.length) {
                    startIndex += 6;
                    loadCities(startIndex);
                }
            });
        }
    })

    $(function (){
        $('#logoutBtn').click(() => {
            let res = confirm("로그아웃 하시겠습니까?");

            if (res) {
                window.location.href = '<c:url value="/logoutimpl"/>';
            }
        })
    })
</script>
<div id="mainPageDiv">
    <section id="mainSection">
        <div id="mainDiv">
            <div id="mainSectionDiv">
                <div id="likesDiv">
                    <c:choose>
                        <c:when test="${memberDto == null}">
                            <p>로그인하여 관심 빈집을 추가하세요.</p>
                        </c:when>
                        <c:otherwise>
                            <p>관심 빈집을 추가하세요.</p>
                        </c:otherwise>
                    </c:choose>
                </div>
                <div id="myInfoDiv">
                    <c:choose>
                        <c:when test="${memberDto == null}">
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
                                    <span id="memberName">${memberDto.memberName}</span><span>&nbsp;님</span>
                                </div>
                                <div class="myInfoClass">
                                    <c:choose>
                                        <c:when test="${memberDto.memberConfirm == true}">
                                            <img src="<c:url value="/img/qualify.png"/>"/><span>자격 조회 여부</span><span class="infoContent">O</span>
                                        </c:when>
                                        <c:otherwise>
                                            <img src="<c:url value="/img/qualify.png"/>"/><span>자격 조회 여부</span><span class="infoContent">X</span>
                                        </c:otherwise>
                                    </c:choose>
                                </div>
                                <div class="myInfoClass">
                                    <img src="<c:url value="/img/like.png"/>"/><span>찜 개수</span><span class="infoContent">0 개</span>
                                </div>
                                <div class="myInfoClass">
                                    <a href="reserve/view">
                                        <img src="<c:url value="/img/reserve.png"/>"/><span>예약 현황</span>
                                    </a>
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
                <div class="swiper-wrapper"></div>
            </div>
        </div>
    </section>
    <img src="<c:url value="/img/prevBtn.png"/>" class="swiper-button-prev">
    <img src="<c:url value="/img/nextBtn.png"/>" class="swiper-button-next">
</div>