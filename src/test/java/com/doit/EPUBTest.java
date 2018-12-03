package com.doit;

import nl.siegmann.epublib.domain.Book;
import nl.siegmann.epublib.domain.Resource;
import nl.siegmann.epublib.domain.TOCReference;
import nl.siegmann.epublib.domain.TableOfContents;
import nl.siegmann.epublib.epub.EpubReader;
import org.junit.Test;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.List;

/**
 * Created by mushan on 2017-06-06.
 */
public class EPUBTest  {

    @Test
    public void a1(){
        try {
            // read epub
            EpubReader epubReader = new EpubReader();
            Book book = epubReader.readEpub(new FileInputStream("C:\\Program Files (x86)\\京东读书\\books\\30032644.epub"));
            System.out.println(book.getTitle());
            TableOfContents contents = book.getTableOfContents();
            List<TOCReference> contentItems = contents.getTocReferences();
            for(TOCReference item : contentItems){
                System.out.println(item.getResourceId());
                System.out.println(item.getTitle());
                System.out.println(item.getCompleteHref());
                System.out.println(item.getResourceId());
//                System.out.println(new String(item.getResource().getData()));
            }

            List<Resource> resources = book.getContents();
            for(Resource item : resources){
                System.out.println(item.getTitle());
                System.out.println(item.getMediaType().getName());
//                System.out.println(new String(item.getData()));
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
