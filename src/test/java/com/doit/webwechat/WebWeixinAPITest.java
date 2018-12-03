package com.doit.webwechat;

import com.alibaba.fastjson.JSONObject;
import org.apache.commons.httpclient.NameValuePair;
import org.apache.commons.lang.ArrayUtils;
import org.apache.commons.lang.StringUtils;
import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.client.CookieStore;
import org.apache.http.client.config.CookieSpecs;
import org.apache.http.client.config.RequestConfig;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.client.protocol.HttpClientContext;
import org.apache.http.config.ConnectionConfig;
import org.apache.http.config.Registry;
import org.apache.http.config.RegistryBuilder;
import org.apache.http.conn.socket.ConnectionSocketFactory;
import org.apache.http.conn.socket.LayeredConnectionSocketFactory;
import org.apache.http.conn.socket.PlainConnectionSocketFactory;
import org.apache.http.conn.ssl.*;
import org.apache.http.cookie.CookieSpecProvider;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.*;
import org.apache.http.impl.conn.PoolingHttpClientConnectionManager;
import org.apache.http.impl.cookie.BasicClientCookie;
import org.apache.http.impl.cookie.BestMatchSpecFactory;
import org.apache.http.impl.cookie.BrowserCompatSpecFactory;
import org.apache.http.util.EntityUtils;
import org.junit.Before;
import org.junit.Test;

import javax.net.ssl.SSLContext;
import java.io.*;
import java.net.URLEncoder;
import java.nio.charset.Charset;
import java.security.KeyManagementException;
import java.security.KeyStore;
import java.security.KeyStoreException;
import java.security.NoSuchAlgorithmException;
import java.util.*;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Created by mushan on 2017-09-05.
 */
public class WebWeixinAPITest {

    String sessionUrl = "https://login.weixin.qq.com/jslogin";
    String qrcodeUrl = "https://login.weixin.qq.com/qrcode/";
    String loginTestUrl = "https://login.weixin.qq.com/cgi-bin/mmwebwx-bin/login";
    String initWxUsageUrl = "https://wx.qq.com/cgi-bin/mmwebwx-bin/webwxinit";
    String webwxgetcontactUrl = "https://wx.qq.com/cgi-bin/mmwebwx-bin/webwxgetcontact";

    @Before
    public void init() {
        System.setProperty("jsse.enableSNIExtension", "false");
    }

