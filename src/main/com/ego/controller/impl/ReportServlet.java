package com.ego.controller.impl;

import com.ego.controller.ControllerSupport;
import com.ego.services.impl.ReportServiceImpl;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ReportServlet extends ControllerSupport
{
    public ReportServlet()
    {
        this.setServices(new ReportServiceImpl());
    }

    @Override
    public String execute() throws Exception
    {
        String path = "report/index";
        String servletPath = ((HttpServletRequest) this.dto.get("request")).getServletPath();
        String mapping = servletPath.substring(servletPath.lastIndexOf('/') + 1
                , servletPath.indexOf('.'));

        switch (mapping)
        {
            case "userReport":
                this.dealWithUser();
                break;

            case "shopperReport":
                this.dealWithShopperOrServiceProvider(true);
                break;

            case "serviceProviderReport":
                this.dealWithShopperOrServiceProvider(false);
                break;
            default:
                throw new Exception("ReportServlet无法处理此类请求:" + mapping);
        }
        return path;
    }

    /**
     * 处理用户流水报表，包括:这个月商品流水（详细到每天）
     *                      :这个月服务流水
     *                      :上个月商品流水
     *                      :上个月服务流水
     *                      :今年商品流水（详细到月）
     *                      :今年服务流水
     *                      :去年商品流水
     *                      :去年服务商流水
     *
     * 其余函数类似，商铺按商品进一步细分
     *              服务商按服务进一步细分
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
            double[] d = m1.get(s);
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

        for (Map<String, String> map : list)
        {
            String name = map.get("name");
            Map<String, String> tmp2 = tmp.get(name);
            if (tmp2 == null)
            {
                tmp2 = new HashMap<>();
                tmp2.put(map.get(s), map.get("sum"));
                tmp.put(name, tmp2);
            }
            else
            {
                tmp2.put(map.get(s), map.get("sum"));
            }
        }

        for (String key : tmp.keySet())
        {
            Map<String, String> map = tmp.get(key);
            double[] d = new double[l];
            for (int i = 0; i < l; i++)
            {
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
}
