package com.doit;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.HibernateException;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.BeansException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate4.HibernateCallback;
import org.springframework.orm.hibernate4.HibernateTemplate;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.AbstractTransactionalJUnit4SpringContextTests;

import java.util.*;

/**
 * Base class for running DAO tests.
 *
 * @author <a href="mailto:matt@raibledesigns.com">Matt Raible</a>
 */
@ContextConfiguration(
        locations = {
                "classpath:/applicationContext-dao.xml",
                "classpath:/applicationContext.xml",
                "classpath:/applicationContext-*.xml",
                "classpath*:/applicationContext-*.xml",
                "classpath*:/applicationContext-base.xml",
                "classpath*:/applicationContext-base-web.xml",
                "classpath*:/applicationContext-common.xml",
                "classpath*:/applicationContext-account.xml",
                "classpath*:/applicationContext-cms.xml",
                "classpath:/applicationContext-service.xml",
                "classpath:/applicationContext-bookstore-core.xml",
                "classpath:/applicationContext-ecommerce.xml",
                "classpath*:/applicationContext.xml",
                "classpath*:/applicationContext.xml",
                "classpath:**/applicationContext*.xml"})

        /*classpath:/applicationContext-validation.xml
        classpath:/applicationContext-compass.xml
        classpath:/applicationContext-cache.xml*/

public abstract class BaseDaoTestCase extends AbstractTransactionalJUnit4SpringContextTests {
    @Autowired
    private SessionFactory sessionFactory;

    /**
     * Log variable for all child classes. Uses LogFactory.getLog(getClass()) from Commons Logging
     */
    protected final Log log = LogFactory.getLog(getClass());
    /**
     * ResourceBundle loaded from src/test/resources/${package.name}/ClassName.properties (if exists)
     */
    protected ResourceBundle rb;

    /**
     * Default constructor - populates "rb" variable if properties file exists for the class in
     * src/test/resources.
     */
    public BaseDaoTestCase() {
        // Since a ResourceBundle is not required for each class, just
        // do a simple check to see if one exists
        String className = this.getClass().getName();

        try {
            rb = ResourceBundle.getBundle(className);
        } catch (MissingResourceException mre) {
            log.trace("No resource bundle found for: " + className);
        }
    }

    /**
     * Utility method to populate a javabean-style object with values
     * from a Properties file
     *
     * @param obj the model object to populate
     * @return Object populated object
     * @throws Exception if BeanUtils fails to copy properly
     */
    protected Object populate(final Object obj) throws Exception {
        // loop through all the beans methods and set its properties from its .properties file
        Map<String, String> map = new HashMap<String, String>();

        for (Enumeration<String> keys = rb.getKeys(); keys.hasMoreElements();) {
            String key = keys.nextElement();
            map.put(key, rb.getString(key));
        }

        BeanUtils.copyProperties(obj, map);

        return obj;
    }

    /**
     * Create a HibernateTemplate from the SessionFactory and call flush() and clear() on it.
     * Designed to be used after "save" methods in tests: http://issues.appfuse.org/browse/APF-178.
     *
     * @throws BeansException
     *          when can't find 'sessionFactory' bean
     */
    protected void flush() throws BeansException {
        HibernateTemplate hibernateTemplate = new HibernateTemplate(sessionFactory);
        hibernateTemplate.flush();
        hibernateTemplate.clear();
    }


    public void syncTest(){
        String hqlOffer2SaleCategory = "insert into offer_2_sale_category(offer_id,sale_category_id,seq_no,create_by,create_date,update_by,update_date) values((select so.id from sell_offer so where so.SPU = ?),?,(select max(seq_no)+1 from offer_2_sale_category where sale_category_id=?),?,?,?,?) ON DUPLICATE KEY UPDATE update_by=?,update_date=?";

        HibernateTemplate hibernateTemplate = new HibernateTemplate(sessionFactory);
//        Integer update = (Integer)hibernateTemplate.executeWithNativeSession(new HibernateCallback() {
//            public Object doInHibernate(Session session) throws HibernateException {
//                SQLQuery queryObject = session.createSQLQuery(hqlOffer2SaleCategory);
//                int position = 0;
//                Object[] var4 = new Object[]{sellOffer.getSpu(),sellOffer.getGoodsSaleCategoryId(),sellOffer.getGoodsSaleCategoryId(),sellOffer.getCreateBy(),sellOffer.getCreateDate(),sellOffer.getUpdateBy(),sellOffer.getUpdateDate()
//                        ,sellOffer.getUpdateBy(),sellOffer.getUpdateDate()};
//                int var5 = var4.length;
//
//                for(int var6 = 0; var6 < var5; ++var6) {
//                    Object val = var4[var6];
//                    queryObject.setParameter(position++, val);
//                }
//
//                return new Integer(queryObject.executeUpdate());
//            }
//        });
    }
}
