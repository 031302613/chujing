package com.Dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.javaBean.User;
import com.jdbc.impl.TransManager;

public class UserDao {
	public List<User> getListBySQL(String sql) {
		List<User> list = new ArrayList<User>();
		try {
			TransManager.BeginTrans();
			ResultSet rs = TransManager.excute(sql);
			while (rs.next()) {
				User user = new User();
				user.setUserId(rs.getInt("USER_ID"));
				user.setUserName(rs.getString("USERNAME"));
				user.setPassword(rs.getString("PASSWORD"));
				list.add(user);
			}
			TransManager.Commit();
		} catch (SQLException e) {
			e.printStackTrace();
			TransManager.Rollback();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			TransManager.Rollback();
		} finally {
			TransManager.close();
		}
		return list;
	}

	public User getByID(String ID) {
		User user = new User();
		try {
			TransManager.BeginTrans();
			StringBuffer sql = new StringBuffer(
					"select * from t_user_info where USER_ID=");
			sql.append(ID);
			ResultSet rs = TransManager.excute(sql.toString());
			if (rs.next()) {
				user.setUserId(rs.getInt("USER_ID"));
				user.setUserName(rs.getString("USERNAME"));
				user.setPassword(rs.getString("PASSWORD"));
			}
			
			TransManager.Commit();
		} catch (SQLException e) {
			e.printStackTrace();
			TransManager.Rollback();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			TransManager.Rollback();
		} finally {
			TransManager.close();
		}
		return user;
	}
	
	public boolean isExistsUser(String userID){
		if(userID==null){
			return false;
		}
		boolean result=false;
		try {
			TransManager.BeginTrans();
			StringBuffer sql = new StringBuffer(
					"select * from t_user_info where USERNAME='");
			sql.append(userID);
			sql.append("'");
System.out.println(sql.toString());
			ResultSet rs = TransManager.excute(sql.toString());
			if (rs.next()) {
				result= true;
			}
			
			TransManager.Commit();
		} catch (SQLException e) {
			e.printStackTrace();
			TransManager.Rollback();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			TransManager.Rollback();
		} finally {
			TransManager.close();
			return result;
		}
		
	}
	
	public boolean isPassWordValite(String userId,String pwd){
		if(userId==null||pwd==null){
			return false;
		}
		boolean result=false;
		try {
			TransManager.BeginTrans();
			String sql="select * from t_user_info where USERNAME=\'";
			sql=sql+userId+"\' and PASSWORD =\'"+pwd+"\'";
			ResultSet rs = TransManager.excute(sql.toString());
			if (rs.next()) {
				result= true;
			}
			
			TransManager.Commit();
		} catch (SQLException e) {
			e.printStackTrace();
			TransManager.Rollback();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			TransManager.Rollback();
		} finally {
			TransManager.close();
			return result;
		}
			
	}
	
	public boolean EditPwd(String name,String pwd){
		if(name==null||name.length()==0||pwd==null||pwd.length()==0){
			return false;
		}
		boolean result=true;
		String sql="UPDATE T_USER_INFO " +
		"SET PASSWORD=\'"+pwd.trim()+"\'"+
				"WHERE USERNAME=\'" +name.trim()+"\'";
		try{
			TransManager.BeginTrans();
			if(TransManager.update(sql)==0){
				result=false;
			}else{
				TransManager.Commit();
			}
		}catch (SQLException e) {
			e.printStackTrace();
			TransManager.Rollback();
			result=false;
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			TransManager.Rollback();
			result=false;
		} finally {
			TransManager.close();
			return result;
		}
	}
	
}
