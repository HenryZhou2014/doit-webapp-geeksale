package com.doit.webwechat;

import com.alibaba.fastjson.JSONException;
import com.alibaba.fastjson.JSONObject;
import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.httpclient.HttpStatus;
import org.apache.commons.lang.StringUtils;
import org.apache.http.Consts;
import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.client.CookieStore;
import org.apache.http.client.HttpClient;
import org.apache.http.client.config.RequestConfig;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.client.protocol.HttpClientContext;
import org.apache.http.config.Registry;
import org.apache.http.config.RegistryBuilder;
import org.apache.http.conn.socket.ConnectionSocketFactory;
import org.apache.http.conn.socket.LayeredConnectionSocketFactory;
import org.apache.http.conn.socket.PlainConnectionSocketFactory;
import org.apache.http.conn.ssl.SSLConnectionSocketFactory;
import org.apache.http.conn.ssl.SSLContexts;
import org.apache.http.conn.ssl.TrustStrategy;
import org.apache.http.cookie.Cookie;
import org.apache.http.entity.ContentType;
import org.apache.http.entity.StringEntity;
import org.apache.http.entity.mime.MultipartEntityBuilder;
import org.apache.http.entity.mime.content.FileBody;
import org.apache.http.entity.mime.content.StringBody;
import org.apache.http.impl.client.*;
import org.apache.http.impl.conn.PoolingHttpClientConnectionManager;
import org.apache.http.impl.cookie.BasicClientCookie;
import org.apache.http.message.BasicHeader;
import org.apache.http.protocol.BasicHttpContext;
import org.apache.http.protocol.HttpContext;
import org.apache.http.util.EntityUtils;
import org.junit.Test;

import javax.net.ssl.HttpsURLConnection;
import javax.net.ssl.SSLContext;
import java.io.*;
import java.math.BigInteger;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.MappedByteBuffer;
import java.nio.channels.FileChannel;
import java.nio.charset.Charset;
import java.security.*;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by mushan on 2017-09-07.
 */
public class WxSendFileTest {

