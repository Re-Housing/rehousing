package com.rehousing.app.repository;

import com.rehousing.app.data.dto.HouseDto;
import com.rehousing.app.data.dto.HousepicDto;
import com.rehousing.app.frame.RehousingRepository;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@Mapper
public interface HousepicRepository extends RehousingRepository<String, HousepicDto> {
    String findPhotoByHouseId(@Param("houseId") int houseId);

}
