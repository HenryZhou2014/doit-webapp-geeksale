package com.doit;

import com.doit.common.service.ParameterManager;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * Created by mushan on 2017-03-07.
 */
public class ParameterTest extends BaseDaoTestCase{

    @Autowired
    ParameterManager parameterManager;

    @Test
    public void a1(){
        String val =parameterManager.getValue("founderftpconfig", "ftpserver");
        System.out.println(val);
    }
}
