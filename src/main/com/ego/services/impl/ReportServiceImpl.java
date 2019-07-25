package com.ego.services.impl;

import com.ego.services.JdbcServicesSupport;

import java.util.*;

/**
 * aaa102:用户id
 * aab102:店铺id
 * aac102:服务商id
 * <p>
 * type:用户类型
 * 1:普通用户
 * 2:店铺
 * 3:服务商
 * 4:管理员
 * <p>
 * diff:
 * 0：这个月
 * 1：上个月
 */
public class ReportServiceImpl extends JdbcServicesSupport
{
    @Override
    public List<Map<String, String>> query(String qtype) throws Exception
    {
        if (qtype.equalsIgnoreCase("queryShopForMonth"))
            return this.queryShopForMonth();
        if (qtype.equalsIgnoreCase("queryServiceForMonth"))
            return this.queryServiceForMonth();
        if (qtype.equalsIgnoreCase("queryShopForYear"))
            return this.queryShopForYear();
        if (qtype.equalsIgnoreCase("queryServiceForYear"))
            return this.queryServiceForYear();
        /***************************************************新的处理逻辑************************************************************/
        if (qtype.equalsIgnoreCase("shopSumMonth"))
            return this.shopSum(1);
        if (qtype.equalsIgnoreCase("shopSumYear"))
            return this.shopSum(2);
        if (qtype.equalsIgnoreCase("shopSumAll"))
            return this.shopSum(3);
        if (qtype.equalsIgnoreCase("serviceSumMonth"))
            return this.serviceSum(1);
        if (qtype.equalsIgnoreCase("serviceSumYear"))
            return this.serviceSum(2);
        if (qtype.equalsIgnoreCase("serviceSumAll"))
            return this.serviceSum(3);
        if (qtype.equalsIgnoreCase("userMonthlyReportDetail"))
            return this.userMonthlyReportDetail();
        if (qtype.equalsIgnoreCase("shopMonthlyReportDetail"))
            return this.shopMonthlyReportDetail();
        if (qtype.equalsIgnoreCase("serviceMonthlyDetail"))
            return this.serviceMonthlyDetail();
        if (qtype.equalsIgnoreCase("shopMonthlyReportDetailForGoods"))
            return this.shopMonthlyReportDetailForGoods();
        if (qtype.equalsIgnoreCase("shopYearlyReportDetail"))
            return shopYearlyReportDetail();
        if (qtype.equalsIgnoreCase("serviceYearlyReportDetail"))
            return serviceYearlyReportDetail();
        if (qtype.equalsIgnoreCase("adminMonthlyReportDetail"))
            return adminMonthlyReportDetail();
        if (qtype.equalsIgnoreCase("clickCount"))
            return clickCount();
        if (qtype.equalsIgnoreCase("queryShopForMonth2"))
            return queryShopForMonth2();
        if (qtype.equalsIgnoreCase("queryGoodsOfShop"))
            return queryGoodsOfShop();

        throw new Exception("ReportServiceImpl不能处理：" + qtype);
    }

    /**
     * 查询商品月度总流水
     *
     * @return
     * @throws Exception
     */
    private List<Map<String, String>> queryShopForMonth() throws Exception
    {
        Object aaa102 = this.get("aaa102");
        Object aab102 = this.get("aab102");
        Object type = this.get("type");
        Object diff = this.get("diff");

        List<Object> paramList = new ArrayList<>();
        StringBuilder sql = new StringBuilder();
        String tmp;

        paramList.add(diff);

        if (type != null)
        {
            //用户查询
            if (type.equals("1") && this.isNotNull(aaa102))
            {
                sql.append("SELECT DAY(aab305) day,SUM(aab316) sum");
                tmp = " AND aaa102=? GROUP BY DAY(aab305)";
                paramList.add(aaa102);
            }
            //店铺查询
            else if (type.equals("2") && this.isNotNull(aab102))
            {
                sql.append("SELECT CONCAT(aab202,'_',a3.aab203) name,DAY(aab305) day,SUM(aab316) sum");
                tmp = " AND aab102=? GROUP BY a3.aab203,DAY(aab305)";
                paramList.add(aab102);
            }
            //管理员查询
            else if (type.equals("4"))
            {
                sql.append("SELECT DAY(aab305) day,SUM(aab316) sum");
                tmp = " GROUP BY DAY(aab305)";
            }
            else
            {
                throw new Exception("ReportServiceImpl.queryShopForMonth()无法处理此请求");
            }
        }
        else
        {
            throw new Exception("ReportServiceImpl.queryShopForMonth()无法处理此请求");
        }

        sql.append("  FROM ab03 a3,ab02 a2")
                .append(" WHERE a3.aab203=a2.aab203 AND PERIOD_DIFF(date_format(NOW( ),'%Y%m'),date_format(aab305,'%Y%m'))=?")
                .append(tmp);

        return this.queryForList(sql.toString(), paramList.toArray());
    }

