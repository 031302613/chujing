package com.jdbc.impl;


import java.sql.Connection;
import java.sql.SQLException;
import java.sql.DriverManager;

import com.jdbc.DBConnection;

public class MyConnection implements DBConnection {

	String DBDIVER;
	String DBUSER;
	String DBPASSWORD;
	String DBURL;
	private Connection conn;
	private Object objId;
	private boolean isClosed = false;
	
	public MyConnection(Object obj){
		this.objId  = obj;
	}
	@Override
	public void BeginTransaction(Object obj) throws SQLException {
		try {
			if(this.objId ==obj && this.conn != null && !this.conn.isClosed()){
				this.conn.setAutoCommit(false);
			}
		} catch (SQLException e) {
			throw new SQLException("开始事务失败"+obj.getClass().getName()+e);
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
			throw new SQLException("关闭数据库连接失败"+obj.getClass().getName()+e);
		}
	}

	@Override
	public void commit(Object obj) throws SQLException {
		try{
			if(this.objId == obj && this.conn != null && !this.conn.isClosed()){
				this.conn.commit();
			}
		}catch(SQLException e){
			throw new SQLException("提交事务失败" + this.objId.getClass().getName()+e);
		}
	}

	@Override
	public Connection getConnection(Object obj) throws SQLException, ClassNotFoundException {
		try {
			if (this.objId == obj && this.conn != null && !this.isClosed()){
				return conn;
			}else{
				Class.forName(this.DBDIVER);
				this.conn = DriverManager.getConnection(this.DBURL,this.DBUSER,this.DBPASSWORD);
			}
		} catch (SQLException e) {
			throw new SQLException("获取数据库连接失败"+obj.getClass().getName() + e);
		}
		return conn;
	}

	@Override
	public void rollback(Object obj) throws SQLException {
		try{
			if(this.objId == obj && this.conn != null&& !this.conn.isClosed()){
				this.conn.rollback();
			}
		}catch(SQLException e){
			throw new SQLException("事务回滚失败"+obj.getClass().getName()+e);
		}
	}

	public boolean isClosed(){
		return isClosed;
	}
}
