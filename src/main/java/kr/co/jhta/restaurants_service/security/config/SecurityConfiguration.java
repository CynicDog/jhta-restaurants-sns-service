package kr.co.jhta.restaurants_service.security.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;

@Configuration
public class SecurityConfiguration {

    @Autowired
    private AuthenticationFailureHandler authenticationFailureHandler;

    @Bean
    public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {

        return http
                .csrf().disable()

                .authorizeRequests(urlRegistry -> {

                    // TODO: authentication specification on urls later to be configured

                    urlRegistry.antMatchers("/customer/my-page").authenticated();
                    urlRegistry.antMatchers("/owner/my-page").authenticated();
                    urlRegistry.anyRequest().permitAll();
                })

                .formLogin(config -> {
                    config.loginPage("/user/login");
                    config.usernameParameter("username");
                    config.passwordParameter("password");
                    config.loginProcessingUrl("/user/login");
                    config.defaultSuccessUrl("/");
//                    config.failureUrl("/user/login?error=fail");
                    config.failureHandler(authenticationFailureHandler);
                })

                .logout(config -> {
                    config.logoutUrl("/user/logout");
                    config.logoutSuccessUrl("/");
                    config.invalidateHttpSession(true);
                })

                .exceptionHandling(config -> {
                    config.authenticationEntryPoint(((request, response, authException) -> {
                        response.sendRedirect("/user/login?error=anonymous");
                    }));
                    config.accessDeniedHandler(((request, response, accessDeniedException) -> {
                        response.sendRedirect("user/login?error=denied");
                    }));
                })

                .build();
    }

    @Bean
    public BCryptPasswordEncoder bCryptPasswordEncoder() {
        return new BCryptPasswordEncoder();
    }
}
