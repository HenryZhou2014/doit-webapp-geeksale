package com.doit;

import junit.framework.TestCase;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.encoding.PasswordEncoder;

/**
 * Created by mushan on 2016-03-17.
 */
public class PasswordTest extends TestCase {

    @Autowired
    PasswordEncoder passwordEncoder;

    public void test1(){
        /*passwordEncoder = new
        String md5 = passwordEncoder.encodePassword("afli", (Object)null);*/
    }
}
