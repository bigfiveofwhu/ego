package com.ego.controller.impl;

import com.ego.controller.ControllerSupport;
import com.ego.services.impl.ReportServiceImpl;

import javax.servlet.http.HttpServletRequest;
import java.util.*;

public class ReportServlet extends ControllerSupport
{
    public ReportServlet()
    {
        this.setServices(new ReportServiceImpl());
    }

    @Override
    public String execute() throws Exception
    {
        String path;
        String servletPath = ((HttpServletRequest) this.dto.get("request")).getServletPath();
        String mapping = servletPath.substring(servletPath.lastIndexOf('/') + 1
                , servletPath.indexOf('.'));

        switch (mapping)
        {
            /***************************************************新的处理逻辑************************************************************/
            //新版
            case "userReport":
                this.dealWithUser();
                this.dealWithUser2();
                path = "report/userReport";
                break;

            case "shopperReport":
                this.dealWithShopperOrServiceProvider(true);
                this.dealWithShop2();
                path = "report/shopperReport";
                break;

            case "serviceProviderReport":
                this.dealWithShopperOrServiceProvider(false);
                this.dealWithService2();
                path = "report/serviceProviderReport";
                break;

            case "adminReport":
                this.dealWithUser();
                this.dealWithAdmin2();
                path = "report/adminReport";
                break;
            default:
                throw new Exception("ReportServlet无法处理此类请求:" + mapping);
        }
        return path;
    }

    /**
     * 处理用户流水报表，包括:这个月商品流水（详细到每天）
     * :这个月服务流水
     * :上个月商品流水
     * :上个月服务流水
     * :今年商品流水（详细到月）
     * :今年服务流水
     * :去年商品流水
     * :去年服务商流水
     * <p>
     * 其余函数类似，商铺按商品进一步细分
     * 服务商按服务进一步细分
     *
     * @throws Exception sql异常
     */
    private void dealWithUser() throws Exception
    {
        //当前月/年数据
        this.dto.put("diff", 0);
        double[] d1 = convert(this.getServices().query("queryShopForMonth"), true);
        double[] d2 = convert(this.getServices().query("queryServiceForMonth"), true);
        double[] d3 = convert(this.getServices().query("queryShopForYear"), false);
        double[] d4 = convert(this.getServices().query("queryServiceForYear"), false);
        String s1 = dataFormat("本月店铺", d1);
        String s2 = dataFormat("本月服务", d2);
        String s3 = dataFormat("本月总和", addArray(d1, d2));
        String s4 = dataFormat("今年店铺", d3);
        String s5 = dataFormat("今年服务", d4);
        String s6 = dataFormat("今年总和", addArray(d3, d4));

        //上个月/年数据
        this.dto.put("diff", 1);
        double[] d5 = convert(this.getServices().query("queryShopForMonth"), true);
        double[] d6 = convert(this.getServices().query("queryServiceForMonth"), true);
        double[] d7 = convert(this.getServices().query("queryShopForYear"), false);
        double[] d8 = convert(this.getServices().query("queryServiceForYear"), false);
        String s7 = dataFormat("上月店铺", d5);
        String s8 = dataFormat("上月服务", d6);
        String s9 = dataFormat("上月总和", addArray(d5, d6));
        String s10 = dataFormat("去年店铺", d7);
        String s11 = dataFormat("去年服务", d8);
        String s12 = dataFormat("去年总和", addArray(d7, d8));

        this.saveAttribute("monthly", s1 + s2 + s3 + s7 + s8 + s9);
        this.saveAttribute("yearly", s4 + s5 + s6 + s10 + s11 + s12);
    }

