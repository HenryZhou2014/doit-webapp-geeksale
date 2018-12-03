package com.doit;

import com.doit.ecommerce.model.GoodsSaleCategory;
import com.doit.ecommerce.model.Offer2SaleCategory;
import com.doit.ecommerce.model.SellOffer;
import com.doit.ecommerce.service.GoodsSaleCategoryManager;
import com.doit.ecommerce.service.Offer2SaleCategoryManager;
import com.doit.ecommerce.service.SellOfferManager;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.annotation.Rollback;

/**
 * Created by mushan on 2017-01-04.
 */
public class Offer2SaleCategoryTest extends BaseDaoTestCase{

    @Autowired
    Offer2SaleCategoryManager offer2SaleCategoryManager;

    @Autowired
    SellOfferManager sellOfferManager;

    @Autowired
    GoodsSaleCategoryManager goodsSaleCategoryManager;

    @Test
    @Rollback(false)
    public void testAdd(){
        SellOffer sellOffer = sellOfferManager.get(2974l);

        GoodsSaleCategory goodsSaleCategory = goodsSaleCategoryManager.getCategory("1005010");

        Offer2SaleCategory offer2SaleCategory = new Offer2SaleCategory();
        offer2SaleCategory.setSellOffer(sellOffer);
        offer2SaleCategory.setGoodsSaleCategory(goodsSaleCategory);

        offer2SaleCategoryManager.saveOrUpdate(offer2SaleCategory);
        System.out.println("id=" + offer2SaleCategory.getId());
    }

    @Test
    public void list(){

        GoodsSaleCategory goodsSaleCategory = goodsSaleCategoryManager.getCategory("1005010");

        for(Offer2SaleCategory item : goodsSaleCategory.getOffer2SaleCategories()){
            System.out.println(item.getSellOffer().getTitle());
        }
    }

    @Test
    public void list2(){

        SellOffer sellOffer = sellOfferManager.get(2849l);

        for(Offer2SaleCategory item : sellOffer.getOffer2SaleCategories()){
            System.out.println(item.getGoodsSaleCategory().getTitle());
        }
    }
}
