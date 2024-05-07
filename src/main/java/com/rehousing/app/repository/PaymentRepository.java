package com.rehousing.app.repository;
import com.rehousing.app.data.dto.PaymentDto;
import com.rehousing.app.frame.RehousingRepository;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;



@Repository
@Mapper
public interface PaymentRepository extends RehousingRepository<Integer, PaymentDto> {
}
