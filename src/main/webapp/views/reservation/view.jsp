<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>

<script>
    function reserveCancle(resNo){
        let result = confirm("예약을 취소하시겠습니까?");
        if(result){
            $.ajax({
                url:'<c:url value="/reserve/cancle"/>',
                data:{
                    resId:resNo
                },
                success:function(res){
                    alert("예약이 취소되었습니다.");
                    location.replace(location.href);
                },
                error:function(error){
                    console.log(error);
                }
            });
        }else{
            return;
        }
    }
    function reserveDetail(resNo){
        $.ajax({
           url:'/reserve/detail',
           data:{
               resId:resNo
           },
            success: function(res) {
                console.log(res);
                let realprice = res.totalprice.toLocaleString('ko-KR')+'원';
                $('#reserve_paymentkind').text(res.kind);
                $('#reserve_phone').text(res.phone);
                $('#reserve_totalprice').text(realprice);
                $('#reserveName').text(res.resName);
                let startdate = new Date(res.startdate);
                let enddate = new Date(res.enddate);
                let startmonth = startdate.getMonth()+1;
                let startday = startdate.getDate();
                let endmonth = enddate.getMonth()+1;
                let endday = enddate.getDate();
                let rentDate = startmonth + "월" + startday + "일 ~ "+endmonth+"월"+endday+"일";
                $('#reserve_date').text(rentDate);
                let imgsrc = `<img id="img_box_style" src="`;
                imgsrc += res.url;
                imgsrc += `"/>`;
                $('#reserve_img').html(imgsrc);

            },
            error: function (error) {
                console.log(error);
            }
        });
        $('#reservation_detail_box').css('display', 'flex');
        $('#inner_detail_box').css('display', 'block');
    }
</script>
<script>
    let view = {
        init: function () {
            $('#btn_cancle').click(()=>{
                $('#reservation_detail_box').css('display', 'none');
                $('#inner_detail_box').css('display', 'none');
            });
        }
    };
    $(function () {
        view.init();
    });
</script>

<div class="totalbox">
    <div class="reservebox">
        <div>
            <h1 style="text-align: center;">예약 조회</h1>
        </div>
        <div>
            <div class="reservebox3">
                <h2 class="reserve_detail">예약 리스트</h2>
            </div>
            <div>
                <c:choose>
                    <c:when test="${not empty reservationList}">
                        <c:forEach items="${reservationList}" var="rList">
                            <div id="reserve_detail_inner">
                                <div id="reserve_detail_inner2">
                                    <img id="detail_img_box" src='<c:url value="${rList.url}"/>'/>
                                </div>
                                <div id="reserve_detail_inner3">
                                    <h3>주소</h3>
                                    <h3>총 요금</h3>
                                </div>
                                <div id="reserve_detail_inner4">
                                    <h3>${rList.address}</h3>
                                    <h3><fmt:formatNumber type="number" pattern="###,###원" value="${rList.totalprice}"/></h3>
                                </div>
                                    <c:if test="${rList.resStatus=='예약완료'}">
                                        <div>
                                            <h4 onclick="reserveDetail(${rList.resId})">상세보기</h4>
                                            <c:if test="${rList.startdate.after(today)}">
                                                <h5 onclick="reserveCancle(${rList.resId})">예약취소</h5>
                                            </c:if>
                                        </div>
                                    </c:if>
                                    <c:if test="${rList.resStatus=='예약취소'}">
                                        <div>
                                            <h4>취소된 예약</h4>
                                        </div>
                                    </c:if>
                            </div>
                        </c:forEach>
                    </c:when>
                    <c:otherwise>
                        <h3 id="nosearch">예약 내역이 존재하지 않습니다.</h3>
                    </c:otherwise>
                </c:choose>
            </div>
            <div id="paging">
                <c:forEach begin="1" end="${count}" var="index">
                    <button id="pageBtn" onclick="location.href='/reserve/view?page=${index}'" type="button">${index}</button>
                </c:forEach>
            </div>
        </div>
    </div>
</div>


