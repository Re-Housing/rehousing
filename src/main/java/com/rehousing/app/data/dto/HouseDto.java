package com.rehousing.app.data.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class HouseDto {
    private int houseIdx;
    private BigDecimal latitude;
    private BigDecimal longitude;
    private String houseType;
    private String address;
    private long price;
    private String cityName;
    private String url;
}