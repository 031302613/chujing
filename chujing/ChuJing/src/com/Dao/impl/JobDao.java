package com.Dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.javaBean.Job;
import com.jdbc.impl.TransManager;

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
}
