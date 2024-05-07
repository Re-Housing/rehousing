package com.rehousing.app.repository;
import com.rehousing.app.data.dto.HouseDto;
import com.rehousing.app.data.dto.ReservationDto;
import com.rehousing.app.frame.RehousingRepository;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;


@Repository
@Mapper
public interface ReservationRepository extends RehousingRepository<Integer, ReservationDto> {
    HouseDto selectHouseDetail(@Param("no") Integer no) throws Exception;
    List<ReservationDto> selectReservation(@Param("memberId") String memberId, @Param("page") String page);
    Integer updateResStatus(@Param("resId") Integer resId);
    ReservationDto selectDetail(@Param("resId") Integer resId);
    Integer selectTotalCount(@Param("memberId") String memberId);
}
