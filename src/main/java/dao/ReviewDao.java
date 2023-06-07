package dao;

import utils.DaoHelper;
import vo.Review;

public class ReviewDao {

	public Review getReviewById(int id) {
		return DaoHelper.selectOne("", rs -> {
			Review review = new Review(
					rs.getInt(1),
					rs.getInt(2),
					rs.getString(3),
					rs.getDate(4),
					rs.getDate(5),
					rs.getInt(6),
					rs.getInt(7));
			
			return review;
		}, id);
	}
}
