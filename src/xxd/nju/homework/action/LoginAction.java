package xxd.nju.homework.action;

import xxd.nju.homework.model.UserBean;
import xxd.nju.homework.service.UserService;

public abstract class LoginAction extends BaseAction {

	/**
	 * 
	 */
	private static final long serialVersionUID = -8971443526514592959L;
	private UserService userService;

	public abstract String execute() throws Exception;
	
	public UserBean executeLogin(){
		UserBean userBean = new UserBean();
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		userBean.setUsername(username);
		userBean.setPassword(password);
		return this.getUserService().login(userBean);
	}

	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	public UserService getUserService() {
		return userService;
	}

}
