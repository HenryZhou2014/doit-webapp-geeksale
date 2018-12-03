package com.doit;

import com.doit.xiaowanjia.model.MarketingMaterial;
import com.doit.xiaowanjia.service.MarketingMaterialManager;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.annotation.Rollback;

/**
 * Created by mushan on 2017-09-28.
 */
public class MarketMaterialTest extends BaseDaoTestCase {
    @Autowired
    MarketingMaterialManager marketingMaterialManager;

    @Test
    @Rollback(false)
    public void testAdd(){
        MarketingMaterial marketingMaterial = new MarketingMaterial();
        marketingMaterial.setOwnerId(215l);
        marketingMaterial.setTitle("测试添加素材");
        marketingMaterial.setContent("测试添加素材内容");
        marketingMaterial.setContentType("1");

        marketingMaterialManager.save(marketingMaterial);
    }
}
