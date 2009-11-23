package com.Dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.javaBean.Case;
import com.jdbc.impl.TransManager;

public class CaseDao {
	public List<Case> getListBySQL(String sql) {
		List<Case> list = new ArrayList<Case>();
		try {
			TransManager.BeginTrans();
			ResultSet rs = TransManager.excute(sql);
			while (rs.next()) {
				Case Case = new Case();
				Case.setCase3DPath(rs.getString("CASE_3D_PATH"));
				Case.setCase3DSize(rs.getString("CASE_3D_SIZE"));//
				Case.setCaseScreenshot1(rs.getString("CASE_SCREENSHOT1"));
				Case.setCaseScreenshot2(rs.getString("CASE_SCREENSHOT2"));
				Case.setCaseScreenshot3(rs.getString("CASE_SCREENSHOT3"));
				Case.setCaseScreenshot4(rs.getString("CASE_SCREENSHOT4"));
				Case.setCaseScreenshot5(rs.getString("CASE_SCREENSHOT5"));
				Case.setCaseCustomer(rs.getString("CASE_CUSTOMER"));
				Case.setCaseId(String.valueOf(rs.getInt("Case_ID")));
				Case.setCaseIntroduction(rs.getString("CASE_INTRODUCTION"));
				Case.setCasePublishTime(rs.getDate("CASE_PUBLISH_TIME"));
				Case.setCaseRARPath(rs.getString("CASE_RAR_PATH"));
				Case.setCaseRARSize(rs.getString("CASE_RAR_SIZE"));
				Case.setCaseTitle(rs.getString("CASE_TITLE"));
				Case.setCaseStar(rs.getInt("CASE_STAR"));
				list.add(Case);
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

	public Case getByID(String ID) {
		Case Case = new Case();
		try {
			TransManager.BeginTrans();
			StringBuffer sql = new StringBuffer(
					"select * from t_case where CASE_ID=");
			sql.append(ID);
			ResultSet rs = TransManager.excute(sql.toString());
			if (rs.next()) {
				Case.setCase3DPath(rs.getString("CASE_3D_PATH"));
				Case.setCase3DSize(rs.getString("CASE_3D_SIZE"));//
				Case.setCaseScreenshot1(rs.getString("CASE_SCREENSHOT1"));
				Case.setCaseScreenshot2(rs.getString("CASE_SCREENSHOT2"));
				Case.setCaseScreenshot3(rs.getString("CASE_SCREENSHOT3"));
				Case.setCaseScreenshot4(rs.getString("CASE_SCREENSHOT4"));
				Case.setCaseScreenshot5(rs.getString("CASE_SCREENSHOT5"));
				Case.setCaseCustomer(rs.getString("CASE_CUSTOMER"));
				Case.setCaseId(String.valueOf(rs.getInt("Case_ID")));
				Case.setCaseIntroduction(rs.getString("CASE_INTRODUCTION"));
				Case.setCasePublishTime(rs.getDate("CASE_PUBLISH_TIME"));
				Case.setCaseRARPath(rs.getString("CASE_RAR_PATH"));
				Case.setCaseRARSize(rs.getString("CASE_RAR_SIZE"));
				Case.setCaseTitle(rs.getString("CASE_TITLE"));
				Case.setCaseStar(rs.getInt("CASE_STAR"));
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
		return Case;
	}
}
