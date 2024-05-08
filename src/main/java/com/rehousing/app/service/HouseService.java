package com.rehousing.app.service;

import com.rehousing.app.data.dto.HouseDto;
import com.rehousing.app.data.dto.TestDto;
import com.rehousing.app.frame.RehousingRepository;
import com.rehousing.app.frame.RehousingService;
import com.rehousing.app.repository.HouseRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class HouseService implements RehousingService<String, HouseDto> {
    final HouseRepository houseRepository;
    @Override
    public int add(HouseDto houseDto) throws Exception {
        return houseRepository.insert(houseDto);
    }

    @Override
    public int del(String s) throws Exception {
        return houseRepository.delete(s);
    }

    @Override
    public int modify(HouseDto houseDto) throws Exception {
        return 0;
    }

    @Override
    public HouseDto get(String s) throws Exception {
        return houseRepository.selectOne(s);
    }

    @Override
    public List<HouseDto> get() throws Exception {
        return houseRepository.select();
    }

    public List<HouseDto> getByCity(String s) throws Exception {
        return houseRepository.selectByCity(s);
    }
    public HouseDto getByIdx(Integer s) throws Exception {
        return houseRepository.selectByIdx(s);
    }
}
