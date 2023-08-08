package kr.co.jhta.restaurants_service.vo.user;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;

@Getter @Setter
@Table(name = "ROLES")
@Entity
public class Role {

    @Id @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "user_id", nullable = false)
    private User user;
    private String role;

    public Role(User user, String role) {
        this.user = user;
        this.role = role;
    }

    public Role() {
    }
}
