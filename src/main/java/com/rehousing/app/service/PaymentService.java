package com.rehousing.app.service;

import com.rehousing.app.data.dto.HouseDto;
import com.rehousing.app.data.dto.PaymentDto;
import com.rehousing.app.data.dto.ReservationDto;
import com.rehousing.app.frame.RehousingService;
import com.rehousing.app.repository.PaymentRepository;
import com.rehousing.app.repository.ReservationRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class PaymentService implements RehousingService<Integer, PaymentDto> {
    final PaymentRepository paymentRepository;
    @Override
    public int add(PaymentDto paymentDto) throws Exception {
        return paymentRepository.insert(paymentDto);
    }

    @Override
    public int del(Integer s) throws Exception {
        return paymentRepository.delete(s);
    }

    @Override
    public int modify(PaymentDto paymentDto) throws Exception {
        return 0;
    }

    @Override
    public PaymentDto get(Integer s) throws Exception {
        return null;
    }

    @Override
    public List<PaymentDto> get() throws Exception {
        return paymentRepository.select();
    }

}
