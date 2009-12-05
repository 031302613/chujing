package com.Dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.javaBean.Job;
import com.javaBean.News;
import com.jdbc.impl.TransManager;
import com.util.Pagination;

public class JobDao {
	public List<Job> getListBySQL(String sql) {
		List<Job> list = new ArrayList<Job>();
		try {
			TransManager.BeginTrans();
			ResultSet rs = TransManager.excute(sql);
			while (rs.next()) {
				Job job = new Job();
				job.setJobContent(rs.getString("JOB_CONTENT"));
				job.setJobId(String.valueOf(rs.getInt("JOB_ID")));
				job.setJobTitle(rs.getString("JOB_TITLE"));
				job.setJobAvailableTime(rs.getDate("JOB_AVAILABLE_TIME"));
				job.setJobPublishTime(rs.getDate("Job_PUBLISH_TIME"));
				list.add(job);
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
	
	public List<Job> getListByPage(String currentPage,int PageSize) {
		List<Job> list = new ArrayList<Job>();
		try {
			String sql = "select count(*) from t_job";
			TransManager.BeginTrans();
			ResultSet rs = TransManager.excute(sql);
			if(rs.next()){
				Pagination.init(currentPage,rs.getInt(1),PageSize);//size = 5
			}else
				return null;
			StringBuffer pageSQL = new StringBuffer("select * from t_job limit ");
			pageSQL.append(Pagination.beginIndex);
			pageSQL.append(",");
			pageSQL.append(Pagination.pageSize);
			ResultSet rsByPage = TransManager.excute(pageSQL.toString());
			while (rsByPage.next()) {
				Job job = new Job();
				job.setJobContent(rsByPage.getString("JOB_CONTENT"));
				job.setJobId(String.valueOf(rsByPage.getInt("JOB_ID")));
				job.setJobTitle(rsByPage.getString("JOB_TITLE"));
				job.setJobAvailableTime(rsByPage.getDate("JOB_AVAILABLE_TIME"));
				job.setJobPublishTime(rsByPage.getDate("Job_PUBLISH_TIME"));
				list.add(job);
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

	public Job getByID(String ID) {
		Job job = new Job();
		try {
			TransManager.BeginTrans();
			StringBuffer sql = new StringBuffer(
					"select * from t_job where JOB_ID=");
			sql.append(ID);
			ResultSet rs = TransManager.excute(sql.toString());
			if (rs.next()) {
				job.setJobContent(rs.getString("JOB_CONTENT"));
				job.setJobId(String.valueOf(rs.getInt("JOB_ID")));
				job.setJobTitle(rs.getString("JOB_TITLE"));
				job.setJobAvailableTime(rs.getDate("JOB_AVAILABLE_TIME"));
				job.setJobPublishTime(rs.getDate("Job_PUBLISH_TIME"));
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
		return job;
	}
	
	public boolean AddJob(String title,String content,String date){
		if(title==null||content==null||title.length()==0||content.length()==0
				||date==null||date.length()==0){
			return false;
		}
		boolean result=true;
		String sql="INSERT INTO T_JOB(JOB_TITLE,JOB_CONTENT,JOB_PUBLISH_TIME,JOB_AVAILABLE_TIME)" +
				"VALUES( \'"+title+"\',\'"+content+"\',NOW(),DATE(\'"+date+"\'))";
		System.out.println(sql);
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
