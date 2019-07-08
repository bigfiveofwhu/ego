/**
 * 描述每条SQL语句的执行方式
 */
package com.ego.services;

import java.sql.PreparedStatement;

import com.ego.system.db.DBUtils;

class PstmMetaData 
{
	private PreparedStatement pstm = null;
	private boolean isBatch = false;

	public PstmMetaData(final PreparedStatement pstm, final boolean isBatch)
	{
		this.pstm = pstm;
		this.isBatch = isBatch;
	}

	public void executePreparedStatement() throws Exception
	{
		if (this.isBatch) 
		{
			this.pstm.executeBatch();
		} 
		else 
		{
			this.pstm.executeUpdate();
		}
	}

	public void close() 
	{
		DBUtils.close(this.pstm);
	}
}