    private void dealWithShopperOrServiceProvider(boolean tag) throws Exception
    {
        String queryForMonth = tag ? "queryShopForMonth" : "queryServiceForMonth";
        String queryForYear = tag ? "queryShopForYear" : "queryServiceForYear";
        StringBuilder monthly = new StringBuilder();
        StringBuilder yearly = new StringBuilder();
        //月度总和
        double[] m_d1 = new double[31];
        double[] m_d2 = new double[31];
        //年度总和
        double[] y_d1 = new double[12];
        double[] y_d2 = new double[12];

        //当前月/年数据
        this.dto.put("diff", 0);
        Map<String, double[]> m1 = convertMap(this.getServices().query(queryForMonth), true);
        Map<String, double[]> m2 = convertMap(this.getServices().query(queryForYear), false);
        for (String s : m1.keySet())
        {
            double[] d = m1.get(s);
            monthly.append(dataFormat("本月_" + s, d));
            m_d1 = addArray(m_d1, d);
        }
        monthly.append(dataFormat("本月总和", m_d1));

        for (String s : m2.keySet())
        {
            double[] d = m2.get(s);
            yearly.append(dataFormat("今年_" + s, d));
            y_d1 = addArray(y_d1, d);
        }
        yearly.append(dataFormat("今年总和", y_d1));

        //上个月/年数据
        this.dto.put("diff", 1);
        Map<String, double[]> m3 = convertMap(this.getServices().query(queryForMonth), true);
        Map<String, double[]> m4 = convertMap(this.getServices().query(queryForYear), false);
        for (String s : m3.keySet())
        {
            double[] d = m3.get(s);
            monthly.append(dataFormat("上月_" + s, d));
            m_d2 = addArray(m_d2, d);
        }
        monthly.append(dataFormat("上月总和", m_d2));

        for (String s : m4.keySet())
        {
            double[] d = m4.get(s);
            yearly.append(dataFormat("去年_" + s, d));
            y_d2 = addArray(y_d2, d);
        }
        yearly.append(dataFormat("去年总和", y_d2));

        this.saveAttribute("monthly", monthly.toString());
        this.saveAttribute("yearly", yearly.toString());
    }

    /**
     * 用户/管理员
     * 将list替换为double数组
     *
     * @param list sql返回的list
     * @param tag  true:返回一个月内每天的流水，按每月31天算
     *             false:返回一年内每个月的流水，按每年12个月算
     * @return 返回double数组
     */
    private double[] convert(List<Map<String, String>> list, boolean tag)
    {
        String s = tag ? "day" : "month";
        int l = tag ? 31 : 12;
        double[] result = new double[l];
        Map<String, String> tmp = new HashMap<>();

        for (Map<String, String> map : list)
        {
            tmp.put(map.get(s), map.get("sum"));
        }

        for (int i = 0; i < l; i++)
        {
            String sum = tmp.get(String.valueOf(i + 1));
            if (sum == null)
                result[i] = 0;
            else
                result[i] = Double.parseDouble(sum);
        }

        return result;
    }

    /**
     * 商铺/服务商
     * 将list替换为Map，key为name，value为double数组，按商品名/服务名进一步细分
     *
     * @param list sql返回的list
     * @param tag  true:返回一个月内每天的流水，按每月31天算
     *             false:返回一年内每个月的流水，按每年12个月算
     * @return 包装商品/服务名和与之对应的数组
     */
    private Map<String, double[]> convertMap(List<Map<String, String>> list, boolean tag)
    {
        String s = tag ? "day" : "month";
        int l = tag ? 31 : 12;
        Map<String, double[]> result = new HashMap<>();
        Map<String, Map<String, String>> tmp = new HashMap<>();

        for (Map<String, String> map : list) {
            String name = map.get("name");
            Map<String, String> tmp2 = tmp.get(name);
            if (tmp2 == null) {
                tmp2 = new HashMap<>();
                tmp2.put(map.get(s), map.get("sum"));
                tmp.put(name, tmp2);
            } else {
                tmp2.put(map.get(s), map.get("sum"));
            }
        }

        for (String key : tmp.keySet()) {
            Map<String, String> map = tmp.get(key);
            double[] d = new double[l];
            for (int i = 0; i < l; i++) {
                String sum = map.get(String.valueOf(i + 1));
                if (sum == null)
                    d[i] = 0;
                else
                    d[i] = Double.parseDouble(sum);
            }
            result.put(key, d);
        }
        return result;
    }

    /**
     * double数组相加
     *
     * @param d1
     * @param d2
     * @return
     */
    private double[] addArray(double[] d1, double[] d2)
    {
        int l = d1.length;
        double[] result = new double[l];
        for (int i = 0; i < l; i++)
        {
            result[i] = d1[i] + d2[i];
        }
        return result;
    }