    /**
     * 查询服务月度总流水
     *
     * @return
     * @throws Exception
     */
    private List<Map<String, String>> queryServiceForMonth() throws Exception
    {
        Object aaa102 = this.get("aaa102");
        Object aac102 = this.get("aac102");
        Object type = this.get("type");
        Object diff = this.get("diff");

        List<Object> paramList = new ArrayList<>();
        StringBuilder sql = new StringBuilder();
        String tmp;

        paramList.add(diff);

        if (type != null)
        {
            //用户查询
            if (type.equals("1") && this.isNotNull(aaa102))
            {
                sql.append("SELECT DAY(aac405) day,SUM(aac407) sum");
                tmp = " AND aaa102=? GROUP BY DAY(aac405)";
                paramList.add(aaa102);
            }
            //服务商查询
            else if (type.equals("3") && this.isNotNull(aac102))
            {
                sql.append("SELECT CONCAT(aac203,'_',a4.aac202) name,DAY(aac405) day,SUM(aac407) sum");
                tmp = " AND a2.aac102=? GROUP BY a4.aac202,DAY(aac405)";
                paramList.add(aac102);
            }
            //管理员查询
            else if (type.equals("4"))
            {
                sql.append("SELECT DAY(aac405) day,SUM(aac407) sum");
                tmp = " GROUP BY DAY(aac405)";
            }
            else
            {
                throw new Exception("ReportServiceImpl.queryServiceForMonth()无法处理此请求");
            }
        }
        else
        {
            throw new Exception("ReportServiceImpl.queryServiceForMonth()无法处理此请求");
        }

        sql.append("  FROM ac02 a2,ac04 a4")
                .append(" WHERE a2.aac202=a4.aac202 AND PERIOD_DIFF(date_format(NOW( ),'%Y%m'),date_format(aac405,'%Y%m'))=?")
                .append(tmp);

        return this.queryForList(sql.toString(), paramList.toArray());
    }

    /**
     * 查询商品年度总流水
     *
     * @return
     * @throws Exception
     */
    private List<Map<String, String>> queryShopForYear() throws Exception
    {
        Object aaa102 = this.get("aaa102");
        Object aab102 = this.get("aab102");
        Object type = this.get("type");
        Object diff = this.get("diff");

        List<Object> paramList = new ArrayList<>();
        StringBuilder sql = new StringBuilder();
        String tmp;

        paramList.add(diff);

        if (type != null)
        {
            //用户查询
            if (type.equals("1") && this.isNotNull(aaa102))
            {
                sql.append("SELECT Month(aab305) month,SUM(aab316) sum");
                tmp = " AND aaa102=? GROUP BY Month(aab305)";
                paramList.add(aaa102);
            }
            //店铺查询
            else if (type.equals("2") && this.isNotNull(aab102))
            {
                sql.append("SELECT CONCAT(aab202,'_',a3.aab203) name,Month(aab305) month,SUM(aab316) sum");
                tmp = " AND aab102=? GROUP BY a3.aab203,Month(aab305)";
                paramList.add(aab102);
            }
            //管理员查询
            else if (type.equals("4"))
            {
                sql.append("SELECT Month(aab305) month,SUM(aab316) sum");
                tmp = " GROUP BY Month(aab305)";
            }
            else
            {
                throw new Exception("ReportServiceImpl.queryShopForYear()无法处理此请求");
            }
        }
        else
        {
            throw new Exception("ReportServiceImpl.queryShopForYear()无法处理此请求");
        }

        sql.append("  FROM ab03 a3,ab02 a2")
                .append(" WHERE a3.aab203=a2.aab203 AND PERIOD_DIFF(date_format(NOW( ),'%Y'),date_format(aab305,'%Y'))=?")
                .append(tmp);

        return this.queryForList(sql.toString(), paramList.toArray());
    }

