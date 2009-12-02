package com.jdbc.impl;


import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.DriverManager;
import java.sql.Statement;

import com.jdbc.DBConnection;

public class MyConnection implements DBConnection {
	
	String DBDIVER = "com.mysql.jdbc.Driver";
	String DBUSER = "root";
	String DBPASSWORD = "123456";
	String DBURL = "jdbc:mysql://localhost:3306/chujing";
	private Connection conn;
	private Statement stmt;
	private Object objId;
	private boolean isClosed = false;
	
	public MyConnection(Object obj){
		this.objId  = obj;
	}
	public ResultSet excute(String sql) throws SQLException{
		return this.stmt.executeQuery(sql);
	}
	
	public int update(String sql) throws SQLException{
		return this.stmt.executeUpdate(sql);
	}
	@Override
	public void BeginTransaction(Object obj) throws SQLException {
		try {
			if(this.objId ==obj && this.conn != null && !this.conn.isClosed()){
				this.conn.setAutoCommit(false);
			}
		} catch (SQLException e) {
			throw new SQLException("��ʼ����ʧ��"+obj.getClass().getName()+e);
		}
	}

	@Override
	public void close(Object obj) throws SQLException {
		try{
			if(this.objId == obj && this.conn != null && !this.conn.isClosed()){
				this.conn.close();
				this.isClosed = true;
			}
		}catch(SQLException e){
			throw new SQLException("�ر���ݿ�����ʧ��"+obj.getClass().getName()+e);
		}
	}

	@Override
	public void commit(Object obj) throws SQLException {
		try{
			if(this.objId == obj && this.conn != null && !this.conn.isClosed()){
				this.conn.commit();
			}
		}catch(SQLException e){
			throw new SQLException("�ύ����ʧ��" + this.objId.getClass().getName()+e);
		}
	}

	@Override
	public void getConnection(Object obj) throws SQLException, ClassNotFoundException {
		try {
			if (this.objId == obj && this.conn != null && !this.isClosed()){
				return ;
			}else{
				Class.forName(this.DBDIVER);
				this.conn = DriverManager.getConnection(this.DBURL,this.DBUSER,this.DBPASSWORD);
				this.stmt = this.conn.createStatement();
			}
		} catch (SQLException e) {
			throw new SQLException("��ȡ��ݿ�����ʧ��"+obj.getClass().getName() + e);
		}
		return ;
	}

	@Override
	public void rollback(Object obj) throws SQLException {
		try{
			if(this.objId == obj && this.conn != null&& !this.conn.isClosed()){
				this.conn.rollback();
			}
		}catch(SQLException e){
			throw new SQLException("����ع�ʧ��"+obj.getClass().getName()+e);
		}
	}

	public boolean isClosed(){
		return isClosed;
	}
}
