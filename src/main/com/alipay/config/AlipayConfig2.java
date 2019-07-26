package com.alipay.config;

import java.io.FileWriter;
import java.io.IOException;

/* *
 *类名：AlipayConfig
 *功能：基础配置类
 *详细：设置帐户有关信息及返回路径
 *修改日期：2017-04-05
 *说明：
 *以下代码只是为了方便商户测试而提供的样例代码，商户可以根据自己网站的需要，按照技术文档编写,并非一定要使用该代码。
 *该代码仅供学习和研究支付宝接口使用，只是提供一个参考。
 */

public class AlipayConfig2 {
	
//↓↓↓↓↓↓↓↓↓↓请在这里配置您的基本信息↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓

	// 应用ID,您的APPID，收款账号既是您的APPID对应支付宝账号
	public static String app_id = "2016100200644692";
	
	// 商户私钥，您的PKCS8格式RSA2私钥
    public static String merchant_private_key = "MIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQCkwUDX1qOpiGwT" + 
    		"F1bgtrLLaXvEEvQz+eptTLJQePrtBMI2OfA1WvexPEI52E+EJlAKz4SicTygPVjA" + 
    		"6LBVhsLNCJn7lksiAx7qEoQ4cxAcEXCb8BxMl/7saDSaKB9IOwdOubRDVxGHTgtK" + 
    		"oOQigWonGDT7ggK3QexIyberx7mJLvbXsRLzLU+Ce8wwxoB/yBzbwDHKS3NBY8k9" + 
    		"EtUHgYQRbQI5+q5ixSO1Mz7BbxZCDX+3pYer3C2gjCrbxm7K5At71+APmVtwiPjx" + 
    		"dXLsstWUBclSu5rwzw6qCJo2qgfAceMpvrN8Dzg5G0CgAxhekrChmtJCKi28ftdy" + 
    		"bvFfXXZrAgMBAAECggEAJUGeTDC5acjzx41rk/08iUsdNcWje210WasSV6hD9f0x" + 
    		"fdm0PByKDoY146bKtHOFfixXLfS1ZPb6bwUveueyfXMIfyAJdXOHNh9hzvIWHoLD" + 
    		"GEA/5gIpH4ShAIs6J7dRe7f6z4+M4y/+1a10aWkifBy5Pnaz7oT1za/v3OSZTC/5" + 
    		"szStanh/bba/TZHOD+FT4++wjV1sfyHzkuQ9PAGv/rYlb40F9zBhjE+17B8WK6W5" + 
    		"S909lh5w2K3kHSpVHzwuTWBQ326hqthTybwQRUL+u9feiOBTVi7ozv7rN4XDhpYK" + 
    		"JelHLlOyitIYMt1QZ1yvbb63VMcxdWqwwf+JphdT4QKBgQDRcIc/jYduGnVAnIxb" + 
    		"M3kK+aX62wSPMsKBMTAyRK1Wtjkrf68fM87HvMi4w5bzwRXXp/nUSScq31HrgjJb" + 
    		"lBQX9KGbAGZou9ksE31QS/MpvGyqne/sTPZOksvyQrCYKI5883TeMp3XRhpY9JBl" + 
    		"TBL6kf0ax6AKPiL5Cks+zMU3rwKBgQDJYanrLkToAFghPC4Pb0gqC3+AKHRBME51" + 
    		"OHSQYJfbQ3c0ZG+IM3ts0VrwMdsiqfFr66DCLuJ+YeWpFTNNKI5aUNuCE0jDazQS" + 
    		"waR+pAJHmq4D0KkzH1noaOmz7vuGdT6GIpsj2wwRuNBY+GUH+rYKl6DyFKYVdOPh" + 
    		"gRPzJiqgBQKBgQCXCzB/BPLG1Q36quwOWfDRmXm6kHmZTGI6Cd9YYW8hOgnA9TS2" + 
    		"rAZUxjF8DpKu+HFoNhxWnOtCYAwUbLEkmoZjQGnL/13b6p2Uy/l0D1Iup1U3Nu/w" + 
    		"2xBHWlb7QF1bXuRj+LAwDxEGT+hwfvAkHdkSHHcM+SrSOD3AnUvm3obcwQKBgHDo" + 
    		"4kVrbtUJhGA2Brk+sp5oTfeENxJpzEOrAKgGkH4uiIKGoYYjH1u20h8ERRJdaHAS" + 
    		"79KQSQuFRigUK+xiBdabqUd4Gn7+93ZgviMHQAP3tQOMlaGFPXqyf/4Ty1DrIcBB" + 
    		"XOywn0a8cYzA0Jy1tCWiOGoiq7AyFqbUIWReDN4lAoGAWa8ncd5AtN9TF+L9HCB/" + 
    		"HAntS3Rgx0zNWliNrqq1VYmwcW+gs+9Mm16oh0A51068s0kfBAxKTzY6CL3ipI7h" + 
    		"gdYn8wjFBbyt0UXPrRG/jZ2WshCeDqDTqYsS6+ePfbelsM5iH16nUbKDtHzKdFHy" + 
    		"+HSgLVrBi69IDUxMNqDrlEk=";
	
	// 支付宝公钥,查看地址：https://openhome.alipay.com/platform/keyManage.htm 对应APPID下的支付宝公钥。
    public static String alipay_public_key = "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEApMFA19ajqYhsExdW4Lay" + 
    		"y2l7xBL0M/nqbUyyUHj67QTCNjnwNVr3sTxCOdhPhCZQCs+EonE8oD1YwOiwVYbC" + 
    		"zQiZ+5ZLIgMe6hKEOHMQHBFwm/AcTJf+7Gg0migfSDsHTrm0Q1cRh04LSqDkIoFq" + 
    		"Jxg0+4ICt0HsSMm3q8e5iS7217ES8y1PgnvMMMaAf8gc28AxyktzQWPJPRLVB4GE" + 
    		"EW0COfquYsUjtTM+wW8WQg1/t6WHq9wtoIwq28ZuyuQLe9fgD5lbcIj48XVy7LLV" + 
    		"lAXJUrua8M8OqgiaNqoHwHHjKb6zfA84ORtAoAMYXpKwoZrSQiotvH7Xcm7xX112" + 
    		"awIDAQAB";

	// 服务器异步通知页面路径  需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
	public static String notify_url = "http://localhost:8080/ego/payMoney/notify_url.jsp";

	// 页面跳转同步通知页面路径 需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
	public static String return_url = "http://localhost:8080/ego/paySuccess.html";

	// 签名方式
	public static String sign_type = "RSA2";
	
	// 字符编码格式
	public static String charset = "utf-8";
	
	// 支付宝网关
	public static String gatewayUrl = "https://openapi.alipaydev.com/gateway.do";
	
	// 支付宝网关
	public static String log_path = "C:\\";


//↑↑↑↑↑↑↑↑↑↑请在这里配置您的基本信息↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑

    /** 
     * 写日志，方便测试（看网站需求，也可以改成把记录存入数据库）
     * @param sWord 要写入日志里的文本内容
     */
    public static void logResult(String sWord) {
        FileWriter writer = null;
        try {
            writer = new FileWriter(log_path + "alipay_log_" + System.currentTimeMillis()+".txt");
            writer.write(sWord);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (writer != null) {
                try {
                    writer.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }
}

