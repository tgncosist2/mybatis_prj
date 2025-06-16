package day0616;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class CarDomain {
	private int price;
	private String car_option;
	private Date hiredate;
	private String model;
	private String car_year;
}
