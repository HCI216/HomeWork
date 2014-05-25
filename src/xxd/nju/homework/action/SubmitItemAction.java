package xxd.nju.homework.action;

import java.util.Map;

import xxd.nju.homework.service.ProjectService;

public class SubmitItemAction extends BaseAction {

	/**
	 * 
	 */
	private static final long serialVersionUID = 274682191197706134L;
	private ProjectService projectService;
	
	public String execute() throws Exception{
		int projectID = Integer.parseInt(request.getParameter("submitProjectID"));
		String userID = (String) request.getSession().getAttribute("loginNormalUser");
		request.setAttribute("project",projectService.getProjectByRowANDUserID(userID, projectID));
		return "SUCCESS";
	}

	public ProjectService getProjectService() {
		return projectService;
	}

	public void setProjectService(ProjectService projectService) {
		this.projectService = projectService;
	}
	
	
	
}
