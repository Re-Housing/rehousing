<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script>
    let houseList = {
        init: function () {
        }
    };
    $(function () {
        houseList.init();
    });
</script>
<html>
<head>
    <title>빈 집 목록</title>

    <style>
        .totalbox {
            height: calc(100% - 175px);
            max-height: 100vh;
            padding: 50px 15%;
        }

        .container {
            height: 100%;
            width: 100%;
            border-radius: 60px;
            background: #FFFFFF;
            box-shadow: 0px 4px 70px rgba(0, 0, 0, 0.1);
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        .title {
            margin-top: 20px;
        }

        #reservebox {
            width: 100%;
            height: 100%;
            left: 10%;
            top: 89px;
            background: #FFFFFF;
            box-shadow: 0px 4px 70px rgba(0, 0, 0, 0.1);
            border-radius: 60px;
            overflow-y: auto;
        }

        .titletext {
            width: 314px;
            font-family: 'Inter';
            font-style: normal;
            font-weight: 600;
            font-size: 4vw;
            line-height: 73px;
            color: #142231;
        }

        #btn_modify {
            float: right;
            background-color: snow;
            border-width: 0 0 1px;
        }

        .grid-container {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
            grid-gap: 20px;
            padding: 20px;
        }

        .grid-item {
            position: relative; /* 부모 요소를 상대 위치로 */
            border: 1px solid #ccc;
            box-shadow: 0px 0px 10px #ccc;
            padding: 10px;
        }

        img {
            width: 100%;
            height: 200px; /* Fixed height for all images */
            object-fit: cover; /* Ensures that images are scaled correctly */
        }

        .heart-icon {
            position: absolute;
            top: 15px; /* 부모 요소의 위에서부터 10px 아래에 */
            right: 15px; /* 부모 요소의 오른쪽에서부터 10px 왼쪽에 */
            width: 30px; /* 고정된 크기 */
            height: 30px;
            z-index: 10; /* 이미지 위로 올리기 위해 */
        }

        .heart-icon:hover {
            transform: scale(1.2); /* 확대 효과 */
        }

        .liked {
            content: url('<c:url value="/img/liked.png"/>'); /* 찜 상태 아이콘 */
        }

        .not-liked {
            content: url('<c:url value="/img/likes.png"/>'); /* 기본 상태 아이콘 */
        }

        ::-webkit-scrollbar {
            display: none; /* Chrome, Safari, Edge 등의 브라우저에서 사용하는 스크롤바를 숨깁니다. */
        }
    </style>
    <script>
        let houseList = {
            toggleLike: function (heartIcon) {
                // 찜 상태 토글
                heartIcon.classList.toggle('liked');
                heartIcon.classList.toggle('not-liked');
            },
            init: function () {
            }
        };
        $(function () {
            houseList.init();
        });
    </script>
</head>

<body>
    <div class="totalbox">
        <div class="container">
            <div id="reservebox">
                <h1 style="text-align: center;">빈 집</h1>
                <div class="grid-container">
                        <c:forEach var="house" items="${houses}">
                            <div class='grid-item' onclick="location.href='/house/getHouseDetail?houseIdx=${house.houseIdx}'">
                                <img class="heart-icon" src="<c:url value="/img/likes.png"/>" onclick="houseList.toggleLike(this);" alt="좋아요 아이콘"/>
                                <img src='${house.url}' alt='사진 없음'>
                                <p>${house.housetype}</p>
                                <p><fmt:formatNumber type="number" pattern="###,###원" value="${house.price}"/></p>
                                <p>${house.address}</p>
                            </div>
                        </c:forEach>
                    </div>
            </div>
        </div>
    </div>
</body>
</html>
