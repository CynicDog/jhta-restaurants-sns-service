package kr.co.jhta.restaurants_service.projection;

public class Projection {

    public static class UserProjection {
        private int id;
        private String username;
        private String email;
        private String nickname;

        public UserProjection(int id, String username, String email, String nickname) {
            this.id = id;
            this.username = username;
            this.email = email;
            this.nickname = nickname;
        }

        public int getId() {
            return id;
        }

        public String getUsername() {
            return username;
        }

        public String getEmail() {
            return email;
        }

        public String getNickname() {
            return nickname;
        }
    }
}
