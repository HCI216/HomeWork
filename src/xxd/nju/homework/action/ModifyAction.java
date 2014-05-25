package xxd.nju.homework.action;

import xxd.nju.homework.service.UserService;

public class ModifyAction extends BaseAction {

	/**
	 * 
	 */
	private static final long serialVersionUID = -3970229226731733242L;
	private UserService userService;
	
	public String execute() throws Exception {
		String rowNum = request.getParameter("modifyUserID");
		int num = 0;
		if (rowNum != null)
			num = Integer.parseInt(rowNum);
		request.setAttribute("modifyuser", userService.getUserBeanByRowNum(num));
		request.setAttribute("userRow", rowNum);
		return "SUCCESS";
	}

	public UserService getUserService() {
		return userService;
	}

	public void setUserService(UserService userService) {
		this.userService = userService;
	}
}
