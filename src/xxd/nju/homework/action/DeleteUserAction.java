package xxd.nju.homework.action;

import org.springframework.dao.support.DaoSupport;

import xxd.nju.homework.model.UserBean;
import xxd.nju.homework.service.UserService;

public class DeleteUserAction extends BaseAction {

	/**
	 * 
	 */
	private static final long serialVersionUID = 5265981822207457990L;

	private UserService userService;

	public String execute() throws Exception {
		System.out.println("hello");
		String deleteUserID = request.getParameter("deleteUserID");
		String currentPage = request.getParameter("currentPage");
		UserBean userBean = null;
		int page = 1;
		if (deleteUserID != null)
			userBean = userService.getUserBeanByRowNum(Integer
					.parseInt(deleteUserID));
		if(currentPage != null)
			page = Integer.parseInt(currentPage);
		if(userBean != null)
			userService.deleteUser(userBean);
		request.setAttribute("currentPage", page);
		return "SUCCESS";
	}

	public UserService getUserService() {
		return userService;
	}

	public void setUserService(UserService userService) {
		this.userService = userService;
	}
}
