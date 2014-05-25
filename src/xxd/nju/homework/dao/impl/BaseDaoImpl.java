package xxd.nju.homework.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import xxd.nju.homework.dao.BaseDao;

public class BaseDaoImpl implements BaseDao {

	private static BaseDaoImpl baseDao = new BaseDaoImpl();
	
	@Override
	public Connection getConnection() {
		// TODO Auto-generated method stub
		return null;
	}
	
	public static BaseDaoImpl getBaseDaoInstance()
	{
		return baseDao;
	}
	
	@Override
	public void closeConnection(Connection con) {
		// TODO Auto-generated method stub

	}

	@Override
	public void closePreparedStatement(PreparedStatement stmt) {
		// TODO Auto-generated method stub

	}

	@Override
	public void closeResult(ResultSet result) {
		// TODO Auto-generated method stub

	}

}
