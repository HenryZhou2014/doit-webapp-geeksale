package com.doit;

import com.doit.account.model.Account;
import com.doit.account.service.AccountManager;
import com.doit.cms.enums.ImageOwnerType;
import com.doit.cms.model.ImageInfo;
import com.doit.cms.service.ImageInfoManager;
import com.doit.ecommerce.dao.SellOfferDao;
import com.doit.ecommerce.model.GoodsOrder;
import com.doit.ecommerce.service.GoodsOrderManager;
import com.doit.ecommerce.service.OfferPropertyManager;
import com.doit.ecommerce.service.SellOfferManager;
import com.doit.xiaowanjia.util.CartUtil;
import com.doit.xiaowanjia.util.FounderResourceUtil;
import org.apache.commons.io.FileUtils;
import org.apache.commons.io.filefilter.IOFileFilter;
import org.apache.commons.lang.StringUtils;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.annotation.Rollback;

import java.io.File;
import java.io.FileFilter;

/**
 * Created by AUSER on 2017/1/10.
 */
public class GoodsOrderTest extends BaseDaoTestCase {

    @Autowired
    GoodsOrderManager goodsOrderManager;

    @Autowired
    AccountManager accountManager;

    @Autowired
    SellOfferManager sellOfferManager;

    @Autowired
    ImageInfoManager imageInfoManager;

    @Autowired
    SellOfferDao sellOfferDao;

    @Test
    public void test1() {
        GoodsOrder goodsOrder = goodsOrderManager.get(44l);
        System.out.print(goodsOrder);
    }

    /**
     * 方正资源库文件转换到商城系统图书商品的测试类
     */
    @Test
//    @Rollback(false)
    public void testParseFounderXml() {
        try {
            //将要创建商品的用户，转资源时默认使用admin账户
            Account account = accountManager.get(1L);

            String pushResDirectory = "d:\\projects\\调查中\\电子阅读\\mirror\\PushRes";
            File root = new File(pushResDirectory);

            // 书本目录集合
            File[] dirs = root.listFiles(new FileFilter() {
                @Override
                public boolean accept(File file) {
                    System.out.println(file.getName());
                    if (!file.isDirectory()) {
                        return false;
                    }
                    if (!StringUtils.isNumeric(file.getName())) {
                        return false;
                    }
                    return true;
                }
            });
//            Collection<File> dirs = FileUtils.listFilesAndDirs(root, fileFilter, dirFilter);

            String resPath = "d:\\projects\\2016.cumtp.com\\svn\\cumtp.com\\source\\cumtp.com\\doit-webapp-bookstores\\target\\doit-webapp-bookstores-1.0-SNAPSHOT\\files\\sellOffer";

            for (File dir : dirs) {
                // 方正资源图片和pdf文件将要copy到的目的目录，实际使用时修改为程序target下面的相关目录中
                // 方正资源XML文件所在目录
                // String founderXmlPath = "d:\\projects\\调查中\\电子阅读\\mirror\\PushRes\\1968721";
                String founderXmlPath = dir.getAbsolutePath();
                System.out.println(founderXmlPath);
                // index.xml 不存在的情况，不处理
                if (!new File(founderXmlPath + File.separator + "index.xml").exists()) {
                    continue;
                }
                // 解析一本书
                //将方正资源库文件解析到Selloffer并存入商城系统中，同时将相关图片与资源文件copy到指定的目录中
                FounderResourceUtil.createSellOfferAndCopyFile(sellOfferManager, account, founderXmlPath, resPath, imageInfoManager);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Test
//    @Rollback(false)
    public void saveImageTest() {
        try {
            ImageInfo imageInfo = new ImageInfo();
            imageInfo.setOwnerId(2848l);
            imageInfo.setOwnerType(ImageOwnerType.SELL_OFFER.getCode());
            imageInfo.setImagePath("ii");
            imageInfoManager.save(imageInfo);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }


}

