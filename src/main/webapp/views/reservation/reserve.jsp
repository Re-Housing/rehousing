<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>

<%--calender--%>
<script src="https://code.jquery.com/jquery-3.7.1.slim.js" integrity="sha256-UgvvN8vBkgO0luPSUl2s8TIlOSYRoGFAX4jlCIm9Adc=" crossorigin="anonymous"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
<%--/calender--%>
<%--kakaopay--%>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<%--/kakaopay--%>
    <style>
        .reservebox {
            box-sizing: border-box;
            position: absolute;
            width: 80%;
            height: 80%;
            left: 10%;
            top: 89px;
            background: #FFFFFF;
            box-shadow: 0px 4px 70px rgba(0, 0, 0, 0.1);
            border-radius: 60px;
            padding-left: 50px;
            padding-right: 50px;
        }
        .totalbox {
            padding-left: 30px;
            padding-right: 30px;
        }
        input{
            border-radius: 8px;
            border: 1px solid #9a9a9a;
            height: 40px;
            text-align: center;
        }
        #name {
            width: 300px;
        }
        #phone1,#phone2,#phone3 {
            width: 100px;
        }
        #email1,#email2{
            width:150px;
        }
        #email2{
            height: 40px;
            border-radius: 8px;
        }
        #btn_payment {
            border-radius: 20px;
            width: 90%;
            height: 12%;
            background: #142231;
            color: #ffffff;
            margin-top:15px;
            font-weight: bold;
            font-size: 1.2rem;
        }
        #v_line {
            border-left: thin solid #9a9a9a;
            height: 460px;
        }
        .reservebox2 {
            display: flex;
        }
        .reservebox3 {
            padding: 30px;
            width: 50%;
            justify-content: space-between;
        }
        .reserve_detail {
            justify-content: space-between;
            display: flex;
            align-items: center;
        }
        .reserve_info {
            padding: 30px;
            width: 40%;
        }
        .reserve_info_box {
            border: none;
            background: #FFFFFF;
            box-shadow: 0px 4px 70px rgba(0, 0, 0, 0.1);
            height: fit-content;
            border-radius: 20px;
            padding: 30px;
        }
        .img_box {
            border: none;
            background: #FFFFFF;
            box-shadow: 0px 4px 70px rgba(0, 0, 0, 0.1);
            width: 150px;
            height: 150px;
            border-radius: 20px;
            margin-right: 30px;
        }
        img{
            width: 150px;
            height: 150px;
        }
        span{
            font-size: medium;
        }
        hr{
            margin-top: 25px;
            margin-bottom: 25px;
        }
        /*화살표버튼 제거*/
        input::-webkit-outer-spin-button,
        input::-webkit-inner-spin-button {
            -webkit-appearance: none;
            margin:0;
        }
        #payment{
            backdrop-filter: blur(5px);
            display: none;
            position: relative;
            align-items: center;
            justify-content: center;
            height: 100%;
            z-index: 1;
        }
        #inner_payment{
            border: none;
            background: #FFFFFF;
            box-shadow: 0px 4px 70px rgba(0, 0, 0, 0.1);
            border-radius: 30px;
            width: 800px;
            height: 500px;
            backdrop-filter: blur(5px);
            display: none;
        }
        .payment_kind{
            border:1px solid #C6C4C4;
            width: 100%;
            height: 130px;
            text-align: center;
            align-items: center;
            padding:5% 10%;
        }
        .payment_kind_box{
            display:flex;
            margin-top: 60px;
        }
        .pay_img{
            width:80px;
            height: 80px;
            border-radius: 20px;
            margin-bottom: 5%;
        }
        .reservebox4{
            display:flex;
            justify-content: space-between;
            align-items: center;
        }
        #btn_cancle{
            border: none;
            height: 50px;
            background: #ffffff;
        }
        .payment_kind:hover{
            background-color: lightgray;
            transition: all 0.5s;
        }
        .reserve_calender{
            display: flex;
            align-items: center;
            justify-content: space-between;
        }
        .cancelBtn, .applyBtn{
            border: none !important;
            background: #ffffff !important;
        }
    </style>