    /**
     * 转化成Highcharts需要的格式
     *
     * @param name
     * @param d
     * @return
     */
    private String dataFormat(String name, double[] d)
    {
        StringBuilder str = new StringBuilder();
        for (double v : d)
        {
            str.append(",").append(v);
        }
        return "{ name: '" + name + "', data: [" + str.toString().substring(1) + "]},";
    }

    /**
     * 转化成Highcharts需要的格式
     *
     * @param name
     * @param s
     * @return
     */
    private String dataFormat(String name, String[] s)
    {
        StringBuilder str = new StringBuilder();
        for (String v : s)
        {
            str.append(",").append(v);
        }
        if(str.length()==0)
            return "{ name: '" + name + "', data: []},";
        return "{ name: '" + name + "', data: [" + str.toString().substring(1) + "]},";
    }

    /***************************************************新的处理逻辑************************************************************/
    /**
     * 新的处理用户流水报表函数
     * <p>
     * --1.本月/年度总消费数额(文本数据必须在一个明显直接的位置显示)
     * 生涯所有总消费数额统计(标准同上)
     * <p>
     * --2.本月消费记录(表格,详细显示每一笔交易的时间,额度,消费去向(比如商品或服务))
     *
     * @throws Exception
     */
    private void dealWithUser2() throws Exception
    {
        Map<String, Object> map = new HashMap<>();
        double d1 = getSumFromList(this.getServices().query("shopSumMonth"));
        double d2 = getSumFromList(this.getServices().query("shopSumYear"));
        double d3 = getSumFromList(this.getServices().query("shopSumAll"));

        double d4 = getSumFromList(this.getServices().query("serviceSumMonth"));
        double d5 = getSumFromList(this.getServices().query("serviceSumYear"));
        double d6 = getSumFromList(this.getServices().query("serviceSumAll"));

        map.put("shopSumMonth", d1);
        map.put("shopSumYear", d2);
        map.put("shopSumAll", d3);

        map.put("serviceSumMonth", d4);
        map.put("serviceSumYear", d5);
        map.put("serviceSumAll", d6);

        map.put("sumMonth", d1 + d4);
        map.put("sumYear", d2 + d5);
        map.put("sumAll", d3 + d6);

        //1
        this.saveAttribute("map", map);
        //2
        this.saveAttribute("userMonthlyReportDetail", this.getServices().query("userMonthlyReportDetail"));
    }

    /**
     * 新的处理商铺流水报表函数
     * <p>
     * --1.表格显示本月内所有的订单(商品,交易额,时间)
     * --2.本月/年度总交易数额（钱）(文本数据必须在一个明显直接的位置显示)
     * --3.本月各商品销量及其交易额(柱状图显示),勾选某商品显示该商品的数据
     * <p>
     * --4.一年内各月份的总销量、额度图(折线图,
     * 同时在页面下方显示该月内的销量,销售额(文本))
     * --5.本月本店内所有商品的点击量(表格显示所有),表格根据销量从高到低显示所有商品
     * 名字 点击量 销售量 销售额
     *
     * @throws Exception
     */
    private void dealWithShop2() throws Exception
    {
        Map<String, Object> map = new HashMap<>();
        double d1 = getSumFromList(this.getServices().query("shopSumMonth"));
        double d2 = getSumFromList(this.getServices().query("shopSumYear"));
        double d3 = getSumFromList(this.getServices().query("shopSumAll"));

        map.put("shopSumMonth", d1);
        map.put("shopSumYear", d2);
        map.put("shopSumAll", d3);

        double[][] doubles = convert(this.getServices().query("shopYearlyReportDetail"));
        String s1 = dataFormat("销售额", doubles[0]);
        String s2 = dataFormat("销售量", doubles[1]);

        StringBuilder s3 = new StringBuilder();
        StringBuilder s4 = new StringBuilder();
        Map<String, double[][]> m1 = convertMap(this.getServices().query("queryShopForMonth2"));
        ArrayList<String> tmp = new ArrayList<>();
        for (String s : m1.keySet())
        {
            tmp.add(s);
            double[][] d = m1.get(s);
            s3.append(dataFormat(s + " 销售额", d[0]));
            s4.append(dataFormat(s + " 销售量", d[1]));
        }
        ArrayList<String> goods = getGoodsNameFormList(this.getServices().query("queryGoodsOfShop"));
        double[] zeros = new double[31];
        for (String good : goods)
        {
            if (!tmp.contains(good))
            {
                s3.append(dataFormat(good + " 销售额", zeros));
                s4.append(dataFormat(good + " 销售量", zeros));
            }
        }

        //2
        this.saveAttribute("map", map);
        //1
        this.saveAttribute("shopMonthlyReportDetail", this.getServices().query("shopMonthlyReportDetail"));
        //5
        this.saveAttribute("shopMonthlyReportDetailForGoods", this.getServices().query("shopMonthlyReportDetailForGoods"));
        //4
        this.saveAttribute("yearlySum", s1);
        this.saveAttribute("yearlyCount", s2);
        //3
        this.saveAttribute("monthlySum", s3.toString());
        this.saveAttribute("monthlyCount", s4.toString());
    }

