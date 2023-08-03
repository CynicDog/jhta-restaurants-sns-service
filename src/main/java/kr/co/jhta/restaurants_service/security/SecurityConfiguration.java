package kr.co.jhta.restaurants_service.security;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.web.SecurityFilterChain;

@Configuration
public class SecurityConfiguration {

    @Bean
    public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {

        return http
                .csrf().disable()

                .authorizeRequests(urlRegistry -> {

                    // TODO: authentication specification on urls later to be configured
                    urlRegistry.anyRequest().permitAll();
//                    urlRegistry.antMatchers("/user/my-page").authenticated();
//                    urlRegistry.antMatchers("/article/add").authenticated();
//                    urlRegistry.antMatchers("/article/leave-comment").authenticated();
                })

                .formLogin(config -> {
                    config.loginPage("/user/login");
                    config.usernameParameter("username");
                    config.passwordParameter("password");
                    config.loginProcessingUrl("/user/login");
                    config.defaultSuccessUrl("/");
                    config.failureUrl("/user/login?error=fail");
                })

                .logout(config -> {
                    config.logoutUrl("/user/logout");
                    config.logoutSuccessUrl("/");
                    config.invalidateHttpSession(true);
                })

                .exceptionHandling(config -> {
                    config.authenticationEntryPoint(((request, response, authException) -> {
                        response.sendRedirect("/user/login?error=denied");
                    }));
                    config.accessDeniedHandler(((request, response, accessDeniedException) -> {
                        response.sendRedirect("user/login?error=forbidden");
                    }));
                })

                .build();
    }
}
