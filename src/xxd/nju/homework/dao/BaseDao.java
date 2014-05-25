package xxd.nju.homework.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public interface BaseDao {
	/*
	 * ��TOMCAT����Դ�õ����Ӷ���
	 */
	public Connection getConnection();

	/*
	 * �ر�Connection����,�����ݿ����ӷŻص����ӳ���
	 */
	public void closeConnection(Connection con);

	/*
	 * �ر�PreparedStatement����
	 */
	public void closePreparedStatement(PreparedStatement stmt);

	/*
	 * �ر�ResultSet����
	 */
	public void closeResult(ResultSet result);
}