    /**
     * 查询服务年度总流水
     *
     * @return
     * @throws Exception
     */
    private List<Map<String, String>> queryServiceForYear() throws Exception
    {
        Object aaa102 = this.get("aaa102");
        Object aac102 = this.get("aac102");
        Object type = this.get("type");
        Object diff = this.get("diff");

        List<Object> paramList = new ArrayList<>();
        StringBuilder sql = new StringBuilder();
        String tmp;

        paramList.add(diff);

        if (type != null)
        {
            //用户查询
            if (type.equals("1") && this.isNotNull(aaa102))
            {
                sql.append("SELECT Month(aac405) month,SUM(aac407) sum");
                tmp = " AND aaa102=? GROUP BY Month(aac405)";
                paramList.add(aaa102);
            }
            //服务商查询
            else if (type.equals("3") && this.isNotNull(aac102))
            {
                sql.append("SELECT CONCAT(aac203,'_',a4.aac202) name,Month(aac405) month,SUM(aac407) sum");
                tmp = " AND a2.aac102=? GROUP BY a4.aac202,Month(aac405)";
                paramList.add(aac102);
            }
            //管理员查询
            else if (type.equals("4"))
            {
                sql.append("SELECT Month(aac405) month,SUM(aac407) sum");
                tmp = " GROUP BY Month(aac405)";
            }
            else
            {
                throw new Exception("ReportServiceImpl.queryServiceForYear()无法处理此请求");
            }
        }
        else
        {
            throw new Exception("ReportServiceImpl.queryServiceForYear()无法处理此请求");
        }

        sql.append("  FROM ac02 a2,ac04 a4")
                .append(" WHERE a2.aac202=a4.aac202 AND PERIOD_DIFF(date_format(NOW( ),'%Y'),date_format(aac405,'%Y'))=?")
                .append(tmp);

        return this.queryForList(sql.toString(), paramList.toArray());
    }

    /***************************************************新的处理逻辑************************************************************/
    /**
     * 获取商品消费总额
     *
     * @param tag 1：月度商品消费总额
     *            2：年度商品消费总额
     *            3：生涯商品消费总额
     * @return 消费总额
     * @throws Exception
     */
    private List<Map<String, String>> shopSum(int tag) throws Exception
    {
        Object aaa102 = this.get("aaa102");
        Object aab102 = this.get("aab102");
        Object type = this.get("type");

        if(!this.isNotNull(type))
            throw new Exception("ReportServiceImpl.shopSum()无法处理此请求");

        StringBuilder sql = new StringBuilder()
                .append("SELECT SUM(aab316) sum")
                .append("  FROM ab02 a2,ab03 a3")
                .append(" WHERE a2.aab203=a3.aab203");
        List<Object> paramList = new ArrayList<>();

        //用户
        if (type.equals("1")&&this.isNotNull(aaa102))
        {
            sql.append(" AND aaa102=?");
            paramList.add(aaa102);
        }
        //店铺
        else if (type.equals("2")&&this.isNotNull(aab102))
        {
            sql.append(" AND aab102=?");
            paramList.add(aab102);
        }
        //都为空则是管理员
        else if(!type.equals("4"))
            throw new Exception("ReportServiceImpl.shopSum()无法处理此请求");

        //月度流水
        if (tag == 1)
            sql.append(" AND PERIOD_DIFF(date_format(NOW( ),'%Y%m'),date_format(aab305,'%Y%m'))=0");
            //年度流水
        else if (tag == 2)
            sql.append(" AND PERIOD_DIFF(date_format(NOW( ),'%Y'),date_format(aab305,'%Y'))=0");
        //否则（tag=3）为生涯流水
        else
            sql.append(" AND aab305 IS NOT NULL");

        return queryForList(sql.toString(), paramList.toArray());
    }

