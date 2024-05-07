package com.rehousing.controller;

import com.rehousing.app.data.dto.HouseDto;
import com.rehousing.app.data.dto.PaymentDto;
import com.rehousing.app.data.dto.ReservationDto;
import com.rehousing.app.service.PaymentService;
import com.rehousing.app.service.ReservationService;
import com.siot.IamportRestClient.response.Payment;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;


/*********************************
 * @function : Reservation Controller 
 * @author : 김주혜
 * @Date : May 1. 2024
 * 예약화면 controller 추가 May 1. 2024
 * 예약화면 controller 수정 May 4. 2024
 * 예약완료 controller 추가 May 3. 2024
 * 예약조회 controller 추가 May 5. 2024
 * 예약조회 controller 수정 May 5. 2024
 * 예약취소 controller 추가 May 6. 2024
 * 예약상세조회 controller 추가 May 6.2024
 * 예약완료 controller 수정 May 6. 2024
 * 예약조회 controller 페이징 추가 May 6. 2024
 * 예약조회 controller 페이징 count 수정 May 7. 2024
 * 예약완료 controller 세션값 변경 May 7. 2024
 * 예약화면 controller 날짜 format 변경 May 7. 2024
 * 예약조회 controller 예약 불가능 날짜 list 추가 May 7. 2024
 *********************************/
@Controller
@RequiredArgsConstructor
@Slf4j
public class ReservationController {
    final ReservationService reservationService;
    final PaymentService paymentService;
//    private IamportClient iamportClient;
//    @Value("${app.key.impapikey}")
//    public String apiKey;
//
//    @Value("${app.key.impapisecretkey}")
//    public String secretKey;
    //예약화면으로 이동
    @RequestMapping("/reserve/{no}")
    public String reserve(@PathVariable("no") String no, Model model, HttpSession session) throws Exception {
       // model.addAttribute("userId",String.valueOf(session.getAttribute("memberId")));
        HouseDto houseDetail = reservationService.getHouseDetail(Integer.valueOf(no));
        model.addAttribute("house", houseDetail);
        return "reservation/reserve";
    }
    //예약완료
    @RequestMapping("/reserve/success")
    @ResponseBody
    public int success(ReservationDto reservationDto, HttpSession session) throws Exception {
        reservationService.add(reservationDto);
        List<ReservationDto> ls = reservationService.getReservation(reservationDto.getMemberId(), "0");
        PaymentDto paymentDto = new PaymentDto();
        paymentDto.setRpId(reservationDto.getRpid());
        paymentDto.setResId(ls.get(0).getResId());
        paymentService.add(paymentDto);
        return 0;
    }
    //예약내역 확인
    @RequestMapping("/reserve/view")
    public String reserve(Model model, HttpSession session, @RequestParam(value="page",defaultValue="1") Integer page) throws Exception {
        String memberId =String.valueOf(session.getAttribute("memberId"));
        int paging = (page-1)*2;
        List<ReservationDto> reservationList= reservationService.getReservation(memberId, String.valueOf(paging));
        Date now = new Date(System.currentTimeMillis());
        int count = reservationService.getTotalCount(memberId);
        count = (int)Math.ceil(count/2);
        model.addAttribute("reservationList", reservationList);
        model.addAttribute("today", now);
        model.addAttribute("count",count);

        return "reservation/view";
    }
    //예약취소
    @RequestMapping("/reserve/cancle")
    @ResponseBody
    public int cancle(@RequestParam("resId") int resId) throws Exception {
        log.info(String.valueOf(resId));
        int k = reservationService.modifyResStatus(resId);
        if(k>0) return 1;
        return 0;
    }
    //예약상세조회
    @RequestMapping("/reserve/detail")
    @ResponseBody
    public ReservationDto detail(@RequestParam("resId") int resId) throws Exception {
        ReservationDto dto = reservationService.getDetail(resId);
        log.info(dto.toString());
        return dto;
    }
    //예약된 날짜 리스트 조회
    @RequestMapping("/reserve/finddate")
    @ResponseBody
    public List<ReservationDto> finddate(@RequestParam("houseIdx") Integer no) throws Exception {
        List<ReservationDto> ls = reservationService.getReservationRange(no);
        return ls;
    }




}
