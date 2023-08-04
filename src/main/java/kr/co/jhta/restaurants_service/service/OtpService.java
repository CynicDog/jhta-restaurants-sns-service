package kr.co.jhta.restaurants_service.service;

import kr.co.jhta.restaurants_service.controller.command.OtpCommand;
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

    public Otp issueOtp(String email) {

        Otp otp = new Otp(email);
        otp.setOtpCode(OtpGenerator.generateCode());

        otpMapper.insert(otp);
        emailSender.sendEmail(email, otp.getOtpCode());

        return otp;
    }

    public Otp renewOtp(String email) {

        Otp otp = otpMapper.findByUserId(email);
        otp.setOtpCode(OtpGenerator.generateCode());

        otpMapper.update(otp);

        return otp;
    }

    public void invalidateOtp(Otp otp) {

        otpMapper.delete(otp);
    }

    public boolean validateOtp(OtpCommand otpCommand) {
        Otp otp = new Otp(otpCommand.getEmail(), otpCommand.getOtpCode());

        return otpMapper.validateByEmail(otp);
    }
}
