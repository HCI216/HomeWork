package xxd.nju.homework.model;

import java.io.Serializable;

public class SubmitItemBean implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 110939140923046493L;
	private String submitItemID;
	private String participateID;
	private String submitItem;
	private double useMoney;
	private String submitState;

	public String getSubmitItemID() {
		return submitItemID;
	}

	public void setSubmitItemID(String submitItemID) {
		this.submitItemID = submitItemID;
	}

	public String getParticipateID() {
		return participateID;
	}

	public void setParticipateID(String participateID) {
		this.participateID = participateID;
	}

	public double getUseMoney() {
		return useMoney;
	}

	public void setUseMoney(double useMoney) {
		this.useMoney = useMoney;
	}
	
	public String getSubmitState() {
		return submitState;
	}

	public void setSubmitState(String submitState) {
		this.submitState = submitState;
	}

	public String getSubmitItem() {
		return submitItem;
	}

	public void setSubmitItem(String submitItem) {
		this.submitItem = submitItem;
	}	
}
