
package com.Dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.javaBean.Case;
import com.javaBean.News;
import com.jdbc.impl.TransManager;
import com.util.Pagination;

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

	public List<Case> getListByPage(String currentPage,int PageSize) {
		List<Case> list = new ArrayList<Case>();
		try {
			String sql = "select count(*) from t_case";
			TransManager.BeginTrans();
			ResultSet rs = TransManager.excute(sql);
			if(rs.next()){
				Pagination.init(currentPage,rs.getInt(1),PageSize);
			}else
				return null;
			StringBuffer pageSQL = new StringBuffer("select * from t_case limit ");
			pageSQL.append(Pagination.beginIndex);
			pageSQL.append(",");
			pageSQL.append(Pagination.pageSize);
			ResultSet rsByPage = TransManager.excute(pageSQL.toString());
			while (rsByPage.next()) {
				Case Case = new Case();
				Case.setCase3DPath(rsByPage.getString("CASE_3D_PATH"));
				Case.setCase3DSize(rsByPage.getString("CASE_3D_SIZE"));//
				Case.setCaseScreenshot1(rsByPage.getString("CASE_SCREENSHOT1"));
				Case.setCaseScreenshot2(rsByPage.getString("CASE_SCREENSHOT2"));
				Case.setCaseScreenshot3(rsByPage.getString("CASE_SCREENSHOT3"));
				Case.setCaseScreenshot4(rsByPage.getString("CASE_SCREENSHOT4"));
				Case.setCaseScreenshot5(rsByPage.getString("CASE_SCREENSHOT5"));
				Case.setCaseCustomer(rsByPage.getString("CASE_CUSTOMER"));
				Case.setCaseId(String.valueOf(rsByPage.getInt("Case_ID")));
				Case.setCaseIntroduction(rsByPage.getString("CASE_INTRODUCTION"));
				Case.setCasePublishTime(rsByPage.getDate("CASE_PUBLISH_TIME"));
				Case.setCaseRARPath(rsByPage.getString("CASE_RAR_PATH"));
				Case.setCaseRARSize(rsByPage.getString("CASE_RAR_SIZE"));
				Case.setCaseTitle(rsByPage.getString("CASE_TITLE"));
				Case.setCaseStar(rsByPage.getInt("CASE_STAR"));
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
