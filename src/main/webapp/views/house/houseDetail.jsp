<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style>
    .bodyDiv {
        height: calc(100% - 175px);
        max-height: 100vh;
        padding: 50px 15%;
        /*background: #F4F4F4;*/
    }

    .container {
        position: relative;
        height: 100%;
        padding: 0 5%;
        border-radius: 60px;
        background: #FFFFFF;
        box-shadow: 0px 4px 70px rgba(0, 0, 0, 0.1);
        display: flex;
        flex-direction: column;
        align-items: center;
    }

    #reservebox {
        display: flex;
        width: 100%;
        height: 100%;
    }



    #loginInputDiv input {
        padding: 3%;
        margin-top: 1%;
        border: 1px solid #C6C4C4;
        border-radius: 10px;
        width: 90%;
        height: 50px;
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

    #houseListContainer {
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
        width: 50%;
        height: calc(100% - 50px);
    }

    #mapContainer {
        width: 50%;
        height: 100%;
        padding: 10px;
    }

    #map {
        width: 100%;
        height: 80%;
    }
    .reserve-btn {
        position: relative;
        margin-top: 20px;
        padding: 10px 20px;
        font-size: 16px;
        color: white;
        background-color: #000000;
        box-shadow: 0px 4px 70px rgba(0, 0, 0, 0.1);
        border: none;
        border-radius: 10px;
        cursor: pointer;
        transition: background-color 0.3s;
    }

    .reserve-btn:hover {
        background-color: #F6C324;
    }
    .house-image {
        max-width: 90%;
        max-height: 300px;
        object-fit: cover; /* 비율을 유지하면서 이미지 크기 조절 */
        margin-top: 15px;
        border-radius: 10px;
        box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
    }
    .heart-icon {
        position: absolute;
        top: 10px; /* 부모 요소의 위에서부터 10px 아래에 */
        right: 40px; /* 부모 요소의 오른쪽에서부터 10px 왼쪽에 */
        width: 30px; /* 고정된 크기 */
        height: 30px;
        z-index: 10; /* 이미지 위로 올리기 위해 */
    }
    .heart-icon:hover {
        transform: scale(1.2); /* 확대 효과 */
    }

</style>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=${kakaomapkey}"></script>
<script>
    let housedetail = {
        map: null,

        init: function() {
            this.mapdisplay();
            //this.displayHouseDetail();

            // 주혜 : 예약화면으로 이동 (로그인 확인, 지원자격여부 확인)
            $('#reserve-btn').click(()=>{
                let memberId = "${memberDto.memberId}";
                let memberQualify = "${memberDto.memberConfirm}";
                if(!memberId){
                    alert('로그인 해주세요');
                    window.location.href='<c:url value="/login"/>';
                    return;
                }
                if(memberQualify=='false'){
                    alert('지원자격 조회를 완료해주세요');
                    window.location.href='<c:url value="/qualify"/>';
                    return;
                }
                window.location.href='<c:url value="/reserve/"/>'+${house.houseIdx};
            })
        },

        mapdisplay: function() {
            // 받아온 집의 longitude와 latitude로 지도 중심 설정
            <%--var longitude = parseFloat('<c:out value="${house.longitude}"/>');--%>
            <%--var latitude = parseFloat('<c:out value="${house.latitude}"/>');--%>
            // console.log(house);
            var centerPosition = new kakao.maps.LatLng(${house.longitude}, ${house.latitude});

            var mapContainer = document.getElementById('map'),
                mapOption = {
                    center: centerPosition, // 지도 중심을 받아온 집의 위치로 설정
                    level: 9
                };

            this.map = new kakao.maps.Map(mapContainer, mapOption);

            // 마커 설정
            var marker = new kakao.maps.Marker({
                position: centerPosition
            });
            marker.setMap(this.map);
        },
    };

            $(function() {
                housedetail.init();
            });

</script>

<div class="bodyDiv">
    <div class="container">
        <h2>상세 정보</h2>
        <img class="heart-icon" src="<c:url value="/img/likes.png"/>"/>
        <div id="reservebox">
            <div id="mapContainer">
                <div id="map"></div>
                <p><c:out value="${house.address}"/></p>
            </div>
            <div id="hrWrap">
                <hr class="bar">

            </div>
            <div id="houseListContainer">
                <p>용도: <c:out value="${house.housetype}"/></p>
                <p>7일에 <fmt:formatNumber type="number" pattern="###,###원" value="${house.price}"/></p>


                <img src='<c:out value="${house.url}"/>' alt='빈집 이미지' class="house-image">
                <button type="button" id="reserve-btn" class="btn btn-primary reserve-btn">예약하기</button>
            </div>
        </div>
    </div>
</div>