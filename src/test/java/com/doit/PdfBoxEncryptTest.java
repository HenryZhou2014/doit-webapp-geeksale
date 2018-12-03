package com.doit;

import org.apache.pdfbox.pdmodel.PDDocument;
import org.apache.pdfbox.pdmodel.encryption.AccessPermission;
import org.apache.pdfbox.pdmodel.encryption.StandardProtectionPolicy;
import org.junit.Test;


import java.io.File;

/**
 * Created by mushan on 2017-03-08.
 */
public class PdfBoxEncryptTest {

    @Test
    public void PDFadmin(String filepath) {
        String file = "e:\\temp\\常识.pdf";
        String out = "e:\\temp\\常识-encrypted.pdf";
        try {
            PDDocument doc = PDDocument.load(new File(file));

// Define the length of the encryption key.
// Possible values are 40, 128 or 256.
            int keyLength = 256;

            AccessPermission ap = new AccessPermission();
            ap.setReadOnly();
// disable printing, everything else is allowed
            ap.setCanPrint(false);
            ap.setCanExtractContent(false);
            ap.setCanFillInForm(false);
            ap.setCanModify(false);
            ap.setCanAssembleDocument(false);
            ap.setCanPrintDegraded(false);

// Owner password (to open the file with all permissions) is "12345"
// User password (to open the file but with restricted permissions, is empty here)
            StandardProtectionPolicy spp = new StandardProtectionPolicy("", "", ap);
            spp.setEncryptionKeyLength(keyLength);
            spp.setPermissions(ap);

            doc.protect(spp);

            doc.save(out);
            doc.close();


        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
