<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        .title {
            /*margin-left: 100px;*/
            margin-top: 20px;
        }

        #reservebox {
            box-sizing: border-box;
            position: absolute;
            width: 80%;
            height: 80%;
            left: 10%;
            top: 89px;
            background: #FFFFFF;
            box-shadow: 0px 4px 70px rgba(0, 0, 0, 0.1);
            border-radius: 60px;
            overflow-y: auto;
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

        /*#reservebox {*/
        /*    display: flex;*/
        /*    width: 100%;*/
        /*    height: 100%;*/
        /*}*/

        .totalbox {
            display: flex;
            justify-content: center;
            /*padding: 20px;*/
            /*padding-left: 30px;*/
            /*padding-right: 30px;*/
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
            border: 1px solid #ccc;
            box-shadow: 0px 0px 10px #ccc;
            padding: 10px;
        }

        img {
            width: 100%;
            height: 200px; /* Fixed height for all images */
            object-fit: cover; /* Ensures that images are scaled correctly */
        }
    </style>
</head>

<body>

<div class="totalbox">
    <div class="container">


        <div id="reservebox">
            <h2 style="text-align: center;">빈 집</h2>
            <div class="grid-container">
    <%--            <h1 class="title titletext">빈 집 조회</h1>--%>
                    <c:forEach var="house" items="${houses}">
                        <div class='grid-item' onclick="location.href='/house/getHouseDetail?houseIdx=${house.houseIdx}'">
                            <img src='${house.url}' alt='사진 없음'>
    <%--                        <p>Image URL: ${house.url}</p>--%>
                            <p>${house.housetype}</p>
                            <p>${house.price} 원</p>
                            <p>${house.address}</p>

                        </div>
                    </c:forEach>

                </div>
        </div>
    </div>
</div>



</body>
</html>
