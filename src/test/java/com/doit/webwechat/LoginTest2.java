package com.doit.webwechat;

import com.alibaba.fastjson.JSONObject;
import com.tencent.common.MyX509TrustManager;
import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.httpclient.methods.PostMethod;
import org.apache.commons.httpclient.methods.RequestEntity;
import org.apache.commons.httpclient.methods.StringRequestEntity;
import org.apache.commons.lang.ArrayUtils;
import org.apache.commons.lang.StringUtils;
import org.apache.http.HttpHost;
import org.apache.http.HttpRequest;
import org.apache.http.HttpResponse;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.CookieStore;
import org.apache.http.client.HttpClient;
import org.apache.http.client.config.RequestConfig;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.conn.ClientConnectionManager;
import org.apache.http.conn.scheme.Scheme;
import org.apache.http.conn.scheme.SchemeRegistry;
import org.apache.http.conn.ssl.AllowAllHostnameVerifier;
import org.apache.http.conn.ssl.SSLConnectionSocketFactory;
import org.apache.http.conn.ssl.SSLSocketFactory;
import org.apache.http.cookie.Cookie;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.params.HttpConnectionParams;
import org.apache.http.params.HttpParams;
import org.apache.http.protocol.HttpContext;
import org.apache.http.util.EntityUtils;
import org.junit.Assert;
import org.junit.Test;

import javax.net.ssl.SSLContext;
import javax.net.ssl.TrustManager;
import java.io.*;
import java.net.URLEncoder;
import java.util.*;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Created by mushan on 2017-09-05.
 */
public class LoginTest2 {

    String sessionUrl = "https://login.weixin.qq.com/jslogin";
    String qrcodeUrl = "https://login.weixin.qq.com/qrcode/";
    String loginTestUrl = "https://login.weixin.qq.com/cgi-bin/mmwebwx-bin/login";
    String initWxUsageUrl = "https://wx.qq.com/cgi-bin/mmwebwx-bin/webwxinit";
    String webwxgetcontactUrl = "https://wx.qq.com/cgi-bin/mmwebwx-bin/webwxgetcontact";