    /**
     * 获取服务消费总额
     *
     * @param tag 1：月度服务消费总额
     *            2：年度服务消费总额
     *            3：生涯服务消费总额
     * @return 消费总额
     * @throws Exception
     */
    private List<Map<String, String>> serviceSum(int tag) throws Exception
    {
        Object aaa102 = this.get("aaa102");
        Object aac102 = this.get("aac102");
        Object type = this.get("type");

        if(!this.isNotNull(type))
            throw new Exception("ReportServiceImpl.serviceSum()无法处理此请求");

        StringBuilder sql = new StringBuilder()
                .append("SELECT SUM(aac407) sum")
                .append("  FROM ac02 a2,ac04 a4")
                .append(" WHERE a2.aac202=a4.aac202");

        List<Object> paramList = new ArrayList<>();
        //用户
        if (type.equals("1")&&this.isNotNull(aaa102))
        {
            sql.append(" AND aaa102=?");
            paramList.add(aaa102);
        }
        //服务商
        else if (type.equals("3")&&this.isNotNull(aac102))
        {
            sql.append(" AND a2.aac102=?");
            paramList.add(aac102);
        }
        //都为空则是管理员
        else if(!type.equals("4"))
            throw new Exception("ReportServiceImpl.serviceSum()无法处理此请求");

        //月度流水
        if (tag == 1)
            sql.append(" AND PERIOD_DIFF(date_format(NOW( ),'%Y%m'),date_format(aac405,'%Y%m'))=0");
            //年度流水
        else if (tag == 2)
            sql.append(" AND PERIOD_DIFF(date_format(NOW( ),'%Y'),date_format(aac405,'%Y'))=0");
        //否则（tag=3）为生涯流水
        else
            sql.append(" AND aac405 IS NOT NULL");

        return queryForList(sql.toString(), paramList.toArray());
    }

    /**
     * 获取用户月流水详情（详细账单）
     *
     * @return
     * @throws Exception
     */
    private List<Map<String, String>> userMonthlyReportDetail() throws Exception
    {
        Object aaa102 = this.get("aaa102");

        StringBuilder sql = new StringBuilder()
                .append("SELECT aab305 time,aab316 sum,'商品' type,aab103 name")
                .append("  FROM ab03 a3,ab02 a2,ab01 a1")
                .append(" WHERE a3.aaa102=? AND PERIOD_DIFF(date_format(NOW( ),'%Y%m'),date_format(aab305,'%Y%m'))=0")
                .append("   AND a3.aab203=a2.aab203 AND a2.aab102=a1.aab102")
                .append(" UNION ALL ")
                .append("SELECT aac405 time,aac407 sum,'服务' type,aac103 name")
                .append("  FROM ac04 a4,ac02 a2,ac01 a1")
                .append(" WHERE a4.aaa102=? AND PERIOD_DIFF(date_format(NOW( ),'%Y%m'),date_format(aac405,'%Y%m'))=0")
                .append("   AND a4.aac202=a2.aac202 AND a2.aac102=a1.aac102")
                .append(" ORDER BY time");

        return this.queryForList(sql.toString(), aaa102, aaa102);
    }

    /**
     * 获取商铺月流水详情（详细账单）
     *
     * @return
     * @throws Exception
     */
    private List<Map<String, String>> shopMonthlyReportDetail() throws Exception
    {
        Object aab102 = this.get("aab102");

        StringBuilder sql = new StringBuilder()
                .append("SELECT aab305 time,CONCAT(aab202,'_',a2.aab203) name,aab316 sum")
                .append("  FROM ab02 a2,ab03 a3")
                .append(" WHERE a2.aab203=a3.aab203 AND aab102=? AND PERIOD_DIFF(date_format(NOW( ),'%Y%m'),date_format(aab305,'%Y%m'))=0")
                .append(" ORDER BY time");

        return this.queryForList(sql.toString(), aab102);
    }

    /**
     * 获取服务商月流水详情（详细账单）
     *
     * @return
     * @throws Exception
     */
    private List<Map<String, String>> serviceMonthlyDetail() throws Exception
    {
        Object aac102 = this.get("aac102");

        StringBuilder sql = new StringBuilder()
                .append("SELECT aac405 time,CONCAT(aac203,'_',a2.aac202) name,aac407 sum")
                .append("  FROM ac02 a2,ac04 a4")
                .append(" WHERE a2.aac202=a4.aac202 AND a2.aac102=? AND PERIOD_DIFF(date_format(NOW( ),'%Y%m'),date_format(aac405,'%Y%m'))=0")
                .append(" ORDER BY time");

        return this.queryForList(sql.toString(), aac102);
    }

