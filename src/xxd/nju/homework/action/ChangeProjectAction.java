package xxd.nju.homework.action;

import java.util.HashMap;

import xxd.nju.homework.model.ProjectBean;
import xxd.nju.homework.service.ProjectService;

public class ChangeProjectAction extends BaseAction {

	/**
	 * 
	 */
	private static final long serialVersionUID = 8655716016525355788L;
	private ProjectService projectService;

	public String execute() throws Exception {
		String hostID = request.getParameter("hostID");
		String budget = request.getParameter("budget");
		String date = request.getParameter("projectDate");
		String device = request.getParameter("device");
		String food = request.getParameter("food");
		String transportation = request.getParameter("transportation");
		String modify = request.getParameter("modifyProjectID");
		if (modify == null)
			return "FAIL";
		int pp = Integer.parseInt(modify);
		request.setAttribute("modifyProjectID", pp);
		ProjectBean projectBean = projectService.getProjectBeanByRowNum(pp);
		request.setAttribute("modifyproject", projectBean);
		System.out.println("1");
		if (!hostID.equals(""))
			projectBean.setProjectHostID(hostID);
		if (!budget.equals(""))
			projectBean.setBudget(Double.parseDouble(budget));
		if (!date.equals(""))
			projectBean.setProjectDate(date);
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
		projectService.updateProject(projectBean);
		return "SUCCESS";
	}

	public ProjectService getProjectService() {
		return projectService;
	}

	public void setProjectService(ProjectService projectService) {
		this.projectService = projectService;
	}

}
