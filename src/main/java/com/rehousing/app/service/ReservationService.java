package com.rehousing.app.service;

import com.rehousing.app.data.dto.HouseDto;
import com.rehousing.app.data.dto.ReservationDto;
import com.rehousing.app.frame.RehousingService;
import com.rehousing.app.repository.ReservationRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class ReservationService implements RehousingService<Integer, ReservationDto> {
    final ReservationRepository reservationRepository;
    @Override
    public int add(ReservationDto reservationDto) throws Exception {
        return reservationRepository.insert(reservationDto);
    }

    @Override
    public int del(Integer s) throws Exception {
        return reservationRepository.delete(s);
    }

    @Override
    public int modify(ReservationDto reservationDto) throws Exception {
        return 0;
    }

    @Override
    public ReservationDto get(Integer s) throws Exception {
        return null;
    }

    @Override
    public List<ReservationDto> get() throws Exception {
        return reservationRepository.select();
    }

    public HouseDto getHouseDetail(Integer no) throws Exception{
        return reservationRepository.selectHouseDetail(no);
    }
    public List<ReservationDto> getReservation(String memberId, String page) throws Exception{
        return reservationRepository.selectReservation(memberId, page);
    }
    public Integer modifyResStatus(Integer resId) throws Exception{
        return reservationRepository.updateResStatus(resId);
    }
    public ReservationDto getDetail(Integer resId) throws Exception{
        return reservationRepository.selectDetail(resId);
    }
    public Integer getTotalCount(String memberId) throws Exception{
        return reservationRepository.selectTotalCount(memberId);
    }
    public List<ReservationDto> getReservationRange(Integer no) throws Exception{
        return reservationRepository.selectReservationRange(no);
    }

}
