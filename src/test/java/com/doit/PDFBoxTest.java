package com.doit;

import org.apache.pdfbox.pdmodel.PDDocument;
import org.apache.pdfbox.pdmodel.PDPage;
import org.apache.pdfbox.rendering.ImageType;
import org.apache.pdfbox.rendering.PDFRenderer;
import org.junit.Test;

import javax.imageio.ImageIO;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;

/**
 * Created by mushan on 2017-02-21.
 */
public class PDFBoxTest {

    @Test
    /**
     * 把pdf文件转成图片
     */
    public void convertPdf2Jpg(){
//        String pdfFilename = "e:\\temp\\pdfjs\\web\\compressed.tracemonkey-pldi-09.pdf";
//        String pdfFilename = "e:\\temp\\pdfjs\\web\\compressed.tracemonkey-pldi-08.pdf";
        String pdfFilename = "f:\\books\\[《巧克力全书》]台版繁体.pdf";
        String target = "d:\\temp\\pdf2jpg\\book1\\";

        try {
            PDDocument document = PDDocument.load(new File(pdfFilename));
            PDFRenderer pdfRenderer = new PDFRenderer(document);
//            for (PDPage page : document.getPages())
            for (int pageCounter = 60; pageCounter < 70; pageCounter++)
            {
                // note that the page number parameter is zero based
//                BufferedImage image = pdfRenderer.renderImageWithDPI(pageCounter, 300, ImageType.RGB);
                BufferedImage image = pdfRenderer.renderImageWithDPI(pageCounter, 200, ImageType.RGB);

                // suffix in filename will be used as the file format
//                ImageIOUtil.writeImage(image, pdfFilename + "-" + (pageCounter++) + ".png", 300);
                ImageIO.write(image, "jpg", new File(target + "page-" + pageCounter + ".jpg"));
            }
            document.close();
        } catch (IOException e) {
            e.printStackTrace();
        }

    }

    @Test
    /**
     * 加密PDF
     */
    public void encryptPdf(){
        String pdfFilename = "f:\\books\\[《巧克力全书》]台版繁体.pdf";
        String target = "d:\\temp\\pdf2jpg\\book1\\";


    }
}
