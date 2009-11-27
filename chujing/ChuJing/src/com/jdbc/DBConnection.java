package com.jdbc;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

public interface DBConnection {
	public ResultSet excute(String sql) throws SQLException;
	public int update(String sql) throws SQLException;
	public void getConnection(Object obj) throws SQLException, ClassNotFoundException;
	public void BeginTransaction(Object obj) throws SQLException;
	public void commit(Object obj) throws SQLException;
	public void rollback(Object obj) throws SQLException;
	public void close(Object obj) throws SQLException;
}
