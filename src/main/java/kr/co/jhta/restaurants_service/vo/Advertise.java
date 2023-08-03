package kr.co.jhta.restaurants_service.vo;

import java.util.Date;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class Advertise {
	
	private int id;
	private int storeId;
	private String subscribed;
	private String succeeded;
	private Date challengeStartDate;
	private Date challengeEndDate;
	private Date succeededStartDate;
	private Date succeededEndDate;
	private String disabled;

}
