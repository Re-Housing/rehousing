# rehousing
빈집 관련 정부 정책 백업 시스템 개발 프로젝트

<img width="1512" alt="커버" src="https://github.com/Re-Housing/rehousing/assets/114149911/cd9c9a21-53cd-4a52-987f-2878d5c62cdf">
### Index

- [⚡️ 프로젝트 정보](#%EF%B8%8F-프로젝트-정보)
- [🔥 작업 기간](#-작업-기간)
- [📌 프로젝트 및 기능 소개](#-프로젝트-및-기능-소개)
- [🌳 기대효과](#-기대효과)
- [🏕️ 아키텍처](#-아키텍처)
- [🛠️ 기술 스택](#%EF%B8%8F-기술-스택)
- [📚 프로젝트 구조](#-프로젝트-구조)
- [🦸🏻‍ 팀원 및 역할](#-팀원-및-역할)

<br/>

## ⚡️ 프로젝트 정보

- [빈집 관련 정부 정책 백업 시스템 개발 프로젝트]

<br/>

## 🔥 작업 기간

- 2024.04.26 - 2024.05.10

<br/>

## 📌 프로젝트 및 기능 소개

> 빈집 관련 정부 정책 백업 시스템 개발 프로젝트

정부 정책 백업 플랫폼, **Rehousing**입니다.

💬빈집을 조회하고 예약할 수 있습니다.

- 회원가입

- 로그인/카카오 로그인

- 아이디/비밀번호 찾기 

- 지원자격 조회

- 빈집 전체 조회

- 지역별 빈집 조회

- 빈집 예약
<img width="700" height="350" alt="예약" src="https://github.com/Re-Housing/rehousing/assets/114149911/913ba259-8c96-47f3-9587-1d542d1b3a7e">

- 빈집 예약 결제

- 빈집 예약 취소

- 빈집 예약 조회    


<br/>

## 🌳 기대효과

> 👻 사회 문제로 떠오르는 빈집 문제 관련 정책 관련 서비스

 빈집을 활용하기 위해 전국에 있는 빈집의 위치를 파악하고, 빈집 예약 시스템을 도입하여 효율적으로 빈집을 재활용할 수 있는 기회를 제공할 것입니다. 또한, 지역 사회와의 협력을 통해 지역주민들의 참여와 지원을 유도하여 빈집 공급이 원활하게 이루어지게 하고 빈집 접근성을 높여 지역 사회 문제를 해결할 것입니다.

<br/>

## 🏕️ 아키텍처
![image](https://github.com/Re-Housing/rehousing/assets/114149911/d2d23c6f-1a0a-4e90-bf83-22781a95ca12)


## 🛠️ 기술 스택

#### Environment
<img src="https://img.shields.io/badge/IntelliJ_IDEA-000000?style=flat&logo=intellij-idea&logoColor=white"> <img src="https://img.shields.io/badge/Notion-FFCCCC?style=flat&logo=Notion&logoColor=white"/>


#### Development

<img src="https://img.shields.io/badge/Java-007396?style=flat&logo=Java5&logoColor=white"> <img src="https://img.shields.io/badge/Spring Boot-6DB33F?style=flat&logo=Spring Boot&logoColor=white"><img src="https://img.shields.io/badge/Javascript-F7DF1E?style=flat&logo=Javascript&logoColor=white">
<img src="https://img.shields.io/badge/HTML5-E34F26?style=flat-square&logo=html5&logoColor=white"/>
<img src="https://img.shields.io/badge/css-1572B6?style=flat&logo=css3&logoColor=white"> 

#### DataBase

<img src="https://img.shields.io/badge/MySQL-4479A1?style=flat&logo=MySQL&logoColor=white"> 
#### Communication

<img src="https://img.shields.io/badge/Slack-4A154B?style=flat&logo=Slack&logoColor=white"> <img src="https://img.shields.io/badge/Notion-000000?style=flat&logo=Notion&logoColor=white">

#### Design
<img src="https://img.shields.io/badge/Figma-F24E1E?style=flat&logo=figma&logoColor=white">

<br/>

## 📚 프로젝트 구조

<details>
<summary>파일트리</summary>

```
🏡 
└─ src
   └─ main
      ├─ java
      │  └─ com
      │     └─ rehousing
      │        ├─ RehousingApplication.java
      │        ├─ ServletInitializer.java
      │        ├─ app
      │        │  ├─ config
      │        │  │  ├─ JasyptConfig.java
      │        │  │  ├─ SecurityConfig.java
      │        │  │  └─ WebMvcConfig.java
      │        │  ├─ data
      │        │  │  └─ dto
      │        │  │     ├─ HouseDto.java
      │        │  │     ├─ HousepicDto.java
      │        │  │     ├─ MemberDto.java
      │        │  │     ├─ PagingDto.java
      │        │  │     ├─ PaymentDto.java
      │        │  │     └─ ReservationDto.java
      │        │  ├─ frame
      │        │  │  ├─ RehousingRepository.java
      │        │  │  └─ RehousingService.java
      │        │  ├─ repository
      │        │  │  ├─ HouseRepository.java
      │        │  │  ├─ HousepicRepository.java
      │        │  │  ├─ MemberRepository.java
      │        │  │  ├─ PaymentRepository.java
      │        │  │  └─ ReservationRepository.java
      │        │  └─ service
      │        │     ├─ EmailService.java
      │        │     ├─ HouseService.java
      │        │     ├─ HousepicService.java
      │        │     ├─ KakaoLoginService.java
      │        │     ├─ MemberService.java
      │        │     ├─ PaymentService.java
      │        │     └─ ReservationService.java
      │        ├─ controller
      │        │  ├─ HouseController.java
      │        │  ├─ MainController.java
      │        │  ├─ MemberController.java
      │        │  └─ ReservationController.java
      │        └─ util
      │           └─ FileUploadUtil.java
      ├─ resources
      │  ├─ application-dev.yml
      │  ├─ application.yml
      │  ├─ log4jdbc.log4j2
      │  ├─ mapper
      │  │  ├─ housemapper.xml
      │  │  ├─ housepicmapper.xml
      │  │  ├─ membermapper.xml
      │  │  ├─ paymentmapper.xml
      │  │  └─ reservationmapper.xml
      │  └─ static
      │     └─ img
      │        ├─ account.png
      │        ├─ card.png
      │        ├─ city
      │        │  ├─ busanIcon.png
      │        │  ├─ chungbukIcon.png
      │        │  ├─ chungnamIcon.png
      │        │  ├─ daeguIcon.png
      │        │  ├─ gangwonIcon.png
      │        │  ├─ gwangjuIcon.png
      │        │  ├─ gyeongbukIcon.png
      │        │  ├─ gyeonggiIcon.png
      │        │  ├─ gyeongnamIcon.png
      │        │  ├─ incheonIcon.png
      │        │  ├─ jejuIcon.png
      │        │  ├─ jeonbukIcon.png
      │        │  ├─ jeonnamIcon.png
      │        │  ├─ sejongIcon.png
      │        │  ├─ seoulIcon.png
      │        │  └─ ulsanIcon.png
      │        ├─ favicon.png
      │        ├─ kakao.png
      │        ├─ kakaopay.png
      │        ├─ like.png
      │        ├─ liked.png
      │        ├─ likes.png
      │        ├─ logo.png
      │        ├─ nextBtn.png
      │        ├─ prevBtn.png
      │        ├─ qualify.png
      │        └─ reserve.png
      └─ webapp
         └─ views
            ├─ center.jsp
            ├─ house
            │  ├─ houseDetail.jsp
            │  ├─ houseList.jsp
            │  └─ houseRegion.jsp
            ├─ index.jsp
            ├─ member
            │  ├─ findId.jsp
            │  ├─ findPw.jsp
            │  ├─ login.jsp
            │  └─ signin.jsp
            ├─ qualify.jsp
            └─ reservation
               ├─ reserve.jsp
               └─ view.jsp
```

<br/>

</details>

## 🦸🏻‍ 팀원 및 역할

|                                                        **김민표**                                                         |                                                         **김주혜(팀장)**                                                         |                                                        **황유진**                                                        |
|:----------------------------------------------------------------------------------------------------------------------:|:-----------------------------------------------------------------------------------------------------------------------:|:---------------------------------------------------------------------------------------------------------------------:|
| [<img src="https://avatars.githubusercontent.com/u/56537513?v=4"  height=150 width=150> ](https://github.com/rabbitate) | [<img src="https://avatars.githubusercontent.com/u/114149911?v=4"  height=150 width=150>](https://github.com/juhyemi) | [<img src="https://avatars.githubusercontent.com/u/80201454?v=4"  height=150 width=150>](https://github.com/YoujinHwang) |
|                                                  회원 관리 및 소셜 로그인<br/> 지원자격 확인 및 등록 <br/> 메인페이지 관리  <br/> 웹 디자인 및 퍼블리싱                                                         |                                                           프로젝트 빌드 및 Git 관리 <br/> 예약 조회 및 관리 <br/> 결제 시스템  <br/> 웹 디자인 및 퍼블리싱                                               |                          빈집 목록 및 조회 <br/> 데이터 전처리 <br/> 웹 디자인 및 퍼블리싱                           |

