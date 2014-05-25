package xxd.nju.homework.action;

import java.util.HashMap;

import xxd.nju.homework.model.ProjectBean;
import xxd.nju.homework.model.UserBean;
import xxd.nju.homework.service.ProjectService;

public class AddProjectAction extends BaseAction {

	private ProjectService projectService;

	public String execute() throws Exception {
		String hostID = request.getParameter("hostID");
		String budget = request.getParameter("budget");
		String date = request.getParameter("projectDate");
		String device = request.getParameter("device");
		String food = request.getParameter("food");
		String transportation = request.getParameter("transportation");
		if (hostID.equals(""))
			return "FAIL";
		if (budget.equals(""))
			return "FAIL";
		if (date.equals(""))
			return "FAIL";
		ProjectBean projectBean = new ProjectBean();
		String op = "NO";
		if (device != null)
			op = "YES";
		projectBean.setSubmitDevice(op);
		op = "NO";
		if (food != null)
			op = "YES";
		projectBean.setSubmitFood(op);
		op = "NO";
		if (transportation != null)
			op = "YES";
		projectBean.setSubmitTransportation(op);
		projectBean.setProjectHostID(hostID);
		projectBean.setBudget(Double.parseDouble(budget));
		projectBean.setProjectDate(date);
		projectBean.setProjectState("BEGIN");
		projectService.addProject(projectBean);
		return "SUCCESS";
	}

	public ProjectService getProjectService() {
		return projectService;
	}

	public void setProjectService(ProjectService projectService) {
		this.projectService = projectService;
	}

}
