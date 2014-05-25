package xxd.nju.homework.action;

import java.util.Map;

import xxd.nju.homework.model.ProjectBean;
import xxd.nju.homework.service.ProjectService;

public class DeleteProjectAction extends BaseAction {

	/**
	 * 
	 */
	private static final long serialVersionUID = -1181753540094873013L;
	private ProjectService projectService;

	public String execute() throws Exception {
		System.out.println("hello");
		String deleteProjectID = request.getParameter("deleteProjectID");
		String currentPage = request.getParameter("currentPage");
		ProjectBean projectBean = null;
		int page = 1;
		if (deleteProjectID != null)
			projectBean = projectService.getProjectBeanByRowNum(Integer
					.parseInt(deleteProjectID));
		if(currentPage != null)
			page = Integer.parseInt(currentPage);
		if(projectBean != null)
			projectService.deleteProject(projectBean);
		request.setAttribute("currentPage", page);
		return "SUCCESS";
	}

	public ProjectService getProjectService() {
		return projectService;
	}

	public void setProjectService(ProjectService projectService) {
		this.projectService = projectService;
	}

}
