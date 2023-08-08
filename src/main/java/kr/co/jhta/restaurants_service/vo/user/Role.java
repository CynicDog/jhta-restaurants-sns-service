package kr.co.jhta.restaurants_service.vo.user;

import lombok.Getter;
import lombok.Setter;
import org.springframework.data.annotation.Id;
import org.springframework.data.relational.core.mapping.Column;
import org.springframework.data.relational.core.mapping.Table;

@Getter @Setter
@Table("ROLES")
public class Role {

    @Id
    private int id;

    private User user;
    private String role;

    public Role(User user, String role) {
        this.user = user;
        this.role = role;
    }

    public Role() {
    }
}
