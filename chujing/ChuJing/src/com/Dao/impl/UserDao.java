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
}