    static String api_webwxuploadmedia = "http://localhost:8088/httpclient/httppostfile";

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
        if (cookieStore == null) {
            cookieStore = new BasicCookieStore();
        }
        return HttpClientBuilder.create().setConnectionManager(connManager).setDefaultCookieStore(cookieStore).build();
    }


    public static String upload(String filePath, String uIn, String sId, String sKey, int fileType) {
//        // set https proxy
//        System.setProperty("https.proxyHost", "127.0.0.1");
//        System.setProperty("https.proxyPort", "8888");

        String response = null;
        InputStream inputStream = null;
        InputStreamReader inputStreamReader = null;
        BufferedReader bufferedReader = null;
        HttpsURLConnection conn = null;
        try {
            File file = new File(filePath);
            if (!file.exists() || !file.isFile()) {
                throw new IOException("文件不存在");
            }

            //请求头参数
            String boundary = "----WebKitFormBoundary6oVvR66QUmo1TkXD"; //区分每个参数之间
            String freFix = "--";
            String newLine = "\r\n";

            URL urlObj = new URL("https://file2.wx.qq.com/cgi-bin/mmwebwx-bin/webwxuploadmedia?f=json");
            conn = (HttpsURLConnection) urlObj.openConnection();
            conn.setRequestMethod("POST");
            conn.setDoOutput(true);
            conn.setDoInput(true);
            conn.setUseCaches(false);
            conn.setRequestProperty("Accept", "*/*");
            conn.setRequestProperty("Accept-Encoding", "gzip, deflate");
            conn.setRequestProperty("Accept-Language", "zh-CN,zh;q=0.8,en-US;q=0.5,en;q=0.3");
            conn.setRequestProperty("Cache-Control", "no-cache");
            conn.setRequestProperty("Connection", "Keep-Alive");
            conn.setRequestProperty("Content-Length", Long.toString(file.length()));
            conn.setRequestProperty("Content-Type", "multipart/form-data; boundary=" + boundary);
            conn.setRequestProperty("Host", "file2.wx.qq.com");
            conn.setRequestProperty("Origin", "https://wx2.qq.com");
            conn.setRequestProperty("Pragma", "no-cache");
            conn.setRequestProperty("Referer", "https://wx2.qq.com/");
            conn.setRequestProperty("User-Agent", "Mozilla/5.0 (Windows NT 10.0; WOW64; rv:40.0) Gecko/20100101 Firefox/40.0");

            // 请求主体
            StringBuffer sb = new StringBuffer();

            sb.append(freFix + boundary).append(newLine); //这里注意多了个freFix，来区分去请求头中的参数
            sb.append("Content-Disposition: form-data; name=\"name\"");
            sb.append(newLine).append(newLine);
            sb.append(file.getName()).append(newLine);

            sb.append(freFix + boundary).append(newLine);
            sb.append("Content-Disposition: form-data; name=\"lastModifiedDate\"");
            sb.append(newLine).append(newLine);
            sb.append("Tue Sep 29 2015 13:47:39 GMT+0800").append(newLine);

            sb.append(freFix + boundary).append(newLine);
            sb.append("Content-Disposition: form-data; name=\"size\"");
            sb.append(newLine).append(newLine);
            sb.append(file.length()).append(newLine);

            sb.append(freFix + boundary).append(newLine);
            sb.append("Content-Disposition: form-data; name=\"mediatype\"");
            sb.append(newLine).append(newLine);
            sb.append("doc").append(newLine);

            sb.append(freFix + boundary).append(newLine);
            sb.append("Content-Disposition: form-data; name=\"uploadmediarequest\"");
            sb.append(newLine).append(newLine);
            sb.append("{\"BaseRequest\":{\"Uin\":" + uIn + ",\"Sid\":\"" + sId + "\",\"Skey\":\"@" + sKey + "\",\"DeviceID\":\"e823469202135602\"},\"ClientMediaId\": " + System.currentTimeMillis() + ",\"TotalLen\":" + file.length() + ",\"StartPos\":0,\"DataLen\":" + file.length() + ",\"MediaType\":4}").append(newLine);

            sb.append(freFix + boundary).append(newLine);
            sb.append("Content-Disposition: form-data; name=\"type\"");
            sb.append(newLine).append(newLine);
            sb.append("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet").append(newLine);


            sb.append(freFix + boundary).append(newLine);
            sb.append("Content-Disposition: form-data; name=\"filename\"; filename=\"" + file.getName() + "\"");
            sb.append(newLine);
            sb.append("Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");
            sb.append(newLine).append(newLine);

            OutputStream outputStream = new DataOutputStream(conn.getOutputStream());
            outputStream.write(sb.toString().getBytes("utf-8"));//写入请求参数

            DataInputStream dis = new DataInputStream(new FileInputStream(file));
            int bytes = 0;
            byte[] bufferOut = new byte[1024];
            while ((bytes = dis.read(bufferOut)) != -1) {
                outputStream.write(bufferOut, 0, bytes);//写入图片
            }
            outputStream.write(newLine.getBytes());
            outputStream.write((freFix + boundary + freFix + newLine).getBytes("utf-8"));//标识请求数据写入结束

            dis.close();
            outputStream.close();

            //读取响应信息
            inputStream = conn.getInputStream();
            inputStreamReader = new InputStreamReader(inputStream, "UTF-8");
            bufferedReader = new BufferedReader(inputStreamReader);
            String str = null;
            StringBuffer buffer = new StringBuffer();
            while ((str = bufferedReader.readLine()) != null) {
                buffer.append(str);
            }
            response = buffer.toString();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (conn != null) {
                conn.disconnect();
            }
            try {
                bufferedReader.close();
                inputStreamReader.close();
                inputStream.close();
            } catch (IOException execption) {

            }
        }
        return response;
    }

    public static void send(String filePath, String cookie, String uIn, String sId, String sKey, String fileName, String fromUserName, String toUserName) throws JSONException {
        filePath = "C:/Users/klay/Desktop/helloWorld.xlsx";
        uIn = "1";
        sId = "1";
        sKey = "11";
        fileName = "helloWorld.xls";
        int mediaType = 4;
        String result = upload(filePath, uIn, sId, sKey, mediaType);//执行图片上传，返回流媒体id。PS：微信网页版中的发送文件/图片/等分为两步1.上传到服务器拿到返回的mediaId,2.发送通知消息

        JSONObject json = JSONObject.parseObject(result);

        String mediaId = json.get("MediaId").toString();
        System.out.println(json.get("MediaId"));

        //发送图片
        Long currentTimeMillis = System.currentTimeMillis();

        String jsonParamsByFile = "{\"BaseRequest\":{\"Uin\":" + uIn + ",\"Sid\":\"" + sId + "\",\"Skey\":\"@" + sKey + "\",\"DeviceID\":\"e640359774620125\"},\"Msg\":{\"Type\":6,\"Content\":\"<appmsg appid=\'wxeb7ec651dd0aefa9\' sdkver=\'\'><title>" + fileName + "</title><des></des><action></action><type>6</type><content></content><url></url><lowurl></lowurl><appattach><totallen>9879</totallen><attachid>" + mediaId + "</attachid><fileext>xlsx</fileext></appattach><extinfo></extinfo></appmsg>\",\"FromUserName\":\"@" + fromUserName + "\",\"ToUserName\":\"@@" + toUserName + "\",\"LocalID\":\"" + currentTimeMillis + "\",\"ClientMsgId\":\"" + currentTimeMillis + "\"}}";

        cookie = "";
        System.out.println(jsonParamsByFile);
        String url = "https://wx2.qq.com/cgi-bin/mmwebwx-bin/webwxsendappmsg?fun=async&f=json&lang=zh_CN";
        HttpClient client = new DefaultHttpClient();
        HttpPost post = new HttpPost(url);
        post.addHeader(new BasicHeader("cookie", cookie));//发送文件必须设置,cookie

        try {
            StringEntity s = new StringEntity(jsonParamsByFile);
            post.setEntity(s);
            HttpResponse res = client.execute(post);
            if (res.getStatusLine().getStatusCode() == HttpStatus.SC_OK) {
                HttpEntity entity = res.getEntity();
                System.out.println(EntityUtils.toString(entity, "utf-8"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Test
    public void testUploadFileToWx2(){
        CookieStore cookieStore = new BasicCookieStore();

        cookieStore.addCookie(new BasicClientCookie("pass_ticket1", "W7or4wItak8rdD0FUpQPSqC95GRLRfoI9vtJbnJkF1Y0Sbut4lPRn2l89lvT3Kz3"));

        Map<String, String> wxSession = new HashMap<>();
        wxSession.put("wxuin", "2528748522");
        wxSession.put("wxsid", "aidG30Y/mcynEpyd");
        wxSession.put("skey", "@crypt_c808db4c_44d2ffc29538ea7f724da6a45706afca");
        wxSession.put("pass_ticket", "W7or4wItak8rdD0FUpQPSqC95GRLRfoI9vtJbnJkF1Y0Sbut4lPRn2l89lvT3Kz3");
        wxSession.put("UserName", "@725927e02a99ab0e7c3e3725f9abab4dc2c9601cd62c578acf92df8d86a78ff8");

        uploadFileToWx2(cookieStore, wxSession, "d:\\temp\\filewx.xlsx", "@977ad893c3bdf3f29cd75b6e3d8d0b12");
    }

    @Test
    public void testUploadFileToWx3(){

        HttpClientContext httpContext = HttpClientContext.create();

        CookieStore cookieStore = new BasicCookieStore();
        RequestConfig requestConfig = RequestConfig.custom().setConnectionRequestTimeout(20 * 1000).setSocketTimeout(20 * 1000).build();

        httpContext.setCookieStore(cookieStore);

        cookieStore.addCookie(new BasicClientCookie("pass_ticket1", "W7or4wItak8rdD0FUpQPSqC95GRLRfoI9vtJbnJkF1Y0Sbut4lPRn2l89lvT3Kz3"));

        Map<String, String> wxSession = new HashMap<>();
        wxSession.put("wxuin", "2528748522");
        wxSession.put("wxsid", "aidG30Y/mcynEpyd");
        wxSession.put("skey", "@crypt_c808db4c_44d2ffc29538ea7f724da6a45706afca");
        wxSession.put("pass_ticket", "W7or4wItak8rdD0FUpQPSqC95GRLRfoI9vtJbnJkF1Y0Sbut4lPRn2l89lvT3Kz3");
        wxSession.put("UserName", "@725927e02a99ab0e7c3e3725f9abab4dc2c9601cd62c578acf92df8d86a78ff8");

        uploadFileToWx3(cookieStore, wxSession, "d:\\temp\\filewx.xlsx", "@977ad893c3bdf3f29cd75b6e3d8d0b12", "POST");
    }

    public static String uploadFileToWx3(CookieStore cookieStore, Map<String, String> wxSession, String filePath, String toUserName,String type) {
        String domain="wx2";

        String uIn = wxSession.get("wxuin");
        String sId = wxSession.get("wxsid");
        String sKey = wxSession.get("skey");
        String fromUserName = wxSession.get("UserName");
        String deviceid = "e1615250492";
        String passTicket =  wxSession.get("pass_ticket");

        String webwxDataTicket = "";
        String cookies = "";
        if (CollectionUtils.isNotEmpty(cookieStore.getCookies())){
            for(Cookie cookie : cookieStore.getCookies()){
//                cookies += cookie.getName() + "=\"" + cookie.getValue() + "\";";
                if (StringUtils.equalsIgnoreCase(cookie.getName(), "webwx_data_ticket")){
                    webwxDataTicket = cookie.getValue();
                    cookies = cookie.getName() + "=\"" + cookie.getValue() + "\";";
                    break;
                }
            }
        }

        String response = null;
        InputStream inputStream = null;
        InputStreamReader inputStreamReader = null;
        BufferedReader bufferedReader = null;
//        HttpsURLConnection conn = null;
        HttpURLConnection conn = null;
        try {
            File file = new File(filePath);
            if (!file.exists() || !file.isFile()) {
                throw new IOException("文件不存在");
            }

            //请求头参数
            String boundary = "---------------------------16968206128770"; //区分每个参数之间
            String freFix = "--";
            String newLine = "\r\n";

//            URL urlObj = new URL("https://file."+domain+".qq.com/cgi-bin/mmwebwx-bin/webwxuploadmedia?f=json");
            URL urlObj = new URL(api_webwxuploadmedia);
            conn = (HttpURLConnection) urlObj.openConnection();
            conn.setRequestMethod(type);
            conn.setDoOutput(true);
            conn.setDoInput(true);
            conn.setConnectTimeout(5000);
            conn.setUseCaches(false);
            conn.setRequestMethod("POST");
            conn.setRequestProperty("Host", "localhost");
            conn.setRequestProperty("User-Agent","Mozilla/5.0 (Windows NT 6.1; WOW64; rv:49.0) Gecko/20100101 Firefox/49.0");
            conn.setRequestProperty("Accept", "text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8");
            conn.setRequestProperty("Accept-Language", "zh-CN,zh;q=0.8,en-US;q=0.5,en;q=0.3");
            conn.setRequestProperty("Accept-Encoding", "gzip, deflate, br");
            conn.setRequestProperty("Referer", "https://."+domain+".qq.com/?&lang=zh_CN");
            conn.setRequestProperty("Content-Length", Long.toString(file.length()));
            conn.setRequestProperty("Content-Type", "multipart/form-data; boundary="+boundary);
            conn.setRequestProperty("origin", "https://."+domain+"..qq.com/");
            conn.setRequestProperty("Connection", "Keep-Alive");
            conn.setRequestProperty("Cookie", cookies);

            // 请求主体
            StringBuffer sb = new StringBuffer();

            sb.append(freFix+boundary).append(newLine); //这里注意多了个freFix，来区分去请求头中的参数
            sb.append("Content-Disposition: form-data; name=\"id\"").append(newLine);
            sb.append(newLine);

            sb.append("WU_FILE_1").append(newLine);
            sb.append(freFix+boundary).append(newLine);
            sb.append("Content-Disposition: form-data; name=\"name\"").append(newLine);
            sb.append(newLine);

            sb.append(file.getName()).append(newLine);
            sb.append(freFix+boundary).append(newLine);
            sb.append("Content-Disposition: form-data; name=\"type\"").append(newLine);
            sb.append(newLine);

            sb.append("image/jpeg").append(newLine);
            sb.append(freFix+boundary).append(newLine);
            sb.append("Content-Disposition: form-data; name=\"lastModifiedDate\"").append(newLine);
            sb.append(newLine);

            sb.append("Tue Feb 14 2017 22:07:03 GMT+0800").append(newLine);
            sb.append(freFix+boundary).append(newLine);
            sb.append("Content-Disposition: form-data; name=\"size\"").append(newLine);
            sb.append(newLine);

            sb.append(file.length()).append(newLine);
            sb.append(freFix+boundary).append(newLine);
            sb.append("Content-Disposition: form-data; name=\"mediatype\"").append(newLine);
            sb.append(newLine);

            sb.append("pic").append(newLine);
            sb.append(freFix+boundary).append(newLine);
            sb.append("Content-Disposition: form-data; name=\"uploadmediarequest\"").append(newLine);
            sb.append(newLine);

            sb.append("{\"UploadType\":2,\"BaseRequest\":{\"Uin\":"+uIn+",\"Sid\":\""+sId+"\",\"Skey\":\""+sKey+"\",\"DeviceID\":\""+deviceid+"\"},\"ClientMediaId\":"+System.currentTimeMillis()+",\"TotalLen\":"+file.length()+",\"StartPos\":0,\"DataLen\":"+file.length()+",\"MediaType\":4,\"FromUserName\":\""+fromUserName+"\",\"ToUserName\":\""+toUserName+"\",\"FileMd5\":\"7a392dfff5a45cc29d494434a1fbaf15\"}").append(newLine);
            sb.append(freFix+boundary).append(newLine);
            sb.append("Content-Disposition: form-data; name=\"webwx_data_ticket\"").append(newLine);
            sb.append(newLine);

            sb.append(webwxDataTicket).append(newLine);
            sb.append(freFix+boundary).append(newLine);
            sb.append("Content-Disposition: form-data; name=\"pass_ticket\"").append(newLine);
            sb.append(newLine);

            sb.append(passTicket).append(newLine);
            sb.append(freFix+boundary).append(newLine);
            sb.append("Content-Disposition: form-data; name=\"filename\"; filename=\""+file.getName()+"\"").append(newLine);
            sb.append("Content-Type: application/octet-stream");
            sb.append(newLine);
            sb.append(newLine);

            // System.out.println(sb.toString());
            //FileOutputStream writer = new FileOutputStream(new File("e:\\img\\Resulsssst.txt"));
            OutputStream outputStream = new DataOutputStream(conn.getOutputStream());
            outputStream.write(sb.toString().getBytes("utf-8"));//写入请求参数

            DataInputStream dis = new DataInputStream(new FileInputStream(file));
            int bytes = 0;
            byte[] bufferOut = new byte[1024];
            while ((bytes = dis.read(bufferOut)) != -1) {
                outputStream.write(bufferOut,0,bytes);//写入图片
            }
            outputStream.write(newLine.getBytes());
            outputStream.write((freFix+boundary+freFix+newLine).getBytes("utf-8"));//标识请求数据写入结束
            dis.close();
            outputStream.close();
            //读取响应信息
            inputStream = conn.getInputStream();
            inputStreamReader = new InputStreamReader(inputStream, "UTF-8");
            bufferedReader = new BufferedReader(inputStreamReader);
            String str = null;
            StringBuffer buffer = new StringBuffer();
            while ((str = bufferedReader.readLine()) != null) {
                buffer.append(str);
            }
            response = buffer.toString();
            System.out.println("response++++++++"+response);
        } catch (Exception e) {
            e.printStackTrace();
        }finally{
            if(conn!=null){
                conn.disconnect();
            }
            try {
                bufferedReader.close();
                inputStreamReader.close();
                inputStream.close();
            } catch (IOException execption) {

            }
        }
        return response;
    }

    public static String uploadFileToWx2(CookieStore cookieStore, Map<String, String> wxSession, String filePath, String toUserName) {
        CloseableHttpClient httpClient = null;
        CloseableHttpResponse response = null;
        String result = "";
        try {
            String uIn = wxSession.get("wxuin");
            String sId = wxSession.get("wxsid");
            String sKey = wxSession.get("skey");
            String fromUserName = wxSession.get("UserName");

            httpClient = getHttpClient(cookieStore);

            // 把一个普通参数和文件上传给下面这个地址 是一个servlet
            HttpPost httpPost = new HttpPost(api_webwxuploadmedia);
            httpPost.setHeader("Content-Type", "multipart/form-data; boundary=----WebKitFormBoundaryoWmrkW7MIGyBhlOt");
            File file = new File(filePath);

            if( !file.exists()){
                System.out.println("文件不存在，file=" + filePath);
                return null;
            }

            // 把文件转换成流对象FileBody
            FileBody bin = new FileBody(file);

            StringBody fileId = new StringBody(String.valueOf(System.currentTimeMillis()), ContentType.create("text/plain", Consts.UTF_8));
            StringBody name = new StringBody(file.getName(), ContentType.create("text/plain", Consts.UTF_8));
            StringBody lastModifiedDate = new StringBody(String.valueOf(file.lastModified()), ContentType.create("text/plain", Consts.UTF_8));
            StringBody size = new StringBody(String.valueOf(file.length()), ContentType.create("text/plain", Consts.UTF_8));
            StringBody mediatype = new StringBody("doc", ContentType.create("text/plain", Consts.UTF_8));

            JSONObject bodyJSON = new JSONObject();
            JSONObject BaseRequest = new JSONObject();
            BaseRequest.put("Uin", uIn);
            BaseRequest.put("Sid", sId);
            BaseRequest.put("Skey", sKey);
            BaseRequest.put("DeviceID", "e1615250492");

            bodyJSON.put("BaseRequest", BaseRequest);

            bodyJSON.put("ClientMediaId", System.currentTimeMillis());
            bodyJSON.put("TotalLen", file.length());
            bodyJSON.put("StartPos", 0);
            bodyJSON.put("DataLen", file.length());
            bodyJSON.put("MediaType", 4);

            bodyJSON.put("FromUserName", fromUserName);
            bodyJSON.put("ToUserName", toUserName);
            bodyJSON.put("FileMd5", getMd5ByFile(file));

            StringBody uploadmediarequest = new StringBody(bodyJSON.toJSONString(), ContentType.create("text/plain", Consts.UTF_8));
            StringBody UploadType = new StringBody("2", ContentType.create("text/plain", Consts.UTF_8));


            StringBody type = new StringBody(file.getName(), ContentType.create("text/plain", Consts.UTF_8));

            HttpEntity reqEntity = MultipartEntityBuilder.create()
                    // 相当于<input type="file" name="file"/>
                    .addPart("id", fileId)
                    .addPart("file", bin)

                    // 相当于<input type="text" name="userName" value=userName>
                    .addPart("name", name)
                    .addPart("lastModifiedDate", lastModifiedDate)
                    .addPart("size", size)
                    .addPart("mediatype", mediatype)
                    .addPart("uploadmediarequest", uploadmediarequest)
                    .addPart("UploadType", UploadType)
                    .build();

            httpPost.setEntity(reqEntity);

            // 发起请求 并返回请求的响应
            response = httpClient.execute(httpPost);

            System.out.println("The response value of token:" + response.getFirstHeader("token"));

            // 获取响应对象
            HttpEntity resEntity = response.getEntity();
            if (resEntity != null) {
                // 打印响应长度
                System.out.println("Response content length: " + resEntity.getContentLength());
                // 打印响应内容
                result = EntityUtils.toString(resEntity, Charset.forName("UTF-8"));

                System.out.println("上传文件回应=" + result);
            }

            // 销毁
            EntityUtils.consume(resEntity);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (response != null) {
                    response.close();
                }
            } catch (IOException e) {
                e.printStackTrace();
            }

            try {
                if (httpClient != null) {
                    httpClient.close();
                }
            } catch (IOException e) {
                e.printStackTrace();
            }
        }

        return result;
    }

    public static String getMd5ByFile(File file) {
        String value = null;
        FileInputStream in = null;
        try {
            in = new FileInputStream(file);
            MappedByteBuffer byteBuffer = in.getChannel().map(FileChannel.MapMode.READ_ONLY, 0, file.length());
            MessageDigest md5 = MessageDigest.getInstance("MD5");
            md5.update(byteBuffer);
            BigInteger bi = new BigInteger(1, md5.digest());
            value = bi.toString(16);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if(null != in) {
                try {
                    in.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
        return value;
    }
}
