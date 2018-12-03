package com.doit;

import com.doit.base.qrcode.MatrixToImageWriter;
import com.google.zxing.BarcodeFormat;
import com.google.zxing.EncodeHintType;
import com.google.zxing.MultiFormatWriter;
import com.google.zxing.common.BitMatrix;
import junit.framework.TestCase;

import java.io.File;
import java.util.Hashtable;

/**
 * Created by ben on 2014/12/16.
 */
public class QrCodeTest extends TestCase {

    public void testCreateQrCodeImage(){
        try {
            String text = "http://www.mushan-studio.com";
            int width = 300;
            int height = 300;
            //二维码的图片格式
            String format = "png";
            Hashtable hints = new Hashtable();
            //内容所使用编码
            hints.put(EncodeHintType.CHARACTER_SET, "utf-8");
            BitMatrix bitMatrix = new MultiFormatWriter().encode(text,
                    BarcodeFormat.QR_CODE, width, height, hints);
            //生成二维码
            File outputFile = new File("d:" + File.separator + "mushan-studio.com.png");
            MatrixToImageWriter.writeToFile(bitMatrix, format, outputFile);
        }
        catch (Exception e){
            e.printStackTrace();
        }
    }
}
