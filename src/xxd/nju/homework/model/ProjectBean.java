package xxd.nju.homework.model;

import java.io.Serializable;

public class ProjectBean implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 5196627191015371538L;
	private String projectID;
	private String projectHostID;
	private Double budget;
	private String projectState;
	private String projectDate;
	private String submitFood;
	private String submitTransportation;
	private String submitDevice;

	public String getProjectID() {
		return projectID;
	}

	public String getProjectHostID() {
		return projectHostID;
	}

	public void setProjectHostID(String projectHostID) {
		this.projectHostID = projectHostID;
	}

	public void setProjectID(String projectID) {
		this.projectID = projectID;
	}

	
	public Double getBudget() {
		return budget;
	}

	public void setBudget(Double budget) {
		this.budget = budget;
	}

	public String getProjectState() {
		return projectState;
	}

	public void setProjectState(String projectState) {
		this.projectState = projectState;
	}

	public String getProjectDate() {
		return projectDate;
	}

	public void setProjectDate(String projectDate) {
		this.projectDate = projectDate;

	}

	public String getSubmitFood() {
		return submitFood;
	}

	public void setSubmitFood(String submitFood) {
		this.submitFood = submitFood;
	}

	public String getSubmitTransportation() {
		return submitTransportation;
	}

	public void setSubmitTransportation(String submitTransportation) {
		this.submitTransportation = submitTransportation;
	}

	public String getSubmitDevice() {
		return submitDevice;
	}

	public void setSubmitDevice(String submitDevice) {
		this.submitDevice = submitDevice;
	}

}
