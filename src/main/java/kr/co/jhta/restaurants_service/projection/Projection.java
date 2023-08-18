package kr.co.jhta.restaurants_service.projection;

import kr.co.jhta.restaurants_service.vo.store.Store;

public class Projection {

    public static class Review {
        private int id;
        private int rating;
        private String content;
        private int likedCount;
        private Store store;

        public Review(int id, int rating, String content, int likedCount, Store store) {
            this.id = id;
            this.rating = rating;
            this.content = content;
            this.likedCount = likedCount;
            this.store = store;
        }

        public int getId() {
            return id;
        }

        public void setId(int id) {
            this.id = id;
        }

        public int getRating() {
            return rating;
        }

        public void setRating(int rating) {
            this.rating = rating;
        }

        public String getContent() {
            return content;
        }

        public void setContent(String content) {
            this.content = content;
        }

        public int getLikedCount() {
            return likedCount;
        }

        public void setLikedCount(int likedCount) {
            this.likedCount = likedCount;
        }

        public Store getStore() {
            return store;
        }

        public void setStore(Store store) {
            this.store = store;
        }
    }

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