<div id="reservation_detail_box">
    <div id="inner_detail_box">
        <div id="inner_detail_box1">
            <div class="inner_detail_box2">
                <h3>예약내역 상세</h3>
                <div>
                    <button id="btn_cancle" type="button"><h3>닫기</h3></button>
                </div>
            </div>
            <hr>
            <div>
                <h4>상품 및 이용정보</h4>
                <div id="detail_info">
                    <div id="reserve_img">
                    </div>
                    <div>
                        <h4>날짜</h4>
                        <h4 id="reserve_date"></h4>
                    </div>
                </div>
            </div>
            <hr>
            <div>
                <h4>예약자 정보</h4>
                <div class="reserve_information">
                    <h5>예약자 이름</h5>
                    <h5 id="reserveName">예약자 이름</h5>
                </div>
                <div class="reserve_information">
                    <h5>핸드폰 번호</h5>
                    <h5 id="reserve_phone">핸드폰 번호</h5>
                </div>
            </div>
            <hr>
            <div>
                <h4>결제 금액</h4>
                <div class="reserve_information">
                    <h5>총 결제 금액</h5>
                    <h5 id="reserve_totalprice">총 결제 금액</h5>
                </div>
                <div class="reserve_information">
                    <h5>결제 수단</h5>
                    <h5 id="reserve_paymentkind">결제 수단</h5>
                </div>
            </div>
        </div>
    </div>
</div>

<style>
    .reservebox {
        /*box-sizing: border-box;*/
        /*position: absolute;*/
        /*width: 80%;*/
        /*height: 80%;*/
        /*left: 10%;*/
        /*top: 89px;*/
        /*background: #FFFFFF;*/
        /*box-shadow: 0px 4px 70px rgba(0, 0, 0, 0.1);*/
        /*border-radius: 60px;*/
        /*padding-left: 50px;*/
        /*padding-right: 50px;*/
        height: 100%;
        padding: 0 5%;
        border-radius: 60px;
        background: #FFFFFF;
        box-shadow: 0px 4px 70px rgba(0, 0, 0, 0.1);
        display: flex;
        flex-direction: column;
        /*align-items: center;*/
    }
    .totalbox {
        /*padding-left: 30px;*/
        /*padding-right: 30px;*/
        height: calc(100% - 175px);
        max-height: 100vh;
        padding: 50px 15%;
    }
    .reservebox3 {
        padding: 15px;
        justify-content: space-between;
    }
    .reserve_detail {
        justify-content: space-between;
        display: flex;
        align-items: center;
    }
    #reservation_detail_box{
        backdrop-filter: blur(5px);
        display: none;
        position: relative;
        align-items: center;
        justify-content: center;
        height: 100%;
        z-index: 1;
    }
    #inner_detail_box{
        border: none;
        background: #FFFFFF;
        box-shadow: 0px 4px 70px rgba(0, 0, 0, 0.1);
        border-radius: 30px;
        width: 400px;
        height: 600px;
        backdrop-filter: blur(5px);
        display: none;
    }
    #btn_cancle{
        border: none;
        height: 50px;
        background: #ffffff;
    }
    #inner_detail_box1{
        padding:10%;
    }
    .inner_detail_box2{
        display:flex;
        justify-content: space-between;
        align-items: center;
    }
    #paging{
        display:flex;
        justify-content: center;
    }
    #pageBtn{
        width:30px;
        height: 30px;
        border: none;
        border-radius: 20px;
    }
    #reserve_detail_inner{
        display:flex;
        border-radius: 20px;
        padding-top:5px;
        box-shadow: 0px 4px 70px rgba(0, 0, 0, 0.1);
        height:150px;
        margin-bottom: 10px;
    }
    #detail_img_box{
        width:200px;
        height:130px;
    }
    #reserve_detail_inner2{
        margin-left:30px;
        box-shadow: 0px 4px 70px rgba(0, 0, 0, 0.1);
        margin-top:10px;
        border-radius:20px;
        width:200px;
        height:130px;
    }
    #reserve_detail_inner3{
       margin-left: 20px;
        width:10%;
    }
    #reserve_detail_inner4{
        margin-left: 20px;
        width:50%;
    }
    .inner_margin{
        margin-left:20px;
    }
    .reserve_information{
        display:flex;
        justify-content: space-between;
        height: 30px;
    }
    #nosearch{
        text-align: center;
    }
    #img_box_style{
        width:130px;
        height: 100px;
        border-radius:20px;
    }
    #detail_info{
        display:flex;
        justify-content: space-between;
    }
</style>