    @Test
    public void testLogin() {
        try {

            DefaultHttpClient httpClient = (DefaultHttpClient) getHttpsClient();

            String url = sessionUrl + "?" +
                    "appid=" + URLEncoder.encode("wx782c26e4c19acffb", "utf-8") +
                    "&redirect_uri=" + URLEncoder.encode("https://wx.qq.com/cgi-bin/mmwebwx-bin/webwxnewloginpage", "utf-8") +
                    "&fun=new" +
                    "&lang=" + "zh_CN" +
                    "&_=" + new Date().getTime();
            HttpGet httpGet = new HttpGet(url);

            //设置编码
            HttpResponse httpResponse = httpClient.execute(httpGet);
            //发送Post,并返回一个HttpResponse对象
            //Header header = response.getFirstHeader("Content-Length");
            //String Length=header.getValue();
            // 上面两行可以得到指定的Header
            int statusCode = httpResponse.getStatusLine().getStatusCode();

            String result = EntityUtils.toString(httpResponse.getEntity(), "utf-8");

            System.out.println("statusCode=" + statusCode);
            System.out.println("result=" + result);

            if (statusCode != 200) { //如果状态码为200,就是正常返回
                System.err.println("sessionUrl 返回状态不正常 statusCode=" + statusCode);
                return;
            }

            System.out.println("result=" + result);
            String[] arr = result.split(";");
            if (ArrayUtils.getLength(arr) < 2) {
                System.err.println("返回结果格式异常！result=" + result);
                return;
            }
            String window_QRLogin_code = StringUtils.trim(StringUtils.substring(arr[0], StringUtils.indexOf(arr[0], "=") + 1));
            String window_QRLogin_uuid = StringUtils.trim(StringUtils.substring(arr[1], StringUtils.indexOf(arr[1], "=") + 1));
            window_QRLogin_uuid = StringUtils.substring(window_QRLogin_uuid, 1, StringUtils.length(window_QRLogin_uuid) - 1);
            System.out.println("window.QRLogin.code = " + window_QRLogin_code);
            System.out.println("window.QRLogin.uuid = " + window_QRLogin_uuid);

            httpGet = new HttpGet(qrcodeUrl + window_QRLogin_uuid + "?" + "t=webwx");
            httpResponse = httpClient.execute(httpGet);
            statusCode = httpResponse.getStatusLine().getStatusCode();

            if (statusCode != 200) {
                System.err.println("qrcodeUrl 返回状态不正常 statusCode=" + statusCode);
                return;
            }

            String qrcodeFile = "f:\\temp\\qrcodeimg.jpg";

            // 保存二维码图片
            FileOutputStream fileOutputStream = new FileOutputStream(new File(qrcodeFile));
            InputStream inputStream = httpResponse.getEntity().getContent();
            byte[] buffer = new byte[1024];
            int len = 0;
            while ((len = inputStream.read(buffer)) > 0) {
                fileOutputStream.write(buffer, 0, len);
            }

            inputStream.close();
            fileOutputStream.close();

            System.out.println("二维码图片已经成功获得！file = " + qrcodeFile);

            // 监控网页客户端
            boolean loginFlag = false;
            int tryCount = 0;

            String testLoginUrl1 = loginTestUrl + "?uuid=" + window_QRLogin_uuid + "&tip=1&_";
            String testLoginUrl2 = loginTestUrl + "?uuid=" + window_QRLogin_uuid + "&tip=0&_";

            while (!loginFlag && tryCount < 500) {
                try {
                    tryCount++;
                    System.out.println("验证手机端是否识别成功。。。第" + tryCount + "次");

                    httpGet = new HttpGet(testLoginUrl1 + new Date().getTime());
                    httpResponse = httpClient.execute(httpGet);
                    statusCode = httpResponse.getStatusLine().getStatusCode();
                    result = EntityUtils.toString(httpResponse.getEntity(), "utf-8");
                    System.out.println("statusCode = " + statusCode);
                    System.out.println("result = " + result);
                    if (statusCode == 200) {
                        loginFlag = true;
                        break;
                    } else if (statusCode == 408) {
                        System.err.println("验证手机端是否识别成功 statuscode=" + statusCode);
                    } else {
                        System.err.println("验证手机端是否识别成功 statuscode=" + statusCode);
                    }

                } catch (Exception ex) {
                    ex.printStackTrace();
                }

                Thread.sleep(1500);
            }
            System.out.println("检测到手机端已经识别! ");


            String window_code = "";
            String window_redirect_uri = "";

            loginFlag = false;
            tryCount = 0;
            while (!loginFlag && tryCount < 500) {
                try {
                    tryCount++;
                    System.out.println("验证手机端是否登陆。。。第" + tryCount + "次");

                    httpGet = new HttpGet(testLoginUrl2 + new Date().getTime());
                    httpResponse = httpClient.execute(httpGet);
                    statusCode = httpResponse.getStatusLine().getStatusCode();
                    result = EntityUtils.toString(httpResponse.getEntity(), "utf-8");
                    System.out.println("statusCode = " + statusCode);
                    System.out.println("result = " + result);
                    if (statusCode == 200) {
                        arr = result.split(";");
                        window_code = StringUtils.trim(StringUtils.substring(arr[0], StringUtils.indexOf(arr[0], "=") + 1));
                        window_redirect_uri = StringUtils.trim(StringUtils.substring(arr[1], StringUtils.indexOf(arr[1], "=") + 1));
                        window_redirect_uri = StringUtils.substring(window_redirect_uri, 1, StringUtils.length(window_redirect_uri) - 1);
                        break;
                    } else if (statusCode == 408) {
                        System.err.println("验证是否登陆 statuscode=" + statusCode);
                    } else {
                        System.err.println("验证是否登陆 statuscode=" + statusCode);
                    }

                } catch (Exception ex) {
                    ex.printStackTrace();
                }

                Thread.sleep(1500);
            }

            System.out.println("检测到手机端已经登陆， window_code = " + window_code + " window_redirect_uri = " + window_redirect_uri);

//          访问登录地址，获得uin和sid
            if (StringUtils.isBlank(window_redirect_uri)) {
                System.err.println("window_redirect_uri 为空！不继续处理");
                return;
            }

            httpGet = new HttpGet(window_redirect_uri + "&fun=new&version=v2&lang=zh_CN");
            httpResponse = httpClient.execute(httpGet);

            statusCode = httpResponse.getStatusLine().getStatusCode();
            if (statusCode != 200) {
                System.err.println("访问 " + window_redirect_uri + " 失败 返回状态不正常 statusCode=" + statusCode);
                return;
            }
            result = EntityUtils.toString(httpResponse.getEntity(), "utf-8");
            System.out.println("登陆结果=" + result);
/**
 <error>
 <ret>0</ret>
 <message></message>
 <skey>@crypt_e35a2697_1b50c458eb49ab7d275ac3a67f897a7e</skey>
 <wxsid>AZKnWN16RGemHgnl</wxsid>
 <wxuin>904878774</wxuin>
 <pass_ticket>tk33ETrGsnKTy5XwEJBM2RBifLvE6mVdzp7PhckkYRW6FOU8ssf6OYK81U%2FlzbGh</pass_ticket>
 <isgrayscale>1</isgrayscale>
 </error>
 */

            Map<String, String> wxSession = new HashMap<>();

            String skey = match("<skey>(\\S+)</skey>", result);
            String pass_ticket = match("<pass_ticket>(\\S+)</pass_ticket>", result);
            String wxuin = match("<wxuin>(\\S+)</wxuin>", result);
            String wxsid = match("<wxsid>(\\S+)</wxsid>", result);

            wxSession.put("skey", skey);
            wxSession.put("pass_ticket", pass_ticket);
            wxSession.put("wxuin", wxuin);
            wxSession.put("wxsid", wxsid);

            System.out.println("获取 wxuin = " + wxSession.get("wxuin") + " wxsid = " + wxSession.get("wxsid") + " skey = " + wxSession.get("skey") + " pass_ticket = " + wxSession.get("pass_ticket"));

//            CookieStore cookieStore = httpClient.getCookieStore();
//            List<Cookie> cookies = cookieStore.getCookies();



            //
//            mm_lang
//                    webwx_auth_ticket
//                    webwx_data_ticket
//                    webwxuvid
//                    wxloadtime
//                    wxsid
//                    wxuin
            /*if (CollectionUtils.isNotEmpty(cookies)) {
                for (Cookie cookie : cookies) {
                    System.out.println("cookie [" + cookie.getName() + "] = [" + cookie.getValue() + "] path = " + cookie.getPath());
                    wxSession.put(cookie.getName() , cookie.getValue());
                }
            }*/


//            httpClient = (DefaultHttpClient) getHttpsClient();
//            httpClient.setCookieStore(cookieStore);

            initWx(httpClient, wxSession);
            initContractWx(httpClient, wxSession);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // cookie [wxsid] = [G5ObsvwlFfL7exUs] path = /
//    cookie [wxuin] = [904878774] path = /
    @Test
    public void testInitWx() {
        try {
            CloseableHttpClient httpClient = getCloseableHttpsClient();
            Map<String, String> wxSession =  new HashMap<>();
            initWx(httpClient, wxSession);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void initWx(CloseableHttpClient httpClient, Map<String, String> wxSession) {
        // 初始化微信信息
        try {
            String r = "" + new Date().getTime();
            String url = String.format(initWxUsageUrl + "?r=%s&lang=zh_CN&pass_ticket=%s", r, wxSession.get("pass_ticket"));
//            String url = initWxUsageUrl;
            HttpPost httpPost = new HttpPost(url);

            PostMethod postMethod = new PostMethod(url);
//            httpPost.getParams().setParameter("r", r);
//            httpPost.getParams().setParameter("lang", "zh_CN");
//            httpPost.getParams().setParameter("pass_ticket", wxSession.get("pass_ticket"));

//            httpPost.setHeader("charset", "UTF-8");
//            httpPost.setHeader("Content-Type", "application/json;charset=UTF-8");

            JSONObject jsonObject = new JSONObject();
            JSONObject baseRequest = new JSONObject();
            baseRequest.put("Uin", wxSession.get("wxuin"));
            baseRequest.put("Sid", wxSession.get("wxsid"));
            baseRequest.put("Skey", wxSession.get("skey"));
            baseRequest.put("DeviceID", "e" + new Random().nextLong());

            jsonObject.put("BaseRequest", baseRequest);
            StringEntity entity = new StringEntity(jsonObject.toString());
            RequestEntity requestEntity = new StringRequestEntity(jsonObject.toJSONString(), "application/json", "UTF-8");
            postMethod.setRequestEntity(requestEntity);

            httpPost.setEntity(entity);

            HttpResponse httpResponse = httpClient.execute(httpPost);

//            httpClient.execute(postMethod);

            int statusCode = httpResponse.getStatusLine().getStatusCode();
            if (statusCode != 200) {
                System.err.println("访问 " + initWxUsageUrl + " 失败 返回状态不正常 statusCode=" + statusCode);
                return;
            }
            String result = EntityUtils.toString(httpResponse.getEntity(), "utf-8");
            System.out.println("返回结果=" + result);
//            CookieStore cookieStore = httpClient.getCookieStore();
            /*List<Cookie> cookies = cookieStore.getCookies();
            for(Cookie cookie : cookies){
                System.out.println("cookie[" + cookie.getName() + "] = " + cookie.getValue());
            }*/

        } catch (Exception e) {
            e.printStackTrace();
        }
    }


    public void initContractWx(CloseableHttpClient httpClient, Map<String, String> wxSession) {
        // 初始化微信信息
        try {
            System.out.println("获取好友列表");
            String r = new Date().getTime() + "";
            String url = String.format(webwxgetcontactUrl + "?pass_ticket=%s&r=%s&seq=0&skey=%s", wxSession.get("pass_ticket"), r, wxSession.get("skey"));
            HttpGet httpGet = new HttpGet(url);

            HttpResponse httpResponse = httpClient.execute(httpGet);

            int statusCode = httpResponse.getStatusLine().getStatusCode();
            if (statusCode != 200) {
                System.err.println("访问 " + initWxUsageUrl + " 失败 返回状态不正常 statusCode=" + statusCode);
                return;
            }
            String result = EntityUtils.toString(httpResponse.getEntity(), "utf-8");
            System.out.println("返回结果=" + result);
//            CookieStore cookieStore = httpClient.getCookieStore();
//            List<Cookie> cookies = cookieStore.getCookies();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private HttpClient getHttpsClient() throws Exception {
        HttpClient httpclient = new DefaultHttpClient();

        HttpParams httpParameters = httpclient.getParams();
        HttpConnectionParams.setConnectionTimeout(httpParameters, 20 * 1000);//设置请求超时10秒
        HttpConnectionParams.setSoTimeout(httpParameters, 20 * 1000); //设置等待数据超时10秒
        HttpConnectionParams.setSocketBufferSize(httpParameters, 8192);

        TrustManager[] tm = {new MyX509TrustManager()};

//        SSLContext sslContext = SSLContext.getInstance("SSL", "SunJSSE");
        SSLContext sslContext = SSLContext.getInstance("TLS");

        sslContext.init(null, tm, new java.security.SecureRandom());
        SSLSocketFactory socketFactory = new SSLSocketFactory(sslContext, new AllowAllHostnameVerifier());
        ClientConnectionManager ccm = httpclient.getConnectionManager();

        SchemeRegistry sr = ccm.getSchemeRegistry();
        sr.register(new Scheme("https", 443, socketFactory));

        return new DefaultHttpClient(ccm, httpclient.getParams());

        /*Scheme sch = new Scheme("https", 443, socketFactory);
        httpclient.getConnectionManager().getSchemeRegistry().register(sch);

        return httpclient;*/
    }

    private CloseableHttpClient getCloseableHttpsClient() throws Exception {

        TrustManager[] tm = {new MyX509TrustManager()};
        SSLContext sslContext = SSLContext.getInstance("TLS");
        sslContext.init(null, tm, new java.security.SecureRandom());

        SSLConnectionSocketFactory socketFactory = new SSLConnectionSocketFactory(sslContext, new AllowAllHostnameVerifier());

        RequestConfig requestConfig = RequestConfig.custom().setConnectionRequestTimeout(20 * 1000).setSocketTimeout(20 * 1000).build();

        CloseableHttpClient httpclient = HttpClients.custom()
                .setSslcontext(sslContext)
                .setDefaultRequestConfig(requestConfig)
                .setSSLSocketFactory(socketFactory)
                .build();


//        HttpParams httpParameters = httpclient.getParams();
//        HttpConnectionParams.setConnectionTimeout(httpParameters, 20 * 1000);//设置请求超时10秒
//        HttpConnectionParams.setSoTimeout(httpParameters, 20 * 1000); //设置等待数据超时10秒
//        HttpConnectionParams.setSocketBufferSize(httpParameters, 8192);


//        SSLContext sslContext = SSLContext.getInstance("SSL", "SunJSSE");

        /*ClientConnectionManager ccm = httpclient.getConnectionManager();
//
        SchemeRegistry sr = ccm.getSchemeRegistry();
        sr.register(new Scheme("https", 443, socketFactory));

        httpclient.getConnectionManager().getSchemeRegistry().register(new Scheme("https", 443, socketFactory));*/

        return httpclient;

        /*Scheme sch = new Scheme("https", 443, socketFactory);
        httpclient.getConnectionManager().getSchemeRegistry().register(sch);

        return httpclient;*/
    }

    /**
     * 正则匹配
     *
     * @param p
     * @param str
     * @return
     */
    public static String match(String p, String str) {
        Pattern pattern = Pattern.compile(p);
        Matcher m = pattern.matcher(str);
        if (m.find()) {
            return m.group(1);
        }
        return null;
    }
}
