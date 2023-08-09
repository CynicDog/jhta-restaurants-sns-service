package kr.co.jhta.restaurants_service;

import com.fasterxml.jackson.databind.ObjectMapper;
import kr.co.jhta.restaurants_service.vo.user.Role;
import kr.co.jhta.restaurants_service.vo.user.User;
import org.jboss.logging.Logger;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;

import java.util.Date;

@SpringBootApplication
public class JhtaRestaurantsSnsServiceApplication {

    Logger logger = Logger.getLogger(JhtaRestaurantsSnsServiceApplication.class);

    public static void main(String[] args) {
        SpringApplication.run(JhtaRestaurantsSnsServiceApplication.class, args);
    }

    @Bean
    public CommandLineRunner userJsonExample() {
        return args -> {
            User user = new User("john_doe", "password123", "John Doe", "john@example.com", "1234567890", new Date(), "Male", User.TYPE.CUSTOMER);
            user.setId(1000);
            user.addRole(new Role(user, "ROLE_CUSTOMER"));

            ObjectMapper objectMapper = new ObjectMapper();
            String userJson = objectMapper.writeValueAsString(user);

            logger.info(userJson);
        };
    }

}
