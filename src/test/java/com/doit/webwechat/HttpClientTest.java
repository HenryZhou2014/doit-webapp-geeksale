package com.doit.webwechat;

import com.alibaba.fastjson.JSONObject;
import org.apache.commons.lang.StringUtils;
import org.apache.http.HttpEntity;
import org.apache.http.client.CookieStore;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.config.ConnectionConfig;
import org.apache.http.config.Registry;
import org.apache.http.config.RegistryBuilder;
import org.apache.http.conn.socket.ConnectionSocketFactory;
import org.apache.http.conn.socket.LayeredConnectionSocketFactory;
import org.apache.http.conn.socket.PlainConnectionSocketFactory;
import org.apache.http.conn.ssl.SSLConnectionSocketFactory;
import org.apache.http.conn.ssl.SSLContexts;
import org.apache.http.conn.ssl.TrustStrategy;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.BasicCookieStore;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.impl.conn.PoolingHttpClientConnectionManager;
import org.apache.http.util.EntityUtils;
import org.junit.Test;

import javax.net.ssl.SSLContext;
import java.net.URLEncoder;
import java.nio.charset.Charset;
import java.security.KeyManagementException;
import java.security.KeyStore;
import java.security.KeyStoreException;
import java.security.NoSuchAlgorithmException;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;

/**
 * Created by mushan on 2017-09-06.
 */
public class HttpClientTest {

    String initWxUsageUrl = "http://localhost:8088/httpclient/httppost";

    @Test
    public void p1(){
        CookieStore cookieStore = new BasicCookieStore();

        CloseableHttpClient closeableHttpClient = getHttpClient2(cookieStore);

        Map<String, String> wxSession = new HashMap<>();
        wxSession.put("pass_ticket", "W7or4wItak8rdD0FUpQPSqC95GRLRfoI9vtJbnJkF1Y0Sbut4lPRn2l89lvT3Kz3");
        wxSession.put("wxuin", "2528748522");
        wxSession.put("wxsid", "aidG30Y/mcynEpyd");
        wxSession.put("skey", "@crypt_c808db4c_44d2ffc29538ea7f724da6a45706afca");
        boolean result = webWxInitWx(closeableHttpClient, cookieStore, wxSession);
        System.out.println("result=" + result);

    }

    public boolean webWxInitWx(CloseableHttpClient closeableHttpClient, CookieStore cookieStore, Map<String, String> wxSession) {
        // 初始化微信信息
//        CloseableHttpClient closeableHttpClient = null;

        try {

            if (cookieStore == null){
                cookieStore = new BasicCookieStore();
            }

//            closeableHttpClient = getHttpClient(cookieStore);

            String r = "" + new Date().getTime();
            String url = String.format(initWxUsageUrl + "?r=%s&lang=zh_CN&pass_ticket=%s", r, URLEncoder.encode(wxSession.get("pass_ticket"), "utf-8"));
//            String url = String.format(initWxUsageUrl + "?r=%s&pass_ticket=%s", r, URLEncoder.encode(wxSession.get("pass_ticket"), "utf-8"));
//            String url = String.format(initWxUsageUrl);

//            RequestConfig requestConfig = RequestConfig.custom().setConnectionRequestTimeout(200 * 1000).setSocketTimeout(200 * 1000).build();

            HttpPost httpPost = new HttpPost(url);

//            httpPost.setConfig(requestConfig);

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
            String deviceId = String.valueOf(Math.abs(new Random().nextLong()));
            deviceId = StringUtils.substring(deviceId, 0, 10);
            baseRequest.put("DeviceID", "e" + deviceId);

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
            System.out.println("返回结果=" + result);

            return true;
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            /*try {
                if (closeableHttpClient != null){
                    closeableHttpClient.close();
                }
            } catch (IOException e) {
                e.printStackTrace();
            }*/
        }
        return false;
    }


    private static CloseableHttpClient getHttpClient2(CookieStore cookieStore) {
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
        ConnectionConfig connectionConfig = ConnectionConfig.custom().setBufferSize(1024).setCharset(Charset.forName("UTF-8")).build();
        connManager.setDefaultConnectionConfig(connectionConfig);

//      connManager.setDefaultSocketConfig(socketConfig);
        //构建客户端
        if (cookieStore == null){
            cookieStore = new BasicCookieStore();
        }
        return HttpClientBuilder.create().setConnectionManager(connManager).setDefaultCookieStore(cookieStore).build();
    }
}
