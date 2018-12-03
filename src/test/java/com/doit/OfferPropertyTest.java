package com.doit;
import com.doit.account.dao.AccountDao;
import com.doit.account.model.Account;
import com.doit.base.enums.DeleteStatus;
import com.doit.base.enums.PublishStatus;
import com.doit.ecommerce.dao.ProductCategoryDao;
import com.doit.ecommerce.dao.SellOfferDao;
import com.doit.ecommerce.enums.SellOfferStatus;
import com.doit.ecommerce.model.OfferProperty;
import com.doit.ecommerce.model.ProductCategory;
import com.doit.ecommerce.model.SellOffer;
import com.doit.ecommerce.model.SellOfferItem;
import com.doit.ecommerce.service.OfferPropertyManager;
import org.apache.commons.lang.StringUtils;
import org.apache.poi.hssf.usermodel.*;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.annotation.Rollback;

import java.io.File;
import java.io.FileInputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;


/**
 * Created by AUSER on 2017/1/10.
 */
public class OfferPropertyTest extends BaseDaoTestCase {
    @Autowired
    OfferPropertyManager offerPropertyManager;

    @Autowired
    SellOfferDao sellOfferDao;

    @Autowired
    AccountDao accountDao;

    @Autowired
    ProductCategoryDao productCategoryDao;

    @Test
    public void find(){
        OfferProperty offerProperty = offerPropertyManager.getOfferPropertyValue(2848l,"C","pageTotal");
        System.out.println(offerProperty.getPropertyValue());
        //SellOffer sellOffer = offerProperty.getSellOffer();
        //System.out.println(sellOffer);
    }


    @Test
    public void getSellOfferBySpus(){
//        File file = new File("E:\\bak\\PushRes");
//        if(file.isDirectory()){
//            File[] files = file.listFiles();
//            String[] fileNames = new String[files.length];
//            int i = 0;
//            for(File file1 : files){
//                fileNames[i] = file1.getName();
//                i++;
//            }
//            System.out.println("文件数:" + fileNames.length);
//
//            List<SellOffer> sellOfferList = sellOfferDao.getSellOfferBySpus(fileNames);
//            System.out.println("已存在的书籍：" + sellOfferList.size());
//        }
    }