<div class="totalbox">
    <div class="reservebox">
        <div>
            <h1>확인 및 결제</h1>
        </div>
        <div class="reservebox2">
            <div class="reservebox3">
                    <h2 class="reserve_detail">예약정보</h2>
                <hr>
                <div>
                    <div>
                        <div class="reserve_calender">
                            <h3>날짜</h3>
                            <input type="text" id="daterange" name="daterange"/>
                        </div>
                    </div>
                </div>
                <div class="reserve_detail">
                    <h3>예약자 성명</h3>
                    <input type="text" id="name" name="name"/>
                </div>
                <div class="reserve_detail">
                    <h3>핸드폰 번호</h3>
                    <div>
                        <input type="number" id="phone1" name="phone1" />-
                        <input type="number" id="phone2" name="phone2" />-
                        <input type="number" id="phone3" name="phone3" />
                    </div>
                </div>
                <div class="reserve_detail">
                    <h3>이메일</h3>
                    <div>
                        <input type="text" id="email1" name="email"/>@
                        <select id="email2" name="email2">
                            <option value="naver.com">naver.com</option>
                            <option value="google.com">google.com</option>
                            <option value="hanmail.net">hanmail.com</option>
                        </select>
                    </div>
                </div>
                <button type="button" id="btn_payment">결제하기</button>
            </div>
            <div id="v_line"></div>
            <div class="reserve_info">
                <div class="reserve_info_box">
                    <div class="reservebox2">
                        <div class="img_box"><img src='<c:url value="${house.url}"/>'/>
                        </div>
                        <div>
                            <h3 id="address">${house.address}</h3>
                            <h4>${house.housetype}</h4>
                        </div>
                    </div>
                    <hr>
                    <div>
                        <h3>요금 세부정보</h3>
                        <div class="reserve_detail">
                            <span>${house.price}원 (7일 기준)</span>*<span id="showrange"></span> &nbsp; <span id="total1"></span>
                        </div>
                    </div>
                    <hr>
                    <div class="reserve_detail">
                        <h3>총 합계</h3>
                        <span id="total2"></span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<div id="payment">
    <div id="inner_payment">
        <div style="padding:5%">
            <div class="reservebox4">
                <h2>결제수단</h2>
                <div>
                    <button id="btn_cancle" type="button"><h3>닫기</h3></button>
                </div>
            </div>
            <hr>
            <div class="payment_kind_box" >
                <div class="payment_kind" value="신용카드">
                    <img class="pay_img" src='<c:url value="/img/card.png"/>' alt="카드결제"/>
                    <div><h3>신용카드</h3></div>
                </div>
                <div class="payment_kind" value="무통장입금">
                    <img class="pay_img" src='<c:url value="/img/account.png"/>' alt="무통장입금"/>
                    <div><h3>무통장입금</h3></div>
                </div>
                <div class="payment_kind" value="카카오페이">
                    <img class="pay_img" src='<c:url value="/img/kakaopay.png"/>' alt="카카오페이"/>
                    <div><h3>카카오페이</h3></div>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
    let reserve = {
        init: function(){
            let startdate = '';
            let enddate = '';
            $('.payment_kind').click(function(){
                let what = $(this).attr("value");
                if(what=='카카오페이'){
                   reserve.kakaopay(startdate, enddate);
                }
            });
            $('#daterange').change(()=>{
                let range = $('#daterange').val();
                let start = range.substring(6,10)+'-'+range.substring(0,2)+'-'+range.substring(3,5);
                let end = range.substring(19,23)+'-'+range.substring(13,15)+'-'+range.substring(16,18);

                let oldDate = new Date(start);
                let newDate = new Date(end);
                let diff = Math.abs(newDate.getTime() - oldDate.getTime());
                diff = Math.ceil(diff / (1000 * 60 * 60 * 24));
                startdate=oldDate;
                enddate=newDate;
                $('#showrange').text(diff+'박');
                let total = 10000 * Math.ceil(diff/7);
                $('#total1').text(total+'원');
                $('#total2').text(total+'원');
            });
            $('#btn_cancle').click(()=>{
                $('#payment').css('display', 'none');
                $('#inner_payment').css('display', 'none');
            });
            $('#phone1').keyup(function(){
                let tmp = $(this).val();
                if(tmp.length>=4) {
                    tmp = tmp.substring(0, 3);
                    $('#phone1').val(tmp);
                }
            });
            $('#phone2').keyup(function(){
                let tmp = $(this).val();
                if(tmp.length>=5) {
                    tmp = tmp.substring(0, 4);
                    $('#phone2').val(tmp);
                }
            });
            $('#phone3').keyup(function(){
                let tmp = $(this).val();
                if(tmp.length>=5) {
                    tmp = tmp.substring(0, 4);
                    $('#phone3').val(tmp);
                }
            });
            let email2 = 'naver.com';
            $("select[name=email2]").change(function(){
                email2 = $(this).val();
            });
            $('#btn_payment').click(()=>{
                let name=$('#name').val();
                let phone1=$('#phone1').val();
                let phone2=$('#phone2').val();
                let phone3=$('#phone3').val();
                let email1=$('#email1').val();
                if(name==null||name==''){
                    alert('예약자 성명을 입력하세요');
                    $('#name').focus();
                    return;
                }
                if(phone1==null||phone1==''||phone2==null||phone2==''||phone3==null||phone3==''){
                    alert('핸드폰번호를 입력하세요');
                    $('#phone1').focus();
                    return;
                }
                if(email1==null||email1==''){
                    alert('이메일을 입력하세요');
                    $('#email1').focus();
                    return;
                }
                if(email2==null||email2==''){
                    alert('이메일 형식을 선택하세요');
                    return;
                }
                $('#payment').css('display', 'flex');
                $('#inner_payment').css('display', 'block');
            });
        },
        kakaopay: function(startdate, enddate){
            let IMP = window.IMP;
            IMP.init("imp74352341");

            let today = new Date();
            let hours = today.getHours(); // 시
            let minutes = today.getMinutes();  // 분
            let seconds = today.getSeconds();  // 초
            let milliseconds = today.getMilliseconds();
            let makeMerchantUid = hours +  minutes + seconds + milliseconds;
            IMP.request_pay({
                pg : 'kakaopay',
                merchant_uid: "IMP"+makeMerchantUid,
                name : $('#address').text(),
                amount : $('#total2').text(),
                buyer_email : $('#email1').val()+'@'+$('#email2').val(),
                buyer_name : $('#name').val(),
                buyer_tel : $('#phone1').val()+'-'+$('#phone2').val()+'-'+$('#phone3').val(),
                buyer_addr : '서울특별시 강남구 삼성동',
                buyer_postcode : '123-456'
            }, function (rsp) { // callback
                if (rsp.success) {
                    $('#payment').css('display', 'none');
                    $('#inner_payment').css('display', 'none');
                    reserve.paysuccess(rsp, startdate, enddate);
                } else {
                    console.log(rsp);
                }
            });
        },
        paysuccess: function (rsp, startdate, enddate){
            console.log(rsp);
            $.ajax({
                url:'<c:url value="/reserve/success"/>',
                data:{
                    email: rsp.buyer_email,
                    phone: rsp.buyer_tel,
                    totalprice: rsp.paid_amount,
                    memberId: 'user1',
                    startdate: startdate,
                    enddate: enddate,
                    houseIdx: ${house.houseIdx},
                    resName: rsp.buyer_name,
                    rpid: 3
                },
                success: function(){
                    alert('예약이 완료되었습니다.');
                    window.location.href='<c:url value="/reserve/view"/>';
                },
                error: function(){
                    alert('결제에 실패했습니다. 다시 시도해주세요');
                    console.log(error);
                }
            })
        }
    };
    $(function(){
        reserve.init();
    });