    /**
     * 新的处理服务商流水报表函数
     * <p>
     * --1.本月所有服务订单(服务,交易额,时间)
     * --2.年度/月度总成交总成交额
     *
     * @throws Exception
     */
    private void dealWithService2() throws Exception
    {
        Map<String, Object> map = new HashMap<>();
        double d1 = getSumFromList(this.getServices().query("serviceSumMonth"));
        double d2 = getSumFromList(this.getServices().query("serviceSumYear"));
        double d3 = getSumFromList(this.getServices().query("serviceSumAll"));

        map.put("serviceSumMonth", d1);
        map.put("serviceSumYear", d2);
        map.put("serviceSumAll", d3);

        //2
        this.saveAttribute("map", map);
        //1
        this.saveAttribute("serviceMonthlyDetail", this.getServices().query("serviceMonthlyDetail"));
    }

    /**
     * 新的处理管理员的流水报表
     * <p>
     * --1.平台一年内各月总资金流动量(折线图)
     * --2.平台内一年各月商品销量,成交额(折线图)
     * --3.平台内一年各月服务订单数,成交额(折线图)
     * --4.本月平台内商品销量排名前5的店铺(柱状图)
     * --5.本月平台内商品交易额排名前5的店铺(柱状图)
     * <p>
     * --6.平台年内各月点击量总和(折线图)
     *
     * @throws Exception
     */
    private void dealWithAdmin2() throws Exception
    {
        double[][] doubles1 = convert(this.getServices().query("shopYearlyReportDetail"));
        double[][] doubles2 = convert(this.getServices().query("serviceYearlyReportDetail"));
        String s1 = dataFormat("商品销售额", doubles1[0]);
        String s2 = dataFormat("商品销售量", doubles1[1]);

        String s3 = dataFormat("服务销售额", doubles2[0]);
        String s4 = dataFormat("服务销售量", doubles2[1]);

        String s5 = dataFormat("总销售额", addArray(doubles1[0], doubles2[0]));
        String s6 = dataFormat("总销售量", addArray(doubles1[1], doubles2[1]));

        this.dto.put("tmp", "sum");
        String[][] strings1 = convert2(this.getServices().query("adminMonthlyReportDetail"), true);
        String s7 = dataFormat("销售额", strings1[1]);

        this.dto.put("tmp", "count");
        String[][] strings2 = convert2(this.getServices().query("adminMonthlyReportDetail"), false);
        String s8 = dataFormat("销售量", strings2[1]);

        double[] d1 = convert(this.getServices().query("clickCount"), false);

        //2
        this.saveAttribute("shopSum", s1);
        this.saveAttribute("shopCount", s2);
        //3
        this.saveAttribute("serviceSum", s3);
        this.saveAttribute("serviceCount", s4);
        //1
        this.saveAttribute("allSum", s5);
        this.saveAttribute("allCount", s6);
        //5
        this.saveAttribute("sum", s7);
        this.saveAttribute("sum_x", arrayToString(strings1[0]));
        //4
        this.saveAttribute("count", s8);
        this.saveAttribute("count_x", arrayToString(strings2[0]));
        //6
        this.saveAttribute("clickCount", dataFormat("点击量", d1));
    }

