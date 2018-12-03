package com.doit;

import com.alibaba.fastjson.JSONObject;
import com.doit.cms.model.ArticleCategory;
import org.junit.Test;

/**
 * Created by mushan on 2017-01-04.
 */
public class AlibabaJsonTest {

    @Test
    public void testJson(){
        JSONObject jsonObject = new JSONObject();
        ArticleCategory ar = new ArticleCategory();
        ar.setTitle("");
        jsonObject.put("a", ar);

        System.out.println(jsonObject.toString());
    }
}
