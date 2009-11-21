package com.Dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.javaBean.News;
import com.jdbc.impl.TransManager;

public class NewsDao {
	public List<News> getListBySQL(String sql) {
		List<News> list = new ArrayList<News>();
		try {
			TransManager.BeginTrans();
			ResultSet rs = TransManager.excute(sql);
			while (rs.next()) {
				News news = new News();
				news.setNewsContent(rs.getString("NEWS_CONTENT"));
				news.setNewsId(String.valueOf(rs.getInt("NEWS_ID")));
				news.setNewsTitle(rs.getString("NEWS_TITLE"));
				news.setNewsModifiedTime(rs.getDate("NEWS_MODIFIED_TIME"));
				news.setNewsPublishTime(rs.getDate("NEWS_PUBLISH_TIME"));
				list.add(news);
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

	public News getByID(String ID) {
		News news = new News();
		try {
			TransManager.BeginTrans();
			StringBuffer sql = new StringBuffer(
					"select * from t_news where NEWS_ID=");
			sql.append(ID);
			ResultSet rs = TransManager.excute(sql.toString());
			if (rs.next()) {
				news.setNewsContent(rs.getString("NEWS_CONTENT"));
				news.setNewsId(String.valueOf(rs.getInt("NEWS_ID")));
				news.setNewsTitle(rs.getString("NEWS_TITLE"));
				news.setNewsModifiedTime(rs.getDate("NEWS_MODIFIED_TIME"));
				news.setNewsPublishTime(rs.getDate("NEWS_PUBLISH_TIME"));
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
		return news;
	}
}