</script>
<script>
    function checkphone(item,n,target){
        if(item.length>n) item = item.slice(0,n-1);
        target='#'+target;
        $(target).val = item;
    }
</script>
<script>
    $(function() {
        $('input[name="daterange"]').daterangepicker({
            opens: 'left'
        }, function(start, end, label) {
            console.log("A new date selection was made: " + start.format('YYYY-MM-DD') + ' to ' + end.format('YYYY-MM-DD'));
        });
        let now = new Date();
        let year = now.getFullYear();
        let month = (now.getMonth()+1).toString().padStart(2,'0');
        let day = now.getDate().toString().padStart(2,'0');
        let today = month+'/'+day+'/'+year;
        $('#demo').daterangepicker({
            "minYear": 2024,
            "maxYear": 2024,
            "startDate": today,
            "endDate": "05/24/2024",
            "minDate": today,
            "maxDate": "08/09/2024"
        }, function(start, end, label) {
            alert(start.format('YYYY-MM-DD'));
            console.log('New date range selected: ' + start.format('YYYY-MM-DD') + ' to ' + end.format('YYYY-MM-DD') + ' (predefined range: ' + label + ')');
        });
        // $("#txtDate").daterangepicker({
        //     locale:{
        //         "separator":"-",
        //         "format":'YYYY-MM-DD',
        //         "applyLabel":"확인",
        //         "cancelLabel":"취소",
        //         "daysOfWeek":["일","월","화","수","목","금","토"],
        //         "monthNames":["1월","2월","3월","4월","5월","6월","7월","8월","9월","10월","11월","12월"]
        //     },
        //     timePicker: true,                        // 시간 노출 여부
        //     showDropdowns: true,                     // 년월 수동 설정 여부
        //     autoApply: true,                         // 확인/취소 버튼 사용여부
        //     timePicker24Hour: true,                  // 24시간 노출 여부(ex> true : 23:50, false : PM 11:50)
        //     timePickerSeconds: true,                 // 초 노출 여부
        //     singleDatePicker: true
        // });
        // $("#txtDate").on('show.daterangepicker', function (ev, picker) {
        //     $(".yearselect").css("float", "left");
        //     $(".monthselect").css("float", "right");
        //     $(".cancelBtn").css("float", "right");
        // });


    });
</script>