    /**
     * 获取list首个map里面的sum值，辅助函数
     *
     * @param list
     * @return
     */
    private double getSumFromList(List<Map<String, String>> list)
    {
        if (!list.isEmpty() && list.get(0).get("sum") != null)
            return Double.parseDouble(list.get(0).get("sum"));
        return 0;
    }

    /**
     * 将list中的sum和count提取出来
     *
     * @param list
     * @return
     */
    private double[][] convert(List<Map<String, String>> list)
    {
        double[][] result = new double[2][12];
        Map<String, Map.Entry<Object, Object>> tmp = new HashMap<>();

        for (Map<String, String> map : list)
        {
            tmp.put(map.get("month"), new AbstractMap.SimpleEntry<>(map.get("sum"), map.get("count")));
        }

        for (int i = 0; i < 12; i++)
        {
            Map.Entry<Object, Object> entry = tmp.get(String.valueOf(i + 1));
            if (entry == null)
            {
                result[0][i] = 0;
                result[1][i] = 0;
            }
            else
            {
                result[0][i] = Double.parseDouble(String.valueOf(entry.getKey()));
                result[1][i] = Double.parseDouble(String.valueOf(entry.getValue()));
            }
        }

        return result;
    }

    /**
     * 处理本月销售额/销售量排行前5的店铺
     *
     * @param list 要处理的list
     * @param tag  true是销售额，false是销售量
     * @return
     */
    private String[][] convert2(List<Map<String, String>> list, boolean tag)
    {
        String s = tag ? "sum" : "count";
        String[][] result = new String[2][list.size()];
        for (int i = 0; i < list.size(); i++)
        {
            Map<String, String> map = list.get(i);
            result[0][i] = map.get("name");
            result[1][i] = map.get(s);
        }
        return result;
    }

    /**
     * 将String数组转为String
     *
     * @param array
     * @return
     */
    private String arrayToString(String[] array)
    {
        if(array.length==0)
            return "";
        StringBuilder sb = new StringBuilder();
        for (String s : array)
            sb.append(",'").append(s).append("'");
        return sb.toString().substring(1);
    }

    /**
     * 取出list中name对应的 day对应的sum和count,0放sum,1放count
     *
     * @param list
     * @return
     */
    private Map<String, double[][]> convertMap(List<Map<String, String>> list)
    {
        Map<String, double[][]> result = new HashMap<>();
        Map<String, Map<String, Map.Entry<String, String>>> tmp = new HashMap<>();

        for (Map<String, String> map : list)
        {
            String name = map.get("name");
            Map<String, Map.Entry<String, String>> tmp2 = tmp.get(name);
            if (tmp2 == null)
            {
                tmp2 = new HashMap<>();
                tmp2.put(map.get("day"), new AbstractMap.SimpleEntry<>(map.get("sum"), map.get("count")));
                tmp.put(name, tmp2);
            }
            else
            {
                tmp2.put(map.get("day"), new AbstractMap.SimpleEntry<>(map.get("sum"), map.get("count")));
            }
        }

        for (String key : tmp.keySet())
        {
            Map<String, Map.Entry<String, String>> map = tmp.get(key);
            double[][] d = new double[2][31];
            for (int i = 0; i < 31; i++)
            {
                Map.Entry<String, String> sum = map.get(String.valueOf(i + 1));
                if (sum == null)
                {
                    d[0][i] = 0;
                    d[1][i] = 0;
                }
                else
                {
                    d[0][i] = Double.parseDouble(sum.getKey());
                    d[1][i] = Double.parseDouble(sum.getValue());
                }
            }
            result.put(key, d);
        }
        return result;
    }

    /**
     * 从list中获取商品名
     *
     * @param list
     * @return
     */
    private ArrayList<String> getGoodsNameFormList(List<Map<String, String>> list)
    {
        ArrayList<String> result = new ArrayList<>();
        for (Map<String, String> map : list)
        {
            result.add(map.get("name"));
        }
        return result;
    }
}
