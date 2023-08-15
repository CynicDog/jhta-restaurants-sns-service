package kr.co.jhta.restaurants_service.vo.store;

import org.apache.ibatis.type.Alias;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
@Getter @Setter
@Alias("Food")
@Entity
@Table(name = "FOODS")
public class Food {

	@Id @GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	private String name;
	private int price;

	@ManyToOne
	@JoinColumn(name = "store_id", nullable = false)
	private Store store;

	public Food() {
	}

	public Food(String name, int price) {
		this.name = name;
		this.price = price;
	}
}
