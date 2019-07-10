package com.ego.why;

import java.sql.SQLException;

import com.ego.system.tools.Tools;

public class Test 
{
	public static void main(String args[]) 
	{
		try 
		{
			System.out.println(Tools.getIncrementId("eeee"));
		} 
		catch (SQLException e) 
		{
			e.printStackTrace();
		}
	}
}
