package com.jdbc;
import java.sql.Connection;
import java.sql.SQLException;

public interface DBConnection {
	public Connection getConnection(Object obj) throws SQLException, ClassNotFoundException;
	public void BeginTransaction(Object obj) throws SQLException;
	public void commit(Object obj) throws SQLException;
	public void rollback(Object obj) throws SQLException;
	public void close(Object obj) throws SQLException;
}
