package com.doit;

import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Rectangle;
import com.itextpdf.text.pdf.*;
import com.itextpdf.xmp.impl.Utils;
import org.junit.Test;

import java.io.*;
import java.security.KeyStore;
import java.security.PrivateKey;
import java.security.cert.Certificate;
import java.util.Date;

/**
 * Created by mushan on 2017-02-21.
 */
public class ITextpdfTest {

    @Test
    public void encryptPdf(){
        /*try {
            PdfReader reader = null;
            reader = new PdfReader(domainDoc.getDoc());
            ByteArrayOutputStream byteOut = new ByteArrayOutputStream();
            com.itextpdf.text.Document document = new com.itextpdf.text.Document();
            PdfCopy copy = new PdfCopy(document, byteOut);
            document.open();
            int pageNum = reader.getNumberOfPages();
            pageNum = pageNum - getSignPages(reader);// check sign pages
            for (int page = 0; page < pageNum;) {
                copy.addPage(copy.getImportedPage(reader, ++page));
            }
            Rectangle pageRectangle = reader.getPageSize(pageNum);

            ByteArrayInputStream signStream =
                    new ByteArrayInputStream(signatureTemplete2PDF(pageRectangle, domainDoc, activities));
            PdfReader signTempleteReader = new PdfReader(signStream);

            int signPageSize = signTempleteReader.getNumberOfPages();

            for (int page = 0; page < signPageSize;) {
                copy.addPage(copy.getImportedPage(signTempleteReader, ++page));
            }
            document.close();

            // eSign PDF document
            ByteArrayInputStream byteIn = new ByteArrayInputStream(byteOut.toByteArray());
            PdfReader encryptReader = new PdfReader(byteIn);
            ByteArrayOutputStream encryptByteOut = new ByteArrayOutputStream();

            //
            String jksPath = Environments.getClassPath(properties.getProperty("store.path"));
            String keyStorePass = properties.getProperty("store.password");
            String keyPass = properties.getProperty("key.password");
            KeyStore ks = KeyStore.getInstance(KeyStore.getDefaultType());
            ks.load(new FileInputStream(jksPath), keyStorePass.toCharArray());

            // 获取私钥
            String alias = (String) ks.aliases().nextElement();
            PrivateKey key = (PrivateKey) ks.getKey(alias, keyPass.toCharArray());
            Certificate[] chain = ks.getCertificateChain(alias);
            PdfStamper stamper = PdfStamper.createSignature(encryptReader, encryptByteOut, '\0');

            // 进行数字签名
            PdfSignatureAppearance appearance = stamper.getSignatureAppearance();
            appearance.setCrypto(key, chain, null, PdfSignatureAppearance.WINCER_SIGNED);
            appearance.setCertificationLevel(PdfSignatureAppearance.CERTIFIED_NO_CHANGES_ALLOWED);

            appearance.setReason("BGL.Digital Signature ");
            appearance.setLocation("AU");

            stamper.getWriter().setCompressionLevel(5);

            // 使用私钥对文档进行加密，并且只允许打印选项
            stamper.setEncryption(null, Utils.md5(keyStorePass).getBytes(), PdfWriter.ALLOW_PRINTING,
                    PdfWriter.ENCRYPTION_AES_256);
            // log.info("status:"+domainDoc.getStatus());
            // add watermark when signing has been completed by all required signatories.
            if (domainDoc.getStatus().equals(DocumentStatus.SIGNED)) {
                // 添加水印
                addWatermark(stamper, pageRectangle, pageNum, "Digitally Signed on "
                        + Utils.formatDate(new Date()));
            }
            // add signature metadata
            //HashMap<String, String> info = reader.getInfo();
            //  stamper.setMoreInfo(info);

            stamper.close();
            InputStream is = new ByteArrayInputStream(encryptByteOut.toByteArray());
//            return is;
        } catch (DocumentException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        }*/
    }
}