    /**
     * 重写
     */
    /**
     * 获取店铺这个月每件商品的点击量、销售量、销售额
     *
     * @return
     * @throws Exception
     */
    private List<Map<String, String>> shopMonthlyReportDetailForGoods() throws Exception
    {
        Object aab102 = this.get("aab102");
        Map<String,Map.Entry<String,String>> tmp1=new HashMap<>();
        Map<String,String> tmp2=new HashMap<>();

        StringBuilder sql1=new StringBuilder()
                .append("SELECT aab203 id,CONCAT(aab202,'_',aab203) name")
                .append("  FROM ab02")
                .append(" WHERE aab102=? AND aab212='02'");
        List<Map<String, String>> list1=this.queryForList(sql1.toString(),aab102);

        StringBuilder sql2=new StringBuilder()
                .append("SELECT a2.aab203 id,SUM( aab310 ) count,SUM( aab316 ) sum")
                .append("  FROM ab02 a2,ab03 a3")
                .append(" WHERE a2.aab203 = a3.aab203 AND PERIOD_DIFF( date_format( NOW( ), '%Y%m' ), date_format( aab305, '%Y%m' ) ) = 0 AND aab102 = ?")
                .append(" GROUP BY a2.aab203");
        List<Map<String, String>> list2=this.queryForList(sql2.toString(),aab102);

        StringBuilder sql3=new StringBuilder()
                .append("SELECT a2.aab203 id,SUM( aaa703 ) views")
                .append("  FROM ab02 a2,aa07 a7")
                .append(" WHERE a2.aab203 = a7.aab203 AND PERIOD_DIFF( date_format( NOW( ), '%Y%m' ), date_format( aaa702, '%Y%m' ) ) = 0 AND aab102 = ?")
                .append(" GROUP BY a2.aab203");
        List<Map<String, String>> list3=this.queryForList(sql3.toString(),aab102);

        for(Map<String,String> map:list2)
            tmp1.put(map.get("id"), new AbstractMap.SimpleEntry<>(map.get("count"), map.get("sum")));
        for (Map<String,String> map:list3)
            tmp2.put(map.get("id"),map.get("views"));
        for (Map<String,String> map:list1)
        {
            String id=map.get("id");
            if(tmp1.containsKey(id))
            {
                map.put("count",tmp1.get(id).getKey());
                map.put("sum",tmp1.get(id).getValue());
            }
            else
            {
                map.put("count","0");
                map.put("sum","0");
            }

            map.put("views", tmp2.getOrDefault(id, "0"));
        }
        return list1;
    }

    /**
     * 商铺一年内各月份的总销量、总额度
     *
     * @return
     * @throws Exception
     */
    private List<Map<String, String>> shopYearlyReportDetail() throws Exception
    {
        Object aab102 = this.get("aab102");
        Object type = this.get("type");

        if(!this.isNotNull(type))
            throw new Exception("ReportServiceImpl.shopYearlyReportDetail()无法处理此请求");

        StringBuilder sql = new StringBuilder()
                .append("SELECT Month(aab305) month,SUM(aab316) sum,SUM(aab310) count")
                .append("  FROM ab03 a3,ab02 a2")
                .append(" WHERE a3.aab203=a2.aab203 AND PERIOD_DIFF(date_format(NOW( ),'%Y'),date_format(aab305,'%Y'))=0");

        List<Object> paramList = new ArrayList<>();
        //aab102不为空即商铺，为空即管理员
        if (type.equals("2")&&this.isNotNull(aab102))
        {
            sql.append("   AND aab102=?");
            paramList.add(aab102);
        }
        else if(!type.equals("4"))
            throw new Exception("ReportServiceImpl.shopYearlyReportDetail()无法处理此请求");

        sql.append(" GROUP BY Month(aab305)");
        return this.queryForList(sql.toString(), paramList.toArray());
    }

