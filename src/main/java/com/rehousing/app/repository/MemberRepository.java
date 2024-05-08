package com.rehousing.app.repository;

import com.rehousing.app.data.dto.MemberDto;
import com.rehousing.app.frame.RehousingRepository;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public interface MemberRepository extends RehousingRepository<String, MemberDto> {
    MemberDto findId(MemberDto memberDto) throws Exception;
    MemberDto findPw(MemberDto memberDto) throws Exception;
    MemberDto checkIdValid(MemberDto memberDto) throws Exception;
    void modifyMemberConfirm(MemberDto memberDto) throws Exception;

}
