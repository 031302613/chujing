package com.Dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.javaBean.News;
import com.jdbc.impl.TransManager;
import com.util.Pagination;

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
	public List<News> getListByPage(String currentPage,int PageSize) {
		List<News> list = new ArrayList<News>();
		try {
			String sql = "select count(*) from t_news";
			TransManager.BeginTrans();
			ResultSet rs = TransManager.excute(sql);
			if(rs.next()){
				Pagination.init(currentPage,rs.getInt(1),PageSize);//size = 5
			}else
				return null;
			StringBuffer pageSQL = new StringBuffer("select * from t_news limit ");
			pageSQL.append(Pagination.beginIndex);
			pageSQL.append(",");
			pageSQL.append(Pagination.pageSize);
			ResultSet rsByPage = TransManager.excute(pageSQL.toString());
			while (rsByPage.next()) {
				News news = new News();
				news.setNewsContent(rsByPage.getString("NEWS_CONTENT"));
				news.setNewsId(String.valueOf(rsByPage.getInt("NEWS_ID")));
				news.setNewsTitle(rsByPage.getString("NEWS_TITLE"));
				news.setNewsModifiedTime(rsByPage.getDate("NEWS_MODIFIED_TIME"));
				news.setNewsPublishTime(rsByPage.getDate("NEWS_PUBLISH_TIME"));
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
	
	@SuppressWarnings("finally")
	public boolean AddNews(String title,String content){
		if(title==null||content==null||title.length()==0||content.length()==0){
			return false;
		}
		boolean result=true;
		String sql="INSERT INTO T_NEWS(NEWS_TITLE,NEWS_CONTENT,NEWS_PUBLISH_TIME)" +
				"VALUES( \'"+title+"\',\'"+content+"\',NOW())";
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
