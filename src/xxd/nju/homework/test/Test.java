package xxd.nju.homework.test;

import xxd.nju.homework.dao.UserDao;
import xxd.nju.homework.dao.impl.UserDaoImpl;

public class Test {
	public static void main(String[] args) {
		UserDao userDao = new UserDaoImpl();
		System.out.println(userDao.getUseMoney("U0002"));
	}
}
