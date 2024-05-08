

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
    .container {
        width: 80%;
        margin: 0 auto; /* 중앙 정렬 */
        position: relative;
        top: 50px; /* 페이지 상단으로부터의 거리 */
    }

    .reservebox {
        display: flex;
        width: 100%;
        box-sizing: border-box;
        background: #FFFFFF;
        box-shadow: 0px 4px 70px rgba(0, 0, 0, 0.1);
        border-radius: 10px;
        overflow: visible; /* 잘림 방지 */
    }

    .mapContainer, .houseListContainer {
        padding: 20px;
        position: relative;
    }

    .mapContainer {
        width: 100%; /* 초기에는 전체 지도 모드 */
        transition: all 0.3s ease; /* 부드럽게 크기 조정 */
    }

    #map {
        width: 100%;
        height: 80vh;
        border: 1px solid gray;
    }

    .houseListContainer {
        width: 0%; /* 초기에는 표시되지 않음 */
        display: none;
        overflow-y: auto; /* 내용이 많을 경우 스크롤 */
    }

    .titletext {
        font-family: 'Inter', sans-serif;
        font-size: 24px;
        color: #142231;
        text-align: center;
        margin-bottom: 20px; /* 제목과 내용 사이의 여백 */
    }

    .search-container {
        display: flex;
        justify-content: center; /* 중앙 정렬 */
        margin-bottom: 15px; /* 아래 요소와의 간격 */
    }

    .search-container table {
        border-spacing: 0;
        border-collapse: collapse;
    }

    .search-container select, .search-container input[type="text"] {
        margin-right: 5px;
        padding: 5px 10px;
        border-radius: 5px;
        border: 1px solid gray;
    }

    .search-container input[type="image"] {
        padding: 5px;
    }

    .reserve-btn {
        position: absolute; /* 절대 위치 */
        left: 50%; /* 중앙으로 위치 */
        bottom: 20px; /* 아래에서 20px 떨어진 곳에 위치 */
        transform: translateX(-50%); /* 정확히 중앙에 위치시킴 */
        padding: 10px 20px; /* 내부 여백 */
        font-size: 16px; /* 글씨 크기 */
        color: white; /* 글씨 색상 */
        background-color: #000000;
        box-shadow: 0px 4px 70px rgba(0, 0, 0, 0.1); /* 배경 색상 */
        border: none; /* 테두리 없음 */
        border-radius: 60px; /* 모서리 둥글게 */
        cursor: pointer; /* 마우스 오버 시 커서 변경 */
        transition: background-color 0.3s; /* 배경 색상 변화 애니메이션 */
    }

    .reserve-btn:hover {
        background-color: #F6C324; /* 마우스 오버 시 배경 색상 */
    }

</style>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=${kakaomapkey}"></script>
<script>
    let houseregion = {
        map: null,

        init: function() {
            this.mapdisplay();
            this.loadMapByQuery();
        },

        mapdisplay: function() {
            var mapContainer = document.getElementById('map'),
                mapOption = {
                    center: new kakao.maps.LatLng(37.5447611, 127.0564625),
                    level: 8
                };
            this.map = new kakao.maps.Map(mapContainer, mapOption);
        },

        getHousesByCity: function(cityName) {
            $.ajax({
                url: '<c:url value="/house/getHousesByCity"/>',
                data: { cityName: cityName },
                success: (houses) => {
                    if (houses.length > 0) {
                        var firstHouse = houses[1];
                        var moveLatLon = new kakao.maps.LatLng(firstHouse.longitude, firstHouse.latitude);
                        this.map.setCenter(moveLatLon);
                    }

                    houses.forEach((house) => {
                        var markerPosition = new kakao.maps.LatLng(house.longitude, house.latitude);
                        var marker = new kakao.maps.Marker({
                            position: markerPosition
                        });
                        marker.setMap(this.map);
                        kakao.maps.event.addListener(marker, 'click', () => {
                            window.location.href = `<c:url value='/house/getHouseDetail?houseIdx='/>`+house.houseIdx;
                        });
                    });
                },
                error: function(error) {
                    console.log('Error fetching data:', error);
                }
            });
        },

        loadMapByQuery: function() {
            var cityName = '<c:out value="${cityName}"/>';
            if (cityName) {
                this.getHousesByCity(cityName);
            }
        }
    };

    $(function() {
        houseregion.init();
    });
</script>

<div class="container">
    <h2 class="titletext">지역별 조회</h2>
    <div class="reservebox">
        <div class="mapContainer">
            <div id="map"></div>
        </div>
        <div class="houseListContainer">
            <!-- 빈집 리스트 출력 위치 -->
        </div>
    </div>
</div>
