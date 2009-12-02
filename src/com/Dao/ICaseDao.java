package com.Dao;

import com.javaBean.Case;

public interface ICaseDao {
	public void update(Case instance);
	public void insert(Case instance);
	public void delete(Case instance);
	public void query(Case instance);
	public void findById(String id);
}
