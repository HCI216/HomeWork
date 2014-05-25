package xxd.nju.homework.action;

import java.util.Map;

import xxd.nju.homework.model.UserBean;
import xxd.nju.homework.service.UserService;

public class ModifyUserAction extends BaseAction {

	/**
	 * 
	 */
	private static final long serialVersionUID = 8655716016525355788L;

	private UserService userService;

	public String execute() throws Exception {
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String comfirmPassword = request.getParameter("comfirmpassword");
		String cardNumber = request.getParameter("cardNumber");
		String position = request.getParameter("identity");
		String modify = request.getParameter("modifyUserID");
		System.out.println("0");
		if (modify == null)
			return "FAIL";
		int pp = Integer.parseInt(modify);
		request.setAttribute("modifyUserID", pp);
		UserBean userBean = userService.getUserBeanByRowNum(pp);
		request.setAttribute("modifyuser", userBean);
		System.out.println("1");
		if ((password != null && comfirmPassword == null)
				|| (password == null && comfirmPassword != null)
				|| !password.equals(comfirmPassword))
			return "FAIL";
		if (!username.equals(""))
			userBean.setUsername(username);
		if (!password.equals(""))
			userBean.setPassword(password);
		if (!cardNumber.equals(""))
			userBean.setCardNumber(cardNumber);
		if (!position.equals(""))
			userBean.setPosition(position);
		System.out.println("2");
		userService.updateUser(userBean);
		return "SUCCESS";
	}

	public UserService getUserService() {
		return userService;
	}

	public void setUserService(UserService userService) {
		this.userService = userService;
	}

}
