package xxd.nju.homework.action;

import javax.servlet.http.HttpSession;

import xxd.nju.homework.model.UserBean;

public class AdminLoginAction extends LoginAction {

	/**
	 * 
	 */
	private static final long serialVersionUID = -3598876081847081572L;

	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();

		UserBean result = this.executeLogin();
		if (result == null || !result.getPosition().equals("admin")) {
			String error = "please check your username or password!";
			session.setAttribute("error", error);
			return "FAIL";
		} else {
			session.setAttribute("result", result);
			session.removeAttribute("error");

			return "SUCCESS";
		}
	}

}
