package com.rehousing.app.repository;

import com.rehousing.app.data.dto.HouseDto;
import com.rehousing.app.frame.RehousingRepository;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@Mapper
public interface HouseRepository extends RehousingRepository<String, HouseDto> {
    List<HouseDto> selectByCity(String cityName) throws Exception;
    HouseDto selectByIdx(Integer houseIdx) throws Exception;

}
