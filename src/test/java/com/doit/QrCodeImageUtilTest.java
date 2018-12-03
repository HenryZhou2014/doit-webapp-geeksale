package com.doit;

import com.doit.xiaowanjia.util.QrCodeImageUtil;
import org.junit.Test;

/**
 * Created by mushan on 2017-01-18.
 */
public class QrCodeImageUtilTest {

    @Test
    public void qrimage(){
        QrCodeImageUtil.generateQrCodeImage("d:\\projects\\2016.cumtp.com\\svn\\cumtp.com\\source\\cumtp.com\\doit-webapp-bookstores\\target\\doit-webapp-bookstores-1.0-SNAPSHOT", "weixin://wxpay/s/An4baqw", "files\\order\\order-987\\wxpay.gif");
    }
}
