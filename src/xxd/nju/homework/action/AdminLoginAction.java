package xxd.nju.homework.action;

import xxd.nju.homework.model.UserBean;

public class AdminLoginAction extends LoginAction {

	/**
	 * 
	 */
	private static final long serialVersionUID = -3598876081847081572L;

	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		UserBean result = this.executeLogin();
		if (result == null || !result.getPosition().equals("admin")) 
			return "FAIL";
		else
			return "SUCCESS";
	}

}
