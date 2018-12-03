package com.doit;

import com.doit.ecommerce.model.ProductCategory;
import com.doit.ecommerce.service.ProductCategoryManager;
import org.apache.commons.lang.StringUtils;
import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.Element;
import org.dom4j.io.SAXReader;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.annotation.Rollback;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by mushan on 2016-12-30.
 */
public class ProductCategoryInitTest extends BaseDaoTestCase {

    @Autowired
    ProductCategoryManager productCategoryManager;

    String xmlFilePath = "d:\\projects\\2016.cumtp.com\\svn\\cumtp.com\\doc\\06.implementation\\中图法分类\\图书分类.xml";

    List<ProductCategory> productCategories = new ArrayList<>();
    Map<String, ProductCategory> productCategoryMap = new HashMap<>();
    Map<String, ProductCategory> dbProductCategoryMap = new HashMap<>();

    @Test
    public void testQuery() {
        List<ProductCategory> all = productCategoryManager.getAll();
        System.out.println(all.size());
    }

    @Test
    @Rollback(false)
    public void testReadCategoryFile() {
        File inputXml = new File(xmlFilePath);
        SAXReader saxReader = new SAXReader();

        try {
            Document document = saxReader.read(inputXml);
            Element employees = document.getRootElement();
            List<Element> elements = employees.elements("CATEGORY");

            ProductCategory root = productCategoryManager.getCategoryByAliasName("books");

            List<ProductCategory> all = productCategoryManager.getAll();
            for(ProductCategory item : all){
                dbProductCategoryMap.put(item.getAliasName(), item);
            }

            int seqNo = 1;
            for(Element item: elements){
                parseCategory(item, root, seqNo++);
            }
        } catch (DocumentException e) {
            System.out.println(e.getMessage());
        }
        System.out.println("dom4j parserXml size = " + productCategories.size());
    }

    void parseCategory(Element element, ProductCategory parent , int seqNo){
        Element catNameAttr = element.element("catName");
        String catName = catNameAttr.getText();

        System.out.print("catName=" + catName);
        String[] attr = catName.split(" ");
        int index = 0;

        ProductCategory dbEntity = dbProductCategoryMap.get(StringUtils.trim(attr[0]));
        if (dbEntity == null){
            dbEntity = new ProductCategory();
        }

        dbEntity.setParentId(parent.getId());
        dbEntity.setAliasName(StringUtils.trim(attr[0]));
        dbEntity.setTitle(StringUtils.trim(attr[1]));
        dbEntity.setSeqNo(seqNo);

        productCategoryManager.saveOrUpdate(dbEntity);

        productCategories.add(dbEntity);
        productCategoryMap.put(dbEntity.getAliasName(), dbEntity);

        for(String item : attr){
            System.out.print("  [" + index + "]=" + item);
            index ++;
        }
        System.out.println();

        int newSeqNo = 1;
        List<Element> children = element.elements("CATEGORY");
        for(Element item : children){
            parseCategory(item, dbEntity, newSeqNo ++);
        }

    }
}
