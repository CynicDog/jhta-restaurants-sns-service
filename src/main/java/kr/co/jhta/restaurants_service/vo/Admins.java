package kr.co.jhta.restaurants_service.vo;

import java.util.Date;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class Admins {

	private int id;
	private String username;
	private String password;
	private String fullname;
	private String email;
	private String phone;
	private Date birthday;
	private String gender;
	private Date createDate;
	private Date updateDate;

}
