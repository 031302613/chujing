
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

	public List<Case> getListByPageAndCond(String cond,String currentPage,int PageSize) {
		List<Case> list = new ArrayList<Case>();
		try {
			String sql = "select count(*) from t_case where 1=1 "+cond;
			TransManager.BeginTrans();
			ResultSet rs = TransManager.excute(sql);
			if(rs.next()){
				Pagination.init(currentPage,rs.getInt(1),PageSize);
			}else
				return null;
			
			StringBuffer pageSQL = new StringBuffer("select * from t_case where 1=1 "+cond+ " order by case_publish_time desc limit ");
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
				Case.setCaseId(String.valueOf(rsByPage.getInt("CASE_ID")));
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
			list=null;
			e.printStackTrace();
			TransManager.Rollback();
		} catch (ClassNotFoundException e) {
			list=null;
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
			StringBuffer pageSQL = new StringBuffer("select * from t_case order by case_publish_time desc limit ");
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
				Case.setCaseId(String.valueOf(rsByPage.getInt("CASE_ID")));
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
	
	public boolean DeleteCase(String id){
		if(id==null||id.length()==0){
			return false;
		}
		boolean result=true;
		String sql="DELETE FROM T_CASE WHERE CASE_ID=\'" +id+"\'";
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
	
	@SuppressWarnings("finally")
	public boolean AddCase(String title,String content,String customer,int star,List<String> filenames,int RARSize,int Unity3DSize){
		boolean result=true;
		StringBuffer sql= new StringBuffer("INSERT INTO T_CASE(CASE_TITLE,CASE_INTRODUCTION,CASE_CUSTOMER,CASE_PUBLISH_TIME,CASE_STAR,CASE_3D_SIZE,CASE_RAR_SIZE,CASE_3D_PATH,CASE_RAR_PATH,CASE_SCREENSHOT1,CASE_SCREENSHOT2,CASE_SCREENSHOT3,CASE_SCREENSHOT4,CASE_SCREENSHOT5)");
		sql.append("VALUES( \'");
		sql.append(title);
		sql.append("\',\'");
		sql.append(content);
		sql.append("\',\'");
		sql.append(customer);
		sql.append("\',");
		sql.append("NOW()");
		sql.append(",");
		sql.append(star);
		sql.append(",");
		sql.append(Unity3DSize);
		sql.append(",");
		sql.append(RARSize);
		sql.append(",\'");
		sql.append(filenames.get(0));
		sql.append("\',\'");
		sql.append(filenames.get(1));
		sql.append("\',\'");
		sql.append(filenames.get(2));
		sql.append("\',\'");
		sql.append(filenames.get(3));
		sql.append("\',\'");
		sql.append(filenames.get(4));
		sql.append("\',\'");
		sql.append(filenames.get(5));
		sql.append("\',\'");
		sql.append(filenames.get(6));
		sql.append("\')");
		try{
			TransManager.BeginTrans();
			if(TransManager.update(sql.toString())==0){
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
	
	public boolean EditCase(String id,String title,String content,String customer,int star,List<String> filenames,int RARSize,int Unity3DSize){
		if(id==null||id.length()==0){
			return false;
		}
		boolean result=true;
		String sql="UPDATE T_CASE " +
		"SET CASE_TITLE=\'"+title+"\'"+
		",CASE_CUSTOMER=\'"+customer+"\'"+
		",CASE_STAR=\'"+star+"\'"+
		",CASE_INTRODUCTION=\'"+content+"\'"+
				"WHERE CASE_ID=\'" +id+"\'";
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
