package vn.com.vti.bus.backend.form;

import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;

public class BusForm {
	@NotNull
	@Min(1)
	@Max(999)
	private Integer rowNum;
	@NotNull
	@Min(1)
	private Integer columnNum;
	@NotBlank
	private String numberPlace;
	@NotBlank
	@Pattern(regexp = "^\\d\\d$",message = "{error.num2digit}")
	private String numberDivision;
	@NotBlank
	@Pattern(regexp = "^[\\u3041-\\u3096]$",message = "{error.hiragana1digit}")
	private String numberKana;
	@NotBlank
	@Pattern(regexp = "^\\d\\d$",message = "{error.num2digit}")
	private String numberFirstHalf;
	@NotBlank
	@Pattern(regexp = "^\\d\\d$",message = "{error.num2digit}")
	private String numberLatterHalf;

	public Integer getRowNum() {
		return rowNum;
	}
	public void setRowNum(Integer rowNum) {
		this.rowNum = rowNum;
	}
	public Integer getColumnNum() {
		return columnNum;
	}
	public void setColumnNum(Integer columnNum) {
		this.columnNum = columnNum;
	}
	public String getNumberPlace() {
		return numberPlace;
	}
	public void setNumberPlace(String numberPlace) {
		this.numberPlace = numberPlace;
	}
	public String getNumberDivision() {
		return numberDivision;
	}
	public void setNumberDivision(String numberDivision) {
		this.numberDivision = numberDivision;
	}
	public String getNumberFirstHalf() {
		return numberFirstHalf;
	}
	public void setNumberFirstHalf(String numberFirstHalf) {
		this.numberFirstHalf = numberFirstHalf;
	}
	public String getNumberLatterHalf() {
		return numberLatterHalf;
	}
	public void setNumberLatterHalf(String numberLatterHalf) {
		this.numberLatterHalf = numberLatterHalf;
	}
	public String getNumberKana() {
		return numberKana;
	}
	public void setNumberKana(String numberKana) {
		this.numberKana = numberKana;
	}
}
