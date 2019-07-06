package com.ego.why;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

import com.ego.system.db.DBUtils;

public class Test {
	public static void main(String args[]) {
		try {
			System.out.println(DBUtils.getIncrementId("eeee"));
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
