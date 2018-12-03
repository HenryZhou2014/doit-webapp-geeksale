package com.doit;

import com.tencent.common.Configure;
import org.apache.commons.collections.MapUtils;
import org.apache.commons.collections.map.ListOrderedMap;
import org.apache.commons.lang.StringUtils;
import org.junit.Test;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.Map;

/**
 * Created by mushan on 2017/7/7.
 */
public class URIEncodeTest {

    @Test
    public void t1(){
        try {
            System.out.println(URLEncoder.encode("http://www.my1001.cn/wechat/callback","UTF-8"));
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
    }

    @Test
    public void t2(){
        String api = "http://www.my1001.cn/wechat/callback";
        Map<String, String> params = new ListOrderedMap();
        params.put("wxuin", "2528748522");
        params.put("window_redirect_uri", "https://wx.qq.com/cgi-bin/mmwebwx-bin/webwxnewloginpage");
        params.put("wxsid", "aS6SnVxG2fqYWpVc");
        params.put("wxloadtime", "1508553037");
        params.put("mm_lang", "zh_CN");
        params.put("webwx_data_ticket", "gSfofEhTsp15VJUZS0jZ2rov");
        params.put("webwxuvid", "e=&26343dfbb78f3b5db4029cedc4c6e099d3839e852962822f4363d688dde00b2e5f5ac7a52b39c93adca1138a97ef8bf");

        String url = composeUrl(api, params);
        System.out.println(url);
    }

    static String composeUrl(String api, Map<String, String> params) {
        if (MapUtils.isEmpty(params)) {
            return api;
        }

        String url = null;
        try {
            url = StringUtils.endsWith(api, "?") ? api : api + "?";
            for (Map.Entry<String, String> param : params.entrySet()) {
                url += "&" + param.getKey() + "=" + URLEncoder.encode(param.getValue(), "utf-8");
            }

            return url;
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }

        return null;
    }
}
