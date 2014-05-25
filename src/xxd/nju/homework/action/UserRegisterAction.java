package xxd.nju.homework.action;

import java.util.Map;

import xxd.nju.homework.model.UserBean;
import xxd.nju.homework.service.UserService;


public class UserRegisterAction extends BaseAction {

	/**
	 * 
	 */
	private static final long serialVersionUID = -8276426372494370399L;
	private UserService userService;
	
	public String execute() throws Exception{
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String comfirmPassword = request.getParameter("comfirmpassword");
		String cardNumber = request.getParameter("cardNumber");
		String position = request.getParameter("identity");
		if(username == null || password == null || comfirmPassword == null || cardNumber == null || position == null) return "FAIL";
		if(!password.equals(comfirmPassword)) return "FAIL";
		if(cardNumber.length() != 7) return "FAIL";
		UserBean userBean = new UserBean();
		userBean.setUsername(username);
		userBean.setPassword(password);
		userBean.setCardNumber(cardNumber);
		userBean.setPosition(position);
		userService.addUser(userBean);
		return "SUCCESS";
	}

	public UserService getUserService() {
		return userService;
	}

	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	
}
