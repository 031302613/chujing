package com.jdbc.impl;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.jdbc.DBConnection;

public class TransManager {
	private static DBConnection conn;
	private static Object obj = new Object();
	public static void BeginTrans() throws SQLException, ClassNotFoundException{
		conn  = new MyConnection(obj);
		conn.getConnection(obj);
		conn.BeginTransaction(obj);
	}
	public static void Commit(){
		try {
			conn.commit(obj);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public static void Rollback(){
		try {
			conn.rollback(obj);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public static void close(){
		try {
			conn.close(obj);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public static ResultSet excute(String sql) throws SQLException{
		return conn.excute(sql);
	}
}
