package com.rehousing.app.data.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDate;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class HouseDto {
    private int houseIdx;
    private String housetype;
    private String address;
    private long price;
    private String cityName;
    private String url;
}
