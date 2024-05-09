

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

    /*.houseListContainer {*/
    /*    width: 0%; */
    /*    display: none;*/
    /*    overflow-y: auto;*/
    /*}*/

    .titletext {
        font-family: 'Inter', sans-serif;
        font-size: 24px;
        color: #142231;
        text-align: center;
        margin-bottom: 20px;
    }



</style>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=${kakaomapkey}&libraries=services"></script>
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
                    }
                    else {
                        if(cityName=="서울특별시") {
                            var moveLatLon = new kakao.maps.LatLng(37.5665, 126.9780);
                            this.map.setCenter(moveLatLon);
                        }
                        else if(cityName=="부산광역시") {
                            var moveLatLon = new kakao.maps.LatLng(35.1796, 129.0756);
                            this.map.setCenter(moveLatLon);
                        }
                        else if(cityName=="대구광역시") {
                            var moveLatLon = new kakao.maps.LatLng(35.8714, 128.6014);
                            this.map.setCenter(moveLatLon);
                        }
                        else if(cityName=="인천광역시") {
                            var moveLatLon = new kakao.maps.LatLng(37.4563, 126.7052);
                            this.map.setCenter(moveLatLon);
                        }
                        else if(cityName=="광주광역시") {
                            var moveLatLon = new kakao.maps.LatLng(35.1595, 126.8526);
                            this.map.setCenter(moveLatLon);
                        }
                        else if(cityName=="울산광역시") {
                            var moveLatLon = new kakao.maps.LatLng(35.5384, 129.3114);
                            this.map.setCenter(moveLatLon);
                        }
                        else if(cityName=="세종특별자치도") {
                            var moveLatLon = new kakao.maps.LatLng(36.4803, 127.2891);
                            this.map.setCenter(moveLatLon);
                        }
                        else if(cityName=="경기도") {
                            var moveLatLon = new kakao.maps.LatLng(37.2636, 127.0286);
                            this.map.setCenter(moveLatLon);
                        }
                        else if(cityName=="강원특별자치도") {
                            var moveLatLon = new kakao.maps.LatLng(37.8813, 127.7298);
                            this.map.setCenter(moveLatLon);
                        }
                        else if(cityName=="충청북도") {
                            var moveLatLon = new kakao.maps.LatLng(36.6439, 127.4880);
                            this.map.setCenter(moveLatLon);
                        }
                        else if(cityName=="충청남도") {
                            var moveLatLon = new kakao.maps.LatLng(36.8152, 127.1139);
                            this.map.setCenter(moveLatLon);
                        }
                        else if(cityName=="전북특별자치도") {
                            var moveLatLon = new kakao.maps.LatLng(35.8242, 127.1470);
                            this.map.setCenter(moveLatLon);
                        }
                        else if(cityName=="전라남도") {
                            var moveLatLon = new kakao.maps.LatLng(34.8135, 126.4631);
                            this.map.setCenter(moveLatLon);
                        }
                        else if(cityName=="경상북도") {
                            var moveLatLon = new kakao.maps.LatLng(36.5684, 128.7297);
                            this.map.setCenter(moveLatLon);
                        }
                        else if(cityName=="경상남도") {
                            var moveLatLon = new kakao.maps.LatLng(35.2270, 128.6811);
                            this.map.setCenter(moveLatLon);
                        }
                        else if(cityName=="제주특별자치도") {
                            var moveLatLon = new kakao.maps.LatLng(33.4996, 126.5312);
                            this.map.setCenter(moveLatLon);
                        }
                        setTimeout(function() {
                            alert("빈집 정보 없음");
                        }, 500);
                    }

                },

                error: function(error) {
                    console.log('Error fetching data:', error);
                }
            });
        },

        <%--moveToCityCenter: function(cityName) {--%>
        <%--    if (!this.geocoder) {--%>
        <%--        console.error('Geocoder is not initialized!');--%>
        <%--        return;--%>
        <%--    }--%>
        <%--    this.geocoder.addressSearch(cityName, (result, status) => {--%>
        <%--        if (status === kakao.maps.services.Status.OK) {--%>
        <%--            var centerPosition = new kakao.maps.LatLng(result[0].y, result[0].x);--%>
        <%--            this.map.setCenter(centerPosition);--%>
        <%--        } else {--%>
        <%--            console.log(`Unable to find coordinates for city: ${cityName}`);--%>
        <%--        }--%>
        <%--    });--%>
        <%--},--%>
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
<%--        <div class="houseListContainer">--%>
<%--            <!-- 빈집 리스트 출력 위치 -->--%>
<%--        </div>--%>
    </div>
</div>
