package kr.co.jhta.restaurants_service.vo.socials;

import lombok.Getter;
import lombok.Setter;
import org.apache.ibatis.type.Alias;
import org.springframework.data.annotation.Id;

@Getter @Setter
@Alias("FollowRequests")
public class FollowRequests {

    @Id
    private int id;
    private int senderId;
    private int recipientId;
    private RequestStatus status;

    public FollowRequests() {
    }

    public FollowRequests(int senderId, int recipientId) {
        this.senderId = senderId;
        this.recipientId = recipientId;
        this.status = RequestStatus.PENDING;
    }

    public enum RequestStatus {
        PENDING, ACCEPTED, DECLINED
    }
}
