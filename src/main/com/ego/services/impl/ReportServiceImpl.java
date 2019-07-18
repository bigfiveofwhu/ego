package com.ego.services.impl;

import com.ego.services.JdbcServicesSupport;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class ReportServiceImpl extends JdbcServicesSupport {
    @Override
    public List<Map<String, String>> query(String qtype) throws Exception {
        if(qtype.equalsIgnoreCase("queryShopForMonth"))
            return this.queryShopForMonth();
        if(qtype.equalsIgnoreCase("queryServiceForMonth"))
            return this.queryServiceForMonth();
        if(qtype.equalsIgnoreCase("queryShopForYear"))
            return this.queryShopForYear();
        if(qtype.equalsIgnoreCase("queryServiceForYear"))
            return this.queryServiceForYear();
        throw new Exception("ReportServiceImpl���ܴ���"+qtype);
    }

    /**
     * aaa102:�û�id
     * aab102:����id
     *   diff:
     *      0�������
     *      1���ϸ���
     *
     * ����û�id���ߵ���id��Ϊ�գ������id���¼
     * ����Ϊ����Ա����ѯ�¶�����ˮ
     * @return
     * @throws Exception
     */
    private List<Map<String, String>> queryShopForMonth() throws Exception {
        Object aaa102=this.get("aaa102");
        Object aab102=this.get("aab102");
        Object diff=this.get("diff");

        StringBuilder sql=new StringBuilder()
                .append("SELECT aab202 name,DAY(aab305) day,SUM(aab310 * aab314) sum")
                .append("  FROM ab03 a3,ab02 a2")
                .append(" WHERE a3.aab203=a2.aab203 AND PERIOD_DIFF(date_format(NOW( ),'%Y%m'),date_format(aab305,'%Y%m'))=?")
                ;

        List<Object> paramList=new ArrayList<>();
        paramList.add(diff);

        //�û���ѯ
        if(this.isNotNull(aaa102))
        {
            sql.append(" AND aaa102=? GROUP BY DAY(aab305)");
            paramList.add(aaa102);
        }
        //���̲�ѯ
        else if(this.isNotNull(aab102))
        {
            sql.append(" AND aab102=? GROUP BY a3.aab203,DAY(aab305)");
            paramList.add(aab102);
        }
        //��Ϊ�����ǹ���Ա��ѯ
        else
        {
            sql.append(" GROUP BY DAY(aab305)");
        }
        return this.queryForList(sql.toString(), paramList.toArray());
    }

    /**
     * aaa102:�û�id
     * aac102:������id
     *   diff:
     *      0�������
     *      1���ϸ���
     *
     * ����û�id���߷�����id��Ϊ�գ������id���¼
     * ����Ϊ����Ա����ѯ�¶�����ˮ
     * @return
     * @throws Exception
     */
    private List<Map<String, String>> queryServiceForMonth() throws Exception{
        Object aaa102=this.get("aaa102");
        Object aac102=this.get("aac102");
        Object diff=this.get("diff");

        StringBuilder sql=new StringBuilder()
                .append("SELECT aac203 name,DAY(aac405) day,SUM(aac407) sum")
                .append("  FROM ac02 a2,ac04 a4")
                .append(" WHERE a2.aac202=a4.aac202 AND PERIOD_DIFF(date_format(NOW( ),'%Y%m'),date_format(aac405,'%Y%m'))=?")
                ;

        List<Object> paramList=new ArrayList<>();
        paramList.add(diff);

        //�û���ѯ
        if(this.isNotNull(aaa102))
        {
            sql.append(" AND aaa102=? GROUP BY DAY(aac405)");
            paramList.add(aaa102);
        }
        //���̲�ѯ
        else if(this.isNotNull(aac102))
        {
            sql.append(" AND aab102=? GROUP BY a4.aac202,DAY(aac405)");
            paramList.add(aac102);
        }
        //��Ϊ�����ǹ���Ա��ѯ
        else
        {
            sql.append(" GROUP BY DAY(aac405)");
        }
        return this.queryForList(sql.toString(), paramList.toArray());
    }

    /**
     * aaa102:�û�id
     * aab102:����id
     *   diff:
     *      0������
     *      1��ȥ��
     *
     * ����û�id���ߵ���id��Ϊ�գ������id���¼
     * ����Ϊ����Ա����ѯ�������ˮ
     * @return
     * @throws Exception
     */
    private List<Map<String, String>> queryShopForYear() throws Exception {
        Object aaa102=this.get("aaa102");
        Object aab102=this.get("aab102");
        Object diff=this.get("diff");

        StringBuilder sql=new StringBuilder()
                .append("SELECT aab202 name,Month(aab305) month,SUM(aab310 * aab314) sum")
                .append("  FROM ab03 a3,ab02 a2")
                .append(" WHERE a3.aab203=a2.aab203 AND PERIOD_DIFF(date_format(NOW( ),'%Y'),date_format(aab305,'%Y'))=?")
                ;

        List<Object> paramList=new ArrayList<>();
        paramList.add(diff);

        //�û���ѯ
        if(this.isNotNull(aaa102))
        {
            sql.append(" AND aaa102=? GROUP BY Month(aab305)");
            paramList.add(aaa102);
        }
        //���̲�ѯ
        else if(this.isNotNull(aab102))
        {
            sql.append(" AND aab102=? GROUP BY a3.aab203,Month(aab305)");
            paramList.add(aab102);
        }
        //��Ϊ�����ǹ���Ա��ѯ
        else
        {
            sql.append(" GROUP BY Month(aab305)");
        }
        return this.queryForList(sql.toString(), paramList.toArray());
    }

    /**
     * aaa102:�û�id
     * aac102:������id
     *   diff:
     *      0������
     *      1��ȥ��
     *
     * ����û�id���ߵ���id��Ϊ�գ������id���¼
     * ����Ϊ����Ա����ѯ�������ˮ
     * @return
     * @throws Exception
     */
    private List<Map<String, String>> queryServiceForYear() throws Exception {
        Object aaa102=this.get("aaa102");
        Object aac102=this.get("aac102");
        Object diff=this.get("diff");

        StringBuilder sql=new StringBuilder()
                .append("SELECT aac203 name,Month(aac405) month,SUM(aac407) sum")
                .append("  FROM ac02 a2,ac04 a4")
                .append(" WHERE a2.aac202=a4.aac202 AND PERIOD_DIFF(date_format(NOW( ),'%Y'),date_format(aac405,'%Y'))=?")
                ;

        List<Object> paramList=new ArrayList<>();
        paramList.add(diff);

        //�û���ѯ
        if(this.isNotNull(aaa102))
        {
            sql.append(" AND aaa102=? GROUP BY Month(aac405)");
            paramList.add(aaa102);
        }
        //���̲�ѯ
        else if(this.isNotNull(aac102))
        {
            sql.append(" AND aab102=? GROUP BY a4.aac202,Month(aac405)");
            paramList.add(aac102);
        }
        //��Ϊ�����ǹ���Ա��ѯ
        else
        {
            sql.append(" GROUP BY Month(aac405)");
        }
        return this.queryForList(sql.toString(), paramList.toArray());
    }
}
