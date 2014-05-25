package xxd.nju.homework.model;

import java.io.Serializable;

public class ParticipateBean implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -7441135012314778540L;
	private String participateID;
	private String projectID;
	private String userID;
	private double giveMoney;
	
	public String getParticipateID() {
		return participateID;
	}
	public void setParticipateID(String participateID) {
		this.participateID = participateID;
	}
	public String getProjectID() {
		return projectID;
	}
	public void setProjectID(String projectID) {
		this.projectID = projectID;
	}
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	public double getGiveMoney() {
		return giveMoney;
	}
	public void setGiveMoney(double giveMoney) {
		this.giveMoney = giveMoney;
	}
	
}
