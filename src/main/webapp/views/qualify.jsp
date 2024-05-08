<%--
  Created by IntelliJ IDEA.
  User: rabbikim
  Date: 5/2/24
  Time: 12:02 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
    .bodyDiv {
        height: calc(100% - 175px);
        max-height: 100vh;
        padding: 50px 15%;
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

    #loginDiv {
        display: flex;
        width: 100%;
        height: 100%;
    }

    #qualifyDiv {
        display: flex;
        flex-direction: column;
        justify-content: center;
        width: 100%;
        height: calc(100% - 50px);
        padding: 0 5%;
    }

    .loginInput {
        padding: 5% 5%;
        width: 100%;
    }

    #loginFindDiv {
        width: 100%;
        margin-bottom: 10%;
        padding: 0 5%;
    }

    #loginFindDiv div {
        padding: 0;
    }

    #loginFindDiv a {
        color: #797979;
        text-decoration: none;
    }

    #signInBtn {
        color: #4562FF;
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

    #qualifyResultDiv {
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
        width: 50%;
        height: calc(100% - 50px);
    }

    #kakao {
        width: 300px;
        height: 45px;
    }

    /*지원자격 확인 CSS*/

    .checkDiv {
        display: flex;
        flex-direction: row;
        align-items: center;
    }

    .form-check-input {
        height: 10px;
    }

    #birthDate, #marriageDate {
        padding: 3%;
        border: 1px solid #C6C4C4;
        border-radius: 10px;
        width: 90%;
    }

    .dateDiv {
        margin: 3% 0;
    }

    #moneyDiv {
        display: flex;
        justify-content: space-between;
        width: 93%;
    }

    #incomeRange {
        width: 90%;
    }

    #incomeRangeValue {
        margin-left: 10px;
    }

    #fileInput {
        padding: 5%;
        margin: 1%;
        border: 1px solid #C6C4C4;
        border-radius: 10px;
        width: 90%;
        height: 50%;
    }

    .qualifyBtn {
        position: relative;
        height: 50px;
        width: 80%;
        font-weight: bold;
        font-size: 1.2rem;
        color: #FFFFFF;
        background: #142231;
        border-radius: 10px;
        border: 0;
        cursor: pointer;
    }
</style>

<script>
    $(function (){
        var rangeInput = document.getElementById('incomeRange');
        var rangeValueDisplay = document.getElementById('incomeRangeValue');

        var now_utc = Date.now()
        var timeOff = new Date().getTimezoneOffset()*60000;
        var today = new Date(now_utc-timeOff).toISOString().split("T")[0];
        document.getElementById("birthDate").setAttribute("max", today);
        document.getElementById("marriageDate").setAttribute("max", today);

        rangeInput.addEventListener('input', function() {
            if (rangeInput.value == 0) {
                rangeValueDisplay.textContent = "1000만원 이하";
            } else {
                rangeValueDisplay.textContent = numberWithCommas(rangeInput.value) + ' 원 이상';
            }
        });

        // 숫자를 읽기 쉽게 하기 위해 쉼표를 추가하는 함수
        function numberWithCommas(num) {
            return num.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
        }

        $('.qualifyBtn').click(function() {
            var ageValid = checkAge();
            var marriageValid = checkMarriage();
            var incomeValid = checkIncome();
            var movingValid = checkMoving();

            if (ageValid && marriageValid && incomeValid && movingValid) {
                alert('조건을 충족합니다!');
                window.location.href = '<c:url value="/qualifyimpl"/>'
            }
        });

        function checkAge() {
            // 생년월일 입력 여부 확인
            var birthDate = $('#birthDate').val();
            if (!birthDate) {
                alert('생년월일을 입력해주세요.');
                return false;
            }
            // 나이 계산
            var today = new Date();
            var birthYear = new Date(birthDate).getFullYear();
            var age = today.getFullYear() - birthYear;
            // 나이가 18세 이상 49세 이하인지 확인
            if (age < 18 || age > 49) {
                alert('나이가 18세 이상 49세 이하여야 합니다.');
                return false;
            }
            return true;
        }

        function checkMarriage() {
            var radioValue = $("input[name='marriageRadio']:checked").val();
            if (radioValue === "marriageTrue") {
                var marriageDate = $('#marriageDate').val();
                if (!marriageDate) {
                    alert('혼인 신고일을 입력해주세요.');
                    return false;
                }
                // 혼인 신고일로부터 7년 이상 경과했는지 확인
                var today = new Date();
                var marriageYear = new Date(marriageDate).getFullYear();
                var yearsElapsed = today.getFullYear() - marriageYear;
                if (yearsElapsed < 7) {
                    alert('혼인 신고일로부터 7년 이상 경과해야 합니다.');
                    return false;
                }
            }
            return true;
        }

        function checkIncome() {
            var radioValue = $("input[name='marriageRadio']:checked").val();
            if (radioValue === "marriageTrue") {
                var incomeRange = parseInt($('#incomeRange').val());
                if (incomeRange > 50000000) {
                    alert('부부 합산 소득은 5000만원 이하여야 합니다.');
                    return false;
                }
            }
            return true;
        }

        function checkMoving() {
            var radioValue = $("input[name='movingRadio']:checked").val();
            if (radioValue === "movingFalse") {
                alert('빈집 지역에 주민등록을 앞두고 있거나 즉시 전입할 수 있어야 합니다.');
                return false;
            }
            return true;
        }
    });
</script>
<div class="bodyDiv">
    <div class="container">
        <h1>지원자격 확인</h1>
        <div id="loginDiv">
            <div id="qualifyDiv">
                <div class="dateDiv">
                    <label for="birthDate">생년월일</label>
                    <input id="birthDate" type="date">
                </div>
                <div class="checkDiv">
                    <label for="radio1">결혼 유무</label>
                    <div class="form-check">
                        <input type="radio" class="form-check-input" id="radio1" name="marriageRadio" value="marriageFalse" checked>
                        <label for="radio1">미혼</label>
                    </div>
                    <div class="form-check">
                        <input type="radio" class="form-check-input" id="radio2" name="marriageRadio" value="marriageTrue">
                        <label for="radio2">기혼</label>
                    </div>
                </div>
                <div class="dateDiv">
                    <label for="marriageDate">혼인 신고일</label>
                    <input id="marriageDate" type="date">
                </div>
                <div>
                    <label for="incomeRange">부부 합산 소득</label>
                    <span id="incomeRangeValue"></span>
                </div>
                <input id="incomeRange" type="range" class="form-range" min="0" max="100000000" step="10000000">
                <div id="moneyDiv">
                    <span>1,000만원 이하</span>
                    <span>5,000만원 이상</span>
                    <span>1억원 이상</span>
                </div>
                <div class="checkDiv">
                    <p>빈집 지역에 주민등록을 앞두고 있거나 즉시 전입할 수 있나요?</p>

                    <div class="form-check">
                        <input type="radio" class="form-check-input" id="radio3" name="movingRadio" value="movingTrue">
                        <label class="form-check-label" for="radio3">네</label>
                    </div>
                    <div class="form-check">
                        <input type="radio" class="form-check-input" id="radio4" name="movingRadio" value="movingFalse" checked>
                        <label class="form-check-label" for="radio4">아니요</label>
                    </div>
                </div>
                <div id="fileUploadDiv">
                    <label for="fileInput" class="form-label">소득 증명서 업로드</label>
                    <input type="file" id="fileInput">
                </div>
            </div>
            <div id="hrWrap">
                <hr class="bar">
            </div>
            <div id="qualifyResultDiv">
                <button class="qualifyBtn">확인</button>
            </div>
        </div>
    </div>
</div>