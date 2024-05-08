package com.rehousing.app.service;

import com.rehousing.app.data.dto.HouseDto;
import com.rehousing.app.data.dto.HousepicDto;
import com.rehousing.app.frame.RehousingService;
import com.rehousing.app.repository.HouseRepository;
import com.rehousing.app.repository.HousepicRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class HousepicService implements RehousingService<String, HousepicDto> {
    final HousepicRepository housepicRepository;
    @Override
    public int add(HousepicDto housepicDto) throws Exception {
        return housepicRepository.insert(housepicDto);
    }

    @Override
    public int del(String s) throws Exception {
        return housepicRepository.delete(s);
    }

    @Override
    public int modify(HousepicDto housepicDto) throws Exception {
        return 0;
    }

    @Override
    public HousepicDto get(String s) throws Exception {
        return null;
    }

    @Override
    public List<HousepicDto> get() throws Exception {
        return housepicRepository.select();
    }
    // HousepicService.java 내에 추가할 메소드
    public String findPhotoByHouseId(int houseIdx) throws Exception {
        return housepicRepository.findPhotoByHouseId(houseIdx);
    }


}
