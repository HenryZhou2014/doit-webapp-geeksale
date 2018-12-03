package com.doit;

import com.doit.payment.alipay.sign.MD5;
import org.junit.Test;

/**
 * Created by mushan on 2017-10-10.
 */
public class MD5Test {

    @Test
    public void test1(){
        String md5 = MD5.sign("13764590153", "1p92", "UTF-8");
        System.out.println(md5);
    }
}
