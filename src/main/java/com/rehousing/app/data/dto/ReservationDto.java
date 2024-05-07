package com.rehousing.app.data.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class ReservationDto {
    private int resId;
    private String phone;
    private Date startdate;
    private Date enddate;
    private Date regdate;
    private long totalprice;
    private String memberId;
    private int houseIdx;
    private String resStatus;
    private String url;
    private String address;
    private String resName;
    private String kind;
    private int rpid;
}