    @Test
    public void testLogin() {

        CloseableHttpClient closeableHttpClient = null;

        try {
            System.setProperty("jsse.enableSNIExtension", "false");

            CookieStore cookieStore = new BasicCookieStore();

            closeableHttpClient = getHttpClient(cookieStore);

//            DefaultHttpClient httpClient = (DefaultHttpClient) getHttpsClient();

            String url = sessionUrl + "?" +
                    "appid=" + URLEncoder.encode("wx782c26e4c19acffb", "utf-8") +
                    "&redirect_uri=" + URLEncoder.encode("https://wx.qq.com/cgi-bin/mmwebwx-bin/webwxnewloginpage", "utf-8") +
                    "&fun=new" +
                    "&lang=" + "zh_CN" +
                    "&_=" + System.currentTimeMillis();

            HttpGet httpGet = new HttpGet(url);

            RequestConfig requestConfig = RequestConfig.custom().setConnectionRequestTimeout(20 * 1000).setSocketTimeout(20 * 1000).build();

            httpGet.setConfig(requestConfig);

            //设置编码
            CloseableHttpResponse httpResponse = closeableHttpClient.execute(httpGet);
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
            httpGet.setConfig(requestConfig);

            httpResponse = closeableHttpClient.execute(httpGet);
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

                    httpGet = new HttpGet(testLoginUrl1 + String.valueOf(System.currentTimeMillis()));
                    httpGet.setConfig(requestConfig);

                    httpResponse = closeableHttpClient.execute(httpGet);
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

                    httpGet = new HttpGet(testLoginUrl2 + String.valueOf(System.currentTimeMillis()));
                    httpGet.setConfig(requestConfig);

                    httpResponse = closeableHttpClient.execute(httpGet);
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
            httpGet.setConfig(requestConfig);

            httpResponse = closeableHttpClient.execute(httpGet);

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
//            webWxInitWx(cookieStore, wxSession);
//            webWxGetContracts(cookieStore , wxSession);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (closeableHttpClient != null) {
                try {
                    closeableHttpClient.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }

    public boolean webWxInitSession(CookieStore cookieStore, Map<String, String> wxSession) {

        CloseableHttpClient closeableHttpClient = null;

        try {
            if (cookieStore == null){
                cookieStore = new BasicCookieStore();
            }

            closeableHttpClient = getHttpClient(cookieStore);

//            DefaultHttpClient httpClient = (DefaultHttpClient) getHttpsClient();

            String url = sessionUrl + "?" +
                    "appid=" + URLEncoder.encode("wx782c26e4c19acffb", "utf-8") +
                    "&redirect_uri=" + URLEncoder.encode("https://wx.qq.com/cgi-bin/mmwebwx-bin/webwxnewloginpage", "utf-8") +
                    "&fun=new" +
                    "&lang=" + "zh_CN" +
                    "&_=" + String.valueOf(System.currentTimeMillis());

            HttpGet httpGet = new HttpGet(url);

            RequestConfig requestConfig = RequestConfig.custom().setConnectionRequestTimeout(20 * 1000).setSocketTimeout(20 * 1000).build();

            httpGet.setConfig(requestConfig);

            //设置编码
            CloseableHttpResponse httpResponse = closeableHttpClient.execute(httpGet);
            //发送Post,并返回一个HttpResponse对象
            //Header header = response.getFirstHeader("Content-Length");
            //String Length=header.getValue();
            // 上面两行可以得到指定的Header
            int statusCode = httpResponse.getStatusLine().getStatusCode();

            try {
                HttpEntity entity = httpResponse.getEntity();

                String result = EntityUtils.toString(entity, "utf-8");

                System.out.println("statusCode=" + statusCode);
                System.out.println("result=" + result);

                if (statusCode != 200) { //如果状态码为200,就是正常返回
                    System.err.println("sessionUrl 返回状态不正常 statusCode=" + statusCode);
                    return false;
                }

                System.out.println("result=" + result);
                String[] arr = result.split(";");
                if (ArrayUtils.getLength(arr) < 2) {
                    System.err.println("返回结果格式异常！result=" + result);
                    return false;
                }
                String window_QRLogin_code = StringUtils.trim(StringUtils.substring(arr[0], StringUtils.indexOf(arr[0], "=") + 1));
                String window_QRLogin_uuid = StringUtils.trim(StringUtils.substring(arr[1], StringUtils.indexOf(arr[1], "=") + 1));
                window_QRLogin_uuid = StringUtils.substring(window_QRLogin_uuid, 1, StringUtils.length(window_QRLogin_uuid) - 1);

                System.out.println("window.QRLogin.code = " + window_QRLogin_code);
                System.out.println("window.QRLogin.uuid = " + window_QRLogin_uuid);

                wxSession.put("window.QRLogin.code", window_QRLogin_code);
                wxSession.put("window.QRLogin.uuid", window_QRLogin_uuid);

            } finally {
                httpResponse.close();
            }

            return true;
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (closeableHttpClient != null) {
                try {
                    closeableHttpClient.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }

        return false;
    }

    public boolean webWxGetQrcodeImage(CookieStore cookieStore, Map<String, String> wxSession) {

        CloseableHttpClient closeableHttpClient = null;

        try {
            if (cookieStore == null){
                cookieStore = new BasicCookieStore();
            }

            closeableHttpClient = getHttpClient(cookieStore);

//            DefaultHttpClient httpClient = (DefaultHttpClient) getHttpsClient();
            String window_QRLogin_uuid = wxSession.get("window.QRLogin.uuid");

            String url = qrcodeUrl + window_QRLogin_uuid + "?" + "t=webwx";

            HttpGet httpGet = new HttpGet(url);

            RequestConfig requestConfig = RequestConfig.custom().setConnectionRequestTimeout(20 * 1000).setSocketTimeout(20 * 1000).build();

            httpGet.setConfig(requestConfig);

            //设置编码
            CloseableHttpResponse httpResponse = closeableHttpClient.execute(httpGet);
            //发送Post,并返回一个HttpResponse对象
            //Header header = response.getFirstHeader("Content-Length");
            //String Length=header.getValue();
            // 上面两行可以得到指定的Header
            int statusCode = httpResponse.getStatusLine().getStatusCode();

            try {
                HttpEntity entity = httpResponse.getEntity();

                System.out.println("statusCode=" + statusCode);

                if (statusCode != 200) { //如果状态码为200,就是正常返回
                    System.err.println("sessionUrl 返回状态不正常 statusCode=" + statusCode);
                    return false;
                }

                String qrcodeFile = "f:\\temp\\qrcodeimg.jpg";

                // 保存二维码图片
                FileOutputStream fileOutputStream = new FileOutputStream(new File(qrcodeFile));
                InputStream inputStream = entity.getContent();
                byte[] buffer = new byte[1024];
                int len = 0;
                while ((len = inputStream.read(buffer)) > 0) {
                    fileOutputStream.write(buffer, 0, len);
                }

                inputStream.close();
                fileOutputStream.close();

            } finally {
                httpResponse.close();
            }

            return true;
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (closeableHttpClient != null) {
                try {
                    closeableHttpClient.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }

        return false;
    }

    public boolean webWxLoginActionDetect(CookieStore cookieStore, Map<String, String> wxSession) {

        CloseableHttpClient closeableHttpClient = null;

        try {
            if (cookieStore == null){
                cookieStore = new BasicCookieStore();
            }

            closeableHttpClient = getHttpClient(cookieStore);

            // 监控网页客户端
            boolean loginFlag = false;
            int tryCount = 0;

            String window_QRLogin_uuid = wxSession.get("window.QRLogin.uuid");

            String testLoginUrl1 = loginTestUrl + "?uuid=" + window_QRLogin_uuid + "&tip=1&_";

            while (!loginFlag && tryCount < 500) {

                CloseableHttpResponse httpResponse = null;

                try {
                    tryCount++;
                    System.out.println("验证手机端是否识别成功。。。第" + tryCount + "次");

                    HttpGet httpGet = new HttpGet(testLoginUrl1 + String.valueOf(System.currentTimeMillis()));

                    RequestConfig requestConfig = RequestConfig.custom().setConnectionRequestTimeout(20 * 1000).setSocketTimeout(20 * 1000).build();
                    httpGet.setConfig(requestConfig);

                    httpResponse = closeableHttpClient.execute(httpGet);
                    int statusCode = httpResponse.getStatusLine().getStatusCode();
                    String result = EntityUtils.toString(httpResponse.getEntity(), "utf-8");

                    System.out.println("statusCode = " + statusCode);
                    System.out.println("result = " + result);

                    if (statusCode == 200) {
                        System.out.println("检测到手机端已经识别! ");

                        loginFlag = true;
                        break;
                    } else if (statusCode == 408) {
                        System.err.println("验证手机端是否识别成功 statuscode=" + statusCode);
                    } else {
                        System.err.println("验证手机端是否识别成功 statuscode=" + statusCode);
                    }

                } catch (Exception ex) {
                    ex.printStackTrace();
                } finally {
                    if(httpResponse != null){
                        try {
                            httpResponse.close();
                        } catch (IOException e) {
                            e.printStackTrace();
                        }
                    }
                }

                Thread.sleep(1500);
            }

            return loginFlag;
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (closeableHttpClient != null) {
                try {
                    closeableHttpClient.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }

        return false;
    }

    public boolean webWxLoginActionConfirm(CookieStore cookieStore, Map<String, String> wxSession) {

        CloseableHttpClient closeableHttpClient = null;

        try {
            if (cookieStore == null){
                cookieStore = new BasicCookieStore();
            }

            closeableHttpClient = getHttpClient(cookieStore);

            // 监控网页客户端
            boolean loginFlag = false;
            int tryCount = 0;

            String window_QRLogin_uuid = wxSession.get("window.QRLogin.uuid");

            String testLoginUrl2 = loginTestUrl + "?uuid=" + window_QRLogin_uuid + "&tip=0&_";

            while (!loginFlag && tryCount < 500) {

                CloseableHttpResponse httpResponse = null;

                try {
                    tryCount++;
                    System.out.println("验证手机端是否登陆。。。第" + tryCount + "次");

                    HttpGet httpGet = new HttpGet(testLoginUrl2 + String.valueOf(System.currentTimeMillis()));

                    RequestConfig requestConfig = RequestConfig.custom().setConnectionRequestTimeout(20 * 1000).setSocketTimeout(20 * 1000).build();
                    httpGet.setConfig(requestConfig);

                    httpResponse = closeableHttpClient.execute(httpGet);
                    int statusCode = httpResponse.getStatusLine().getStatusCode();
                    String result = EntityUtils.toString(httpResponse.getEntity(), "utf-8");

                    System.out.println("statusCode = " + statusCode);
                    System.out.println("result = " + result);

                    if (statusCode == 200) {
                        loginFlag = true;

                        String[] arr = result.split(";");
                        String window_code = StringUtils.trim(StringUtils.substring(arr[0], StringUtils.indexOf(arr[0], "=") + 1));
                        String window_redirect_uri = StringUtils.trim(StringUtils.substring(arr[1], StringUtils.indexOf(arr[1], "=") + 1));
                        window_redirect_uri = StringUtils.substring(window_redirect_uri, 1, StringUtils.length(window_redirect_uri) - 1);
                        wxSession.put("window_redirect_uri", window_redirect_uri);

                        System.out.println("检测到手机端已经登陆, window_redirect_uri=" + window_redirect_uri);

                        break;
                    } else if (statusCode == 408) {
                        System.err.println("验证是否登陆 statuscode=" + statusCode);
                    } else {
                        System.err.println("验证是否登陆 statuscode=" + statusCode);
                    }

                } catch (Exception ex) {
                    ex.printStackTrace();
                } finally {
                    if(httpResponse != null){
                        try {
                            httpResponse.close();
                        } catch (IOException e) {
                            e.printStackTrace();
                        }
                    }
                }

                Thread.sleep(1500);
            }

            return loginFlag;
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (closeableHttpClient != null) {
                try {
                    closeableHttpClient.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }

        return false;
    }

    public boolean webWxLogin(CookieStore cookieStore, Map<String, String> wxSession) {

        CloseableHttpClient closeableHttpClient = null;

        try {
            if (cookieStore == null){
                cookieStore = new BasicCookieStore();
            }

            closeableHttpClient = getHttpClient(cookieStore);

            //          访问登录地址，获得uin和sid
            String window_redirect_uri = wxSession.get("window_redirect_uri");
            if (StringUtils.isBlank(window_redirect_uri)) {
                System.err.println("window_redirect_uri 为空！不继续处理");
                return false;
            }

            HttpGet httpGet = new HttpGet(window_redirect_uri + "&fun=new&version=v2&lang=zh_CN");
            RequestConfig requestConfig = RequestConfig.custom().setConnectionRequestTimeout(20 * 1000).setSocketTimeout(20 * 1000).build();
            httpGet.setConfig(requestConfig);

            CloseableHttpResponse httpResponse = closeableHttpClient.execute(httpGet);

            int statusCode = httpResponse.getStatusLine().getStatusCode();
            if (statusCode != 200) {
                System.err.println("访问 " + window_redirect_uri + " 失败 返回状态不正常 statusCode=" + statusCode);
                return false;
            }

            HttpEntity httpEntity = httpResponse.getEntity();
            String result = EntityUtils.toString(httpEntity, "utf-8");
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

            String skey = match("<skey>(\\S+)</skey>", result);
            String pass_ticket = match("<pass_ticket>(\\S+)</pass_ticket>", result);
            String wxuin = match("<wxuin>(\\S+)</wxuin>", result);
            String wxsid = match("<wxsid>(\\S+)</wxsid>", result);

            wxSession.put("skey", skey);
            wxSession.put("pass_ticket", pass_ticket);
            wxSession.put("wxuin", wxuin);
            wxSession.put("wxsid", wxsid);

            System.out.println("获取 wxuin = " + wxSession.get("wxuin") + " wxsid = " + wxSession.get("wxsid") + " skey = " + wxSession.get("skey") + " pass_ticket = " + wxSession.get("pass_ticket"));

            return true;
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (closeableHttpClient != null) {
                try {
                    closeableHttpClient.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }

        return false;
    }

    @Test
    public void 测试全部流程() {
        try {
            Map<String, String> wxSession = new HashMap<>();
            CookieStore cookieStore = new BasicCookieStore();
            boolean result = webWxInitSession(cookieStore, wxSession);
            if (result) {
                System.out.println("code=" + wxSession.get("window.QRLogin.code"));
                System.out.println("uuid=" + wxSession.get("window.QRLogin.uuid"));

                result = webWxGetQrcodeImage(cookieStore, wxSession);
                if (result) {
                    System.out.println("二维码图片已经成功获得！");


                    if (! webWxLoginActionDetect(cookieStore, wxSession)){
                        System.err.println("检测用户手机端操作失败！");
                        return;
                    }

                    if (!webWxLoginActionConfirm(cookieStore, wxSession) ){
                        System.err.println("未检测到用户手机端登陆！");
                        return;
                    }

//                    CloseableHttpClient httpClient = getHttpClient(cookieStore);

                    cookieStore = new BasicCookieStore();

                    if (!webWxLogin(cookieStore, wxSession)){
                        System.err.println("登陆失败！");
                        return;
                    }

                    Map<String, Object> wxData = new HashMap<>();

                    if (! webWxInitWx(cookieStore, wxSession, wxData)){
                        System.err.println("初始化微信登陆使用失败！");
                    }

                    if (! webWxGetContracts(cookieStore, wxSession, wxData)){
                        System.err.println("获取微信联系人信息失败！");
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

// cookie [wxsid] = [G5ObsvwlFfL7exUs] path = /
// cookie [wxuin] = [904878774] path = /
    public boolean webWxInitWx(CookieStore cookieStore, Map<String, String> wxSession, Map<String, Object> wxData) {
        // 初始化微信信息
        CloseableHttpClient closeableHttpClient = null;

        try {

            if (cookieStore == null){
                cookieStore = new BasicCookieStore();
            }

            closeableHttpClient = getHttpClient(cookieStore);

            String r = String.valueOf(System.currentTimeMillis());
//            String url = String.format(initWxUsageUrl + "?r=%s&lang=zh_CN&pass_ticket=%s", r, wxSession.get("pass_ticket"));
            String url = String.format(initWxUsageUrl + "?r=%s&pass_ticket=%s", r, wxSession.get("pass_ticket"));
//            String url = String.format(initWxUsageUrl);

            RequestConfig requestConfig = RequestConfig.custom().setConnectionRequestTimeout(200 * 1000).setSocketTimeout(200 * 1000).build();

            HttpPost httpPost = new HttpPost(url);

            httpPost.setConfig(requestConfig);

//            PostMethod postMethod = new PostMethod(url);
//            httpPost.getParams().setParameter("r", r);
//            httpPost.getParams().setParameter("lang", "zh_CN");
//            httpPost.getParams().setParameter("pass_ticket", wxSession.get("pass_ticket"));

//            httpPost.setHeader("charset", "UTF-8");
            httpPost.setHeader("Content-Type", "application/json;charset=UTF-8");

            JSONObject jsonObject = new JSONObject();
            JSONObject baseRequest = new JSONObject();
            baseRequest.put("Uin", wxSession.get("wxuin"));
            baseRequest.put("Sid", wxSession.get("wxsid"));
            baseRequest.put("Skey", wxSession.get("skey"));

//            String deviceId = String.valueOf(Math.abs(new Random().nextLong()));
//            deviceId = StringUtils.substring(deviceId, 0, 10);
            baseRequest.put("DeviceID", "e1615250492");

            jsonObject.put("BaseRequest", baseRequest);
            StringEntity stringEntity = new StringEntity(jsonObject.toJSONString());
            System.out.println("entity=" + jsonObject.toJSONString());
//            RequestEntity requestEntity = new StringRequestEntity(jsonObject.toJSONString(), "application/json", "UTF-8");
//            postMethod.setRequestEntity(requestEntity);

            httpPost.setEntity(stringEntity);



            CloseableHttpResponse httpResponse = closeableHttpClient.execute(httpPost);

//            httpClient.execute(postMethod);

            int statusCode = httpResponse.getStatusLine().getStatusCode();
            if (statusCode != 200) {
                System.err.println("访问 " + initWxUsageUrl + " 失败 返回状态不正常 statusCode=" + statusCode);
                return false;
            }

            HttpEntity entity1 = httpResponse.getEntity();

            String result = EntityUtils.toString(entity1, "utf-8");

            parseUserInfo(result, wxSession, wxData);
            System.out.println("返回结果=" + result);

            return true;
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (closeableHttpClient != null){
                    closeableHttpClient.close();
                }
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        return false;
    }

    public void parseUserInfo(String responseText, Map<String, String> wxSession, Map<String, Object> wxData){
        JSONObject jsonObject = JSONObject.parseObject(responseText);
        JSONObject userInfo = jsonObject.getJSONObject("User");
        JSONObject syncKey = jsonObject.getJSONObject("SyncKey");

        wxSession.put("UserName", userInfo.getString("UserName"));
        wxSession.put("NickName", userInfo.getString("NickName"));

        wxData.put("SyncKey", syncKey);
        wxData.put("UserInfo", userInfo);
    }


    public boolean webWxGetContracts(CookieStore cookieStore, Map<String, String> wxSession, Map<String, Object> wxData) {
        // 初始化微信信息
        CloseableHttpClient closeableHttpClient = null;

        try {

            if (cookieStore == null){
                cookieStore = new BasicCookieStore();
            }

            closeableHttpClient = getHttpClient(cookieStore);

            System.out.println("获取好友列表");
            String r = String.valueOf(System.currentTimeMillis());
            String url = String.format(webwxgetcontactUrl + "?pass_ticket=%s&r=%s&seq=0&skey=%s", wxSession.get("pass_ticket"), r, wxSession.get("skey"));
            HttpGet httpGet = new HttpGet(url);

            RequestConfig requestConfig = RequestConfig.custom().setConnectionRequestTimeout(20 * 1000).setSocketTimeout(20 * 1000).build();
            httpGet.setConfig(requestConfig);
            httpGet.setHeader("Content-Type", "application/json;charset=UTF-8");

            CloseableHttpResponse httpResponse = closeableHttpClient.execute(httpGet);

            int statusCode = httpResponse.getStatusLine().getStatusCode();
            if (statusCode != 200) {
                System.err.println("访问 " + initWxUsageUrl + " 失败 返回状态不正常 statusCode=" + statusCode);
                return false;
            }

            HttpEntity entity = httpResponse.getEntity();
            String result = EntityUtils.toString(entity, "utf-8");
            System.out.println("返回结果=" + result);
//            CookieStore cookieStore = httpClient.getCookieStore();
//            List<Cookie> cookies = cookieStore.getCookies();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        finally {
            try {
                if (closeableHttpClient != null){
                    closeableHttpClient.close();
                }
            } catch (IOException e) {
                e.printStackTrace();
            }
        }

        return false;
    }

    private CloseableHttpClient getHttpClient2(CookieStore cookieStore) throws Exception {

        SSLContext sslContext = new SSLContextBuilder().loadTrustMaterial(null, new TrustStrategy() {
            @Override
            public boolean isTrusted(java.security.cert.X509Certificate[] x509Certificates, String s) throws java.security.cert.CertificateException {
                return true;
            }
        }).build();

        SSLConnectionSocketFactory sslConnectionSocketFactory = new SSLConnectionSocketFactory(sslContext, new AllowAllHostnameVerifier());

//        TrustManager[] tm = {new MyX509TrustManager()};
//        SSLContext sslContext = SSLContext.getInstance("TLS");
//        sslContext.init(null, tm, new java.security.SecureRandom());

//        SSLConnectionSocketFactory socketFactory = new SSLConnectionSocketFactory(sslContext, new AllowAllHostnameVerifier());

        RequestConfig requestConfig = RequestConfig.custom().setConnectionRequestTimeout(20 * 1000).setSocketTimeout(20 * 1000).build();

        if (cookieStore == null){
            cookieStore = new BasicCookieStore();
        }
//        CookieStore cookieStore = new BasicCookieStore();

        CloseableHttpClient httpclient = HttpClients.custom()
//                .setSslcontext(sslContext)
//                .setDefaultRequestConfig(requestConfig)
                .setSSLSocketFactory(sslConnectionSocketFactory)
                .setDefaultCookieStore(cookieStore)
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

    public static List<NameValuePair> getParam(Map parameterMap) {
        List<NameValuePair> param = new ArrayList<NameValuePair>();
        Iterator it = parameterMap.entrySet().iterator();
        while (it.hasNext()) {
            Map.Entry parmEntry = (Map.Entry) it.next();
            param.add(new NameValuePair((String) parmEntry.getKey(),
                    (String) parmEntry.getValue()));
        }
        return param;
    }

    public static void setContext(CookieStore cookieStore) {
        System.out.println("----setContext");
        HttpClientContext context = HttpClientContext.create();
        Registry<CookieSpecProvider> registry = RegistryBuilder
                .<CookieSpecProvider>create()
                .register(CookieSpecs.BEST_MATCH, new BestMatchSpecFactory())
                .register(CookieSpecs.BROWSER_COMPATIBILITY,
                        new BrowserCompatSpecFactory()).build();
        context.setCookieSpecRegistry(registry);
        context.setCookieStore(cookieStore);
    }

    public static void setCookieStore(HttpResponse httpResponse) {
        System.out.println("----setCookieStore");
        CookieStore cookieStore = new BasicCookieStore();
        // JSESSIONID
        String setCookie = httpResponse.getFirstHeader("Set-Cookie")
                .getValue();
        String JSESSIONID = setCookie.substring("JSESSIONID=".length(),
                setCookie.indexOf(";"));
        System.out.println("JSESSIONID:" + JSESSIONID);
        // 新建一个Cookie
        BasicClientCookie cookie = new BasicClientCookie("JSESSIONID",
                JSESSIONID);
        cookie.setVersion(0);
        cookie.setDomain("127.0.0.1");
        cookie.setPath("/CwlProClient");
        // cookie.setAttribute(ClientCookie.VERSION_ATTR, "0");
        // cookie.setAttribute(ClientCookie.DOMAIN_ATTR, "127.0.0.1");
        // cookie.setAttribute(ClientCookie.PORT_ATTR, "8080");
        // cookie.setAttribute(ClientCookie.PATH_ATTR, "/CwlProWeb");
        cookieStore.addCookie(cookie);
    }

    private static CloseableHttpClient getHttpClient() {
        return getHttpClient(null);
    }

    private static CloseableHttpClient getHttpClient(CookieStore cookieStore) {
        RegistryBuilder<ConnectionSocketFactory> registryBuilder = RegistryBuilder.<ConnectionSocketFactory>create();
        ConnectionSocketFactory plainSF = new PlainConnectionSocketFactory();
        registryBuilder.register("http", plainSF);

        //指定信任密钥存储对象和连接套接字工厂
        try {
            KeyStore trustStore = KeyStore.getInstance(KeyStore.getDefaultType());
            //信任任何链接
            TrustStrategy anyTrustStrategy = new TrustStrategy() {
                @Override
                public boolean isTrusted(java.security.cert.X509Certificate[] x509Certificates, String s) throws java.security.cert.CertificateException {
                    return true;
                }
            };
            SSLContext sslContext = SSLContexts.custom().useTLS().loadTrustMaterial(trustStore, anyTrustStrategy).build();
            LayeredConnectionSocketFactory sslSF = new SSLConnectionSocketFactory(sslContext, SSLConnectionSocketFactory.ALLOW_ALL_HOSTNAME_VERIFIER);
            registryBuilder.register("https", sslSF);
        } catch (KeyStoreException e) {
            throw new RuntimeException(e);
        } catch (KeyManagementException e) {
            throw new RuntimeException(e);
        } catch (NoSuchAlgorithmException e) {
            throw new RuntimeException(e);
        }

        Registry<ConnectionSocketFactory> registry = registryBuilder.build();
        //设置连接管理器
        PoolingHttpClientConnectionManager connManager = new PoolingHttpClientConnectionManager(registry);
//        ConnectionConfig connectionConfig = ConnectionConfig.custom().setBufferSize(1024).setCharset(Charset.forName("UTF-8")).build();
//        connManager.setDefaultConnectionConfig(connectionConfig);

//      connManager.setDefaultSocketConfig(socketConfig);

        //构建客户端
        if (cookieStore == null){
            cookieStore = new BasicCookieStore();
        }
        return HttpClientBuilder.create().setConnectionManager(connManager).setDefaultCookieStore(cookieStore).build();
    }
}
