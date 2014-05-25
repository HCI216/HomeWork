package xxd.nju.homework.model;

import java.io.Serializable;

public class UserBean implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -4581993736942004682L;
	private String userID;
	private String username;
	private String password;
	private String cardNumber;
	private String position;

	public String getUserID() {
		return userID;
	}

	public void setUserID(String userID) {
		this.userID = userID;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getCardNumber() {
		return cardNumber;
	}

	public void setCardNumber(String cardNumber) {
		this.cardNumber = cardNumber;
	}

	public String getPosition() {
		return position;
	}

	public void setPosition(String position) {
		this.position = position;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

}
