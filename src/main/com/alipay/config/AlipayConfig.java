package com.alipay.config;

public class AlipayConfig {
	// 商户appid
	public static String APPID = "2016100200644692";
	// 私钥 pkcs8格式的
	public static String RSA_PRIVATE_KEY = "MIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQCkwUDX1qOpiGwT" + 
			"F1bgtrLLaXvEEvQz+eptTLJQePrtBMI2OfA1WvexPEI52E+EJlAKz4SicTygPVjA" + 
			"6LBVhsLNCJn7lksiAx7qEoQ4cxAcEXCb8BxMl/7saDSaKB9IOwdOubRDVxGHTgtK" + 
			"oOQigWonGDT7ggK3QexIyberx7mJLvbXsRLzLU+Ce8wwxoB/yBzbwDHKS3NBY8k9" + 
			"EtUHgYQRbQI5+q5ixSO1Mz7BbxZCDX+3pYer3C2gjCrbxm7K5At71+APmVtwiPjx" + 
			"dXLsstWUBclSu5rwzw6qCJo2qgfAceMpvrN8Dzg5G0CgAxhekrChmtJCKi28ftdy" + 
			"bvFfXXZrAgMBAAECggEAJUGeTDC5acjzx41rk/08iUsdNcWje210WasSV6hD9f0x" + 
			"fdm0PByKDoY146bKtHOFfixXLfS1ZPb6bwUveueyfXMIfyAJdXOHNh9hzwvIWHoLD" +
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
	// 服务器异步通知页面路径 需http://或者https://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
	public static String notify_url = "http://localhost:8080/alipay.trade.wap.pay-JAVA-UTF-8/notify_url.jsp";
	// 页面跳转同步通知页面路径 需http://或者https://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问 商户可以自定义同步跳转地址
	public static String return_url = "http://localhost:8080/ego/payFinish.html";
	// 请求网关地址
	 
	public static String URL = "https://openapi.alipaydev.com/gateway.do";
	//public static String URL = "https://openapi.alipay.com/gateway.do";
	// 编码
	public static String CHARSET = "UTF-8";
	// 返回格式
	public static String FORMAT = "json";
	// 支付宝公钥
	public static String ALIPAY_PUBLIC_KEY = "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAjrEVFMOSiNJXaRNKicQuQdsREraftDA9Tua3WNZwcpeXeh8Wrt+V9JilLqSa7N7sVqwpvv8zWChgXhX/A96hEg97Oxe6GKUmzaZRNh0cZZ88vpkn5tlgL4mH/dhSr3Ip00kvM4rHq9PwuT4k7z1DpZAf1eghK8Q5BgxL88d0X07m9X96Ijd0yMkXArzD7jg+noqfbztEKoH3kPMRJC2w4ByVdweWUT2PwrlATpZZtYLmtDvUKG/sOkNAIKEMg3Rut1oKWpjyYanzDgS7Cg3awr1KPTl9rHCazk15aNYowmYtVabKwbGVToCAGK+qQ1gT3ELhkGnf3+h53fukNqRH+wIDAQAB";
	// 日志记录目录
	public static String log_path = "/log";
	// RSA2
	public static String SIGNTYPE = "RSA2";
}
