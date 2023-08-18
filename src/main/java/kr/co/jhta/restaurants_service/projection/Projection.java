package kr.co.jhta.restaurants_service.projection;

public class Projection {

    public static class Post {
        private int id;
        private String title;
        private String subTitle;

        public Post(int id, String title, String subTitle) {
            this.id = id;
            this.title = title;
            this.subTitle = subTitle;
        }

        public int getId() {
            return id;
        }

        public void setId(int id) {
            this.id = id;
        }

        public String getTitle() {
            return title;
        }

        public void setTitle(String title) {
            this.title = title;
        }

        public String getSubTitle() {
            return subTitle;
        }

        public void setSubTitle(String subTitle) {
            this.subTitle = subTitle;
        }
    }

    public static class User {
        private int id;
        private String username;
        private String email;
        private String nickname;

        public User(int id, String username, String email, String nickname) {
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