    /**
     * 服务商一年内各月份的总销量、总额度
     *
     * @return
     * @throws Exception
     */
    private List<Map<String, String>> serviceYearlyReportDetail() throws Exception
    {
        Object aac102 = this.get("aac102");
        Object type = this.get("type");

        if(!this.isNotNull(type))
            throw new Exception("ReportServiceImpl.serviceYearlyReportDetail()无法处理此请求");

        StringBuilder sql = new StringBuilder()
                .append("SELECT Month(aac405) month,SUM(aac407) sum,COUNT(*) count")
                .append("  FROM ac02 a2,ac04 a4")
                .append(" WHERE a2.aac202=a4.aac202 AND PERIOD_DIFF(date_format(NOW( ),'%Y'),date_format(aac405,'%Y'))=0");

        List<Object> paramList = new ArrayList<>();
        //aac102不为空即服务商，为空即管理员
        if (type.equals("3")&&this.isNotNull(aac102))
        {
            sql.append(" AND a2.aac102=?");
            paramList.add(aac102);
        }
        else if(!type.equals("4"))
            throw new Exception("ReportServiceImpl.serviceYearlyReportDetail()无法处理此请求");

        sql.append(" GROUP BY Month(aac405)");
        return this.queryForList(sql.toString(), paramList.toArray());
    }

    /**
     * 获取本月平台内商品销量/销售额排名前5的店铺
     * tmp:销量/销售额
     *
     * @return
     * @throws Exception
     */
    private List<Map<String, String>> adminMonthlyReportDetail() throws Exception
    {
        StringBuilder sql = new StringBuilder()
                .append("SELECT CONCAT(aab103,'_',a1.aab102) name,SUM(aab316) sum,SUM(aab310) count")
                .append("  FROM ab03 a3,ab02 a2,ab01 a1")
                .append(" WHERE a2.aab203=a3.aab203 AND a1.aab102=a2.aab102 AND PERIOD_DIFF(date_format(NOW( ),'%Y'),date_format(aab305,'%Y'))=0")
                .append(" GROUP BY a1.aab102")
                .append(" ORDER BY ")
                .append(this.get("tmp"))
                .append("  DESC")
                .append(" LIMIT 5");

        return this.queryForList(sql.toString());
    }

    /**
     * 获取每月平台总点击量
     *
     * @return
     * @throws Exception
     */
    private List<Map<String, String>> clickCount() throws Exception
    {
        StringBuilder sql = new StringBuilder()
                .append("SELECT MONTH(aaa702) month, SUM(aaa703) sum")
                .append("  FROM aa07")
                .append(" WHERE PERIOD_DIFF(date_format(NOW( ),'%Y'),date_format(aaa702,'%Y'))=0")
                .append(" GROUP BY MONTH(aaa702)");
        return this.queryForList(sql.toString());
    }

    /**
     * 获取本月各商品每天销售量和销售额
     *
     * @return
     * @throws Exception
     */
    private List<Map<String, String>> queryShopForMonth2() throws Exception
    {
        Object aab102 = this.get("aab102");
        Object type = this.get("type");

        if(!this.isNotNull(type))
            throw new Exception("ReportServiceImpl.queryShopForMonth2()无法处理此请求");

        StringBuilder sql = new StringBuilder()
                .append("SELECT CONCAT(aab202,'_',a3.aab203) name,DAY(aab305) day,SUM(aab316) sum,SUM(aab310) count")
                .append("  FROM ab03 a3,ab02 a2")
                .append(" WHERE a3.aab203=a2.aab203 AND PERIOD_DIFF(date_format(NOW( ),'%Y%m'),date_format(aab305,'%Y%m'))=0");

        List<Object> paramList = new ArrayList<>();
        if (type.equals("2")&&this.isNotNull(aab102))
        {
            sql.append(" AND aab102=?");
            paramList.add(aab102);
        }
        else if(!type.equals("4"))
            throw new Exception("ReportServiceImpl.queryShopForMonth2()无法处理此请求");

        sql.append(" GROUP BY a3.aab203,DAY(aab305)");

        return this.queryForList(sql.toString(), paramList.toArray());
    }

    /**
     * 根据店铺id获取该店铺所有商品名
     *
     * @return
     * @throws Exception
     */
    private List<Map<String, String>> queryGoodsOfShop() throws Exception
    {
        StringBuilder sql = new StringBuilder()
                .append("SELECT CONCAT(aab202,'_',aab203) name")
                .append("  FROM ab02")
                .append(" WHERE aab102=? AND aab212='02'");

        return this.queryForList(sql.toString(), this.get("aab102"));
    }
}
