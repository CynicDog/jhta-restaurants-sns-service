package kr.co.jhta.restaurants_service.service;

import kr.co.jhta.restaurants_service.mapper.AdminMapper;
import kr.co.jhta.restaurants_service.mapper.CustomerMapper;
import kr.co.jhta.restaurants_service.mapper.OwnerMapper;
import org.springframework.stereotype.Service;

@Service
public class UserService {

    private final AdminMapper adminMapper;
    private final OwnerMapper ownerMapper;
    private final CustomerMapper customerMapper;

    public UserService(AdminMapper adminMapper, OwnerMapper ownerMapper, CustomerMapper customerMapper) {
        this.adminMapper = adminMapper;
        this.ownerMapper = ownerMapper;
        this.customerMapper = customerMapper;
    }
}
