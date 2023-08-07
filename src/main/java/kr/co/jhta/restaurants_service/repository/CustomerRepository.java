package kr.co.jhta.restaurants_service.repository;

import kr.co.jhta.restaurants_service.vo.Customer;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Repository;

@Repository
public interface CustomerRepository extends PagingAndSortingRepository<Customer, Integer> {

    Customer findByUsername(String usernmae);
}
