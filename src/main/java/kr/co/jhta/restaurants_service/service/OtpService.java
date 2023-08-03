package kr.co.jhta.restaurants_service.service;

import kr.co.jhta.restaurants_service.mapper.OtpMapper;
import kr.co.jhta.restaurants_service.util.EmailSender;
import kr.co.jhta.restaurants_service.util.OtpGenerator;
import kr.co.jhta.restaurants_service.vo.Otp;
import org.springframework.stereotype.Service;

@Service
public class OtpService {

    private final EmailSender emailSender;
    private final OtpMapper otpMapper;

    public OtpService(EmailSender emailSender, OtpMapper otpMapper) {
        this.emailSender = emailSender;
        this.otpMapper = otpMapper;
    }

    public Otp issueOtp(int userId) {

        Otp otp = new Otp(userId);
        otp.setOtpCode(OtpGenerator.generateCode());

        otpMapper.insert(otp);

        return otp;
    }

    public Otp renewOtp(int userId) {

        Otp otp = otpMapper.findByUserId(userId);
        otp.setOtpCode(OtpGenerator.generateCode());

        otpMapper.update(otp);

        return otp;
    }

    public void invalidateOtp(Otp otp) {

        otpMapper.delete(otp);
    }
}
