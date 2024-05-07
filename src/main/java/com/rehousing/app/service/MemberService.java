package com.rehousing.app.service;

import com.rehousing.app.data.dto.MemberDto;
import com.rehousing.app.frame.RehousingService;
import com.rehousing.app.repository.MemberRepository;
import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@AllArgsConstructor
public class MemberService implements RehousingService<String, MemberDto> {
    final MemberRepository memberRepository;

    @Override
    public int add(MemberDto memberDto) throws Exception {
        return memberRepository.insert(memberDto);
    }

    @Override
    public int del(String memberId) throws Exception {
        return memberRepository.delete(memberId);
    }

    @Override
    public int modify(MemberDto memberDto) throws Exception {
        return memberRepository.update(memberDto);
    }

    @Override
    public MemberDto get(String memberId) throws Exception {
        return memberRepository.selectOne(memberId);
    }

    @Override
    public List<MemberDto> get() throws Exception {
        return memberRepository.select();
    }

    public MemberDto getId(MemberDto memberDto) throws Exception {
        return memberRepository.findId(memberDto);
    }

    public MemberDto getPw(MemberDto memberDto) throws Exception {
        return memberRepository.findPw(memberDto);
    }

    public MemberDto checkIdValid(MemberDto memberDto) throws Exception {
        return memberRepository.checkIdValid(memberDto);
    }
}
