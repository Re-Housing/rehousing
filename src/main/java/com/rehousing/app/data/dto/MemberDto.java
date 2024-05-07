package com.rehousing.app.data.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class MemberDto {
    private String memberId;
    private String memberPw;
    private String memberName;
    private String memberEmail;
    private boolean memberConfirm;
}
