package xxd.nju.homework.action;

import xxd.nju.homework.service.ProjectService;


public class ModifyProjectAction extends BaseAction {
	
	private ProjectService projectService ;
	
	public String execute() throws Exception{
		String rowNum = request.getParameter("modifyProjectID");
		int num = 0;
		if (rowNum != null)
			num = Integer.parseInt(rowNum);
		request.setAttribute("modifyproject", projectService.getProjectBeanByRowNum(num));
		request.setAttribute("projectRow", rowNum);
		return "SUCCESS";
	}

	public ProjectService getProjectService() {
		return projectService;
	}

	public void setProjectService(ProjectService projectService) {
		this.projectService = projectService;
	}
}