    @Test
    @Rollback(false)
    public void parseSellOfferFromExcel(){

        List<SellOffer> sellOfferList = new ArrayList<SellOffer>();
        Account account = accountDao.getUserByUsername("admin");

        try {
            File target = new File("E:\\liujinjun\\project\\ctump\\books.xls");
            FileInputStream fi = new FileInputStream(target);
            HSSFWorkbook wb = new HSSFWorkbook(fi);
            //sheet 从0开始
            HSSFSheet sheet = wb.getSheetAt(0);

            //取得最后一行的行号
            int rowNum = sheet.getLastRowNum() + 1;


            int cellNum = sheet.getRow(0).getLastCellNum();      //每行的最后一个单元格位置

            //行循环开始
            for (int i = 0; i < rowNum; i++) {
                if(i == 0){
                    continue;
                }

                if(rowNum > 1&& i == rowNum-1){
                    continue;
                }

                SellOffer sellOffer = new SellOffer();
                HSSFRow row = sheet.getRow(i);

                HSSFCell cell_spu = row.getCell(0);
                if(cell_spu != null){
                    String spu = getCellVal(cell_spu);
                    if(StringUtils.isNotBlank(spu)){
                        sellOffer.setSpu(spu);
//                        SellOffer sellOffer1 = sellOfferDao.findFirst("from SellOffer where spu = ?",spu);
//                        if(sellOffer1 == null){
//                            sellOffer.setSpu(spu);
//                        }else{
//                            sellOffer = sellOffer1;
//                        }
                    }
                }

                HSSFCell cell_title = row.getCell(1);
                if(cell_title != null){
                    String title = getCellVal(cell_title);
                    if(StringUtils.isNotBlank(title)){
                        sellOffer.setTitle(title);
                        sellOffer.setProductName(title);
                    }else{
                        sellOffer.setTitle("书名未知");
                        sellOffer.setProductName("书名未知");
                    }
                }else{
                    sellOffer.setTitle("书名未知");
                    sellOffer.setProductName("书名未知");
                }

                //版次
                HSSFCell cell_revision = row.getCell(4);
                if(cell_revision != null){
                    String revision = getCellVal(cell_revision);
                    if(StringUtils.isNotBlank(revision)){
                        sellOffer.getOrCreateProperty("revision").setPropertyValue(revision);
                    }
                }
                //印次
                HSSFCell cell_impression = row.getCell(5);
                if(cell_impression != null){
                    String impression = getCellVal(cell_impression);
                    if(StringUtils.isNotBlank(impression)){
                        sellOffer.getOrCreateProperty("impression").setPropertyValue(impression);
                    }
                }
                //装帧
                HSSFCell cell_binding = row.getCell(7);
                if(cell_binding != null){
                    String binding = getCellVal(cell_binding);
                    if(StringUtils.isNotBlank(binding)){
                        sellOffer.getOrCreateProperty("binding").setPropertyValue(binding);
                    }
                }
                //定价
                HSSFCell cell_price = row.getCell(8);
                if(cell_price != null){
                    String price = getCellVal(cell_price);
                    if(StringUtils.isNotBlank(price)){
                        try{
                            sellOffer.setPrice(Double.valueOf(price));
                        }catch(Exception e){
                            sellOffer.setPriceMemo(price);
                        }
                    }
                }
                //图书规格（开本）
                HSSFCell cell_bookSize = row.getCell(12);
                if(cell_bookSize != null){
                    String bookSize = getCellVal(cell_bookSize);
                    if(StringUtils.isNotBlank(bookSize)){
                        sellOffer.getOrCreateProperty("bookSize").setPropertyValue(bookSize);
                    }
                }
                //成品尺寸
                HSSFCell cell_PRODUCT_SIZE = row.getCell(13);
                if(cell_PRODUCT_SIZE != null){
                    String PRODUCT_SIZE = getCellVal(cell_PRODUCT_SIZE);
                    if(StringUtils.isNotBlank(PRODUCT_SIZE)){
                        sellOffer.getOrCreateProperty("PRODUCT_SIZE").setPropertyValue(PRODUCT_SIZE);
                    }
                }
                //页数
                HSSFCell cell_pageTotal = row.getCell(14);
                if(cell_pageTotal != null){
                    String pageTotal = getCellVal(cell_pageTotal);
                    if(StringUtils.isNotBlank(pageTotal)){
                        sellOffer.getOrCreateProperty("pageTotal").setPropertyValue(pageTotal);
                    }
                }
                //字数
                HSSFCell cell_wordNm = row.getCell(16);
                if(cell_wordNm != null){
                    String wordNm = getCellVal(cell_wordNm);
                    if(StringUtils.isNotBlank(wordNm)){
                        sellOffer.getOrCreateProperty("wordNm").setPropertyValue(wordNm);
                    }
                }

                //作者
                HSSFCell cell_author = row.getCell(20);
                if(cell_author != null){
                    String author = getCellVal(cell_author);
                    if(StringUtils.isNotBlank(author)){
                        sellOffer.setAuthor(author);
                    }
                }
                //作者简介
                HSSFCell cell_authorInfo = row.getCell(22);
                if(cell_authorInfo != null){
                    String authorInfo = getCellVal(cell_authorInfo);
                    if(StringUtils.isNotBlank(authorInfo)){
                        sellOffer.getOrCreateRichProperty("authorInfo").setPropertyValue(authorInfo);
                    }
                }
                //中图分类代码
                HSSFCell cell_ztCategoryCode = row.getCell(24);
                if(cell_ztCategoryCode != null){
                    String ztCategoryCode = getCellVal(cell_ztCategoryCode);
                    if(StringUtils.isNotBlank(ztCategoryCode)){
                            ProductCategory category = productCategoryDao.getProductCategoryByAliasName(ztCategoryCode);
                            if (category != null) {
                                sellOffer.setProductCategoryId(category.getId());
                            }else{
                                sellOffer.getOrCreateProperty("ztCategoryCode").setPropertyValue(ztCategoryCode);
                            }
                    }
                }
                //分类序号
                HSSFCell cell_categoryNo = row.getCell(25);
                if(cell_categoryNo != null){
                    String categoryNo = getCellVal(cell_categoryNo);
                    if(StringUtils.isNotBlank(categoryNo)){
                        sellOffer.getOrCreateProperty("categoryNo").setPropertyValue(categoryNo);
                    }
                }

                //责任编辑
                HSSFCell cell_editor = row.getCell(28);
                if(cell_editor != null){
                    String editor = getCellVal(cell_editor);
                    if(StringUtils.isNotBlank(editor)){
                        sellOffer.setEditor(editor);
                        sellOffer.setExecutiveEditor(editor);
                        sellOffer.getOrCreateProperty("editor").setPropertyValue(editor);
                    }
                }
                //图书分类
                HSSFCell cell_bookCategory = row.getCell(38);
                if(cell_bookCategory != null){
                    String bookCategory = getCellVal(cell_bookCategory);
                    if(StringUtils.isNotBlank(bookCategory)){
                        sellOffer.getOrCreateProperty("bookCategory").setPropertyValue(bookCategory);
                    }
                }
                //丛书名
                HSSFCell cell_seriesName = row.getCell(39);
                if(cell_seriesName != null){
                    String seriesName = getCellVal(cell_seriesName);
                    if(StringUtils.isNotBlank(seriesName)){
                        sellOffer.getOrCreateProperty("seriesName").setPropertyValue(seriesName);
                    }
                }
                //中图分类
                HSSFCell cell_ztCategory = row.getCell(40);
                if(cell_ztCategory != null){
                    String ztCategory = getCellVal(cell_ztCategory);
                    if(StringUtils.isNotBlank(ztCategory)){
                        sellOffer.getOrCreateProperty("ztCategory").setPropertyValue(ztCategory);
                    }
                }
                //语种
                HSSFCell cell_language = row.getCell(45);
                if(cell_language != null){
                    String language = getCellVal(cell_language);
                    if(StringUtils.isNotBlank(language)){
                        sellOffer.getOrCreateProperty("language").setPropertyValue(language);
                    }
                }
                //出版时间
                HSSFCell cell_publicationDate = row.getCell(62);
                if(cell_publicationDate != null){
                    String publicationDate = getCellVal(cell_publicationDate);
                    if(StringUtils.isNotBlank(publicationDate)){
                        publicationDate = publicationDate.replace("年","-");
                        publicationDate = publicationDate.replace("月","-");
                        publicationDate = publicationDate.replace("日","").trim();
                        sellOffer.getOrCreateProperty("printingDate").setPropertyValue(publicationDate);
                        try{
                            SimpleDateFormat sdf =   new SimpleDateFormat( "yyyy-MM-dd" );
                            Date date = sdf.parse(publicationDate);
                            sellOffer.setPublicationDate(date);
                        }catch (Exception e){
                            e.printStackTrace();
                        }
                    }
                }
                //印刷时间
                HSSFCell cell_printingDate = row.getCell(63);
                if(cell_printingDate != null){
                    String printingDate = getCellVal(cell_printingDate);
                    if(StringUtils.isNotBlank(printingDate)){
                        printingDate = printingDate.replace("年","-");
                        printingDate = printingDate.replace("月","-");
                        printingDate = printingDate.replace("日","").trim();
                        sellOffer.getOrCreateProperty("printingDate").setPropertyValue(printingDate);
//                        try{
//                            SimpleDateFormat sdf =   new SimpleDateFormat( " yyyy年MM月dd日" );
//                            Date date = sdf.parse( printingDate );
//                            SimpleDateFormat sdf2 =   new SimpleDateFormat( " yyyy-MM-dd" );
//                            sellOffer.getOrCreateProperty("printingDate").setPropertyValue(sdf2.format(date));
//                        }catch (Exception e){
//                            e.printStackTrace();
//                        }
                    }
                }
                //ISBN
                HSSFCell cell_isbn = row.getCell(67);
                if(cell_isbn != null){
                    String isbn = getCellVal(cell_isbn);
                    if(StringUtils.isNotBlank(isbn)){
                        isbn = isbn.substring(isbn.indexOf("ISBN")+4).trim();
                        sellOffer.setIsbn(isbn);
                    }
                }
                //内容简介
                HSSFCell cell_PRODUCT_DETAIL = row.getCell(71);
                if(cell_PRODUCT_DETAIL != null){
                    String PRODUCT_DETAIL = getCellVal(cell_PRODUCT_DETAIL);
                    if(StringUtils.isNotBlank(PRODUCT_DETAIL)){
                        sellOffer.getOrCreateRichProperty("PRODUCT_DETAIL").setPropertyValue(PRODUCT_DETAIL);
                    }
                }

                // 标识数据来源
                sellOffer.setSourceFlag("1");
                Date now = new Date();

                sellOffer.setPublishFlag(PublishStatus.PUBLISH.getCode());
                sellOffer.setStatus(SellOfferStatus.NEW.getCode());
                sellOffer.setDeleteFlag(DeleteStatus.INIT.getCode());
                sellOffer.setCreateBy(account.getAccountName());
                sellOffer.setCreateDate(now);
                sellOffer.setUpdateBy(account.getAccountName());
                sellOffer.setUpdateDate(now);
                sellOffer.setUpdateBy(account.getAccountName());
                sellOffer.setUpdateDate(now);

                SellOfferItem item = new SellOfferItem();
                // sku记录
                item.setSku(sellOffer.getSpu());
                item.setTitle(sellOffer.getTitle());
                item.setCreateBy(account.getAccountName());
                item.setCreateDate(now);
                item.setUpdateBy(account.getAccountName());
                item.setUpdateDate(now);

                if(sellOffer.getPrice() !=null){
                    item.setPrice(sellOffer.getPrice());
                }

                sellOffer.addSellOfferItem(item);

//                if(sellOffer.getId() == null){
//                    sellOffer.setPublishFlag(PublishStatus.PUBLISH.getCode());
//                    sellOffer.setStatus(SellOfferStatus.NEW.getCode());
//                    sellOffer.setDeleteFlag(DeleteStatus.INIT.getCode());
//                    sellOffer.setCreateBy(account.getAccountName());
//                    sellOffer.setCreateDate(now);
//                    sellOffer.setUpdateBy(account.getAccountName());
//                    sellOffer.setUpdateDate(now);
//                }else{
//                    sellOffer.setUpdateBy(account.getAccountName());
//                    sellOffer.setUpdateDate(now);
//                }

//                if(sellOffer.getId() == null){
//                    SellOfferItem item = new SellOfferItem();
//                    // sku记录
//                    item.setSku(sellOffer.getSpu());
//                    item.setTitle(sellOffer.getTitle());
//                    item.setCreateBy(account.getAccountName());
//                    item.setCreateDate(now);
//                    item.setUpdateBy(account.getAccountName());
//                    item.setUpdateDate(now);
//
//                    if(sellOffer.getPrice() !=null){
//                        item.setPrice(sellOffer.getPrice());
//                    }
//
//                    sellOffer.addSellOfferItem(item);
//                }else{
//                    SellOfferItem item = sellOffer.getSellOfferItem();
//                    if(item == null){
//                        item = new SellOfferItem();
//                        // sku记录
//                        item.setSku(sellOffer.getSpu());
//                        item.setTitle(sellOffer.getTitle());
//                        item.setCreateBy(account.getAccountName());
//                        item.setCreateDate(now);
//                        item.setUpdateBy(account.getAccountName());
//                        item.setUpdateDate(now);
//
//                        if(sellOffer.getPrice() !=null){
//                            item.setPrice(sellOffer.getPrice());
//                        }
//
//                        sellOffer.addSellOfferItem(item);
//                    }else{
//                        item.setSku(sellOffer.getSpu());
//                        item.setTitle(sellOffer.getTitle());
//                        item.setUpdateBy(account.getAccountName());
//                        item.setUpdateDate(now);
//
//                        if(sellOffer.getPrice() !=null){
//                            item.setPrice(sellOffer.getPrice());
//                        }
//                    }
//                }

                sellOfferList.add(sellOffer);
            }

            sellOfferDao.saveOrUpdateSellOfferList(sellOfferList);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    String getCellVal(HSSFCell cell){
        String cellValue = null;
        String timeStr = "";

        if(cell != null){
            // 判断excel单元格内容的格式，并对其进行转换，以便插入数据库
            switch (cell.getCellType()) {
                case 0:
                    if (HSSFDateUtil.isCellDateFormatted(cell)) {
                        SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
                        java.util.Date date=new java.util.Date();
                        timeStr=sdf.format(cell.getDateCellValue());
                    } else {
                        double cellValue_ = cell.getNumericCellValue();
                        if(Double.parseDouble(String.valueOf((int)cellValue_)) == cellValue_)
                            cellValue = String.valueOf((int) cellValue_);
                        else
                            cellValue = String.valueOf(cellValue_);
                    }
                    break;
                case 1:
                    cellValue = cell.getStringCellValue();
                    break;
                case 2:
                    cellValue = cell.getNumericCellValue() + "";
// cellValue = String.valueOf(cell.getDateCellValue());
                    break;
                case 3:
                    cellValue = "";
                    break;
                case 4:
                    cellValue = String.valueOf(cell.getBooleanCellValue());
                    break;
                case 5:
                    cellValue = String.valueOf(cell.getErrorCellValue());
                    break;
            }
        }
        return cellValue;
    }
}

