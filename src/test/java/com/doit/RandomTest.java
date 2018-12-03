package com.doit;

import org.junit.Test;

import java.util.Random;

/**
 * Created by mushan on 2017-10-16.
 */
public class RandomTest {

    @Test
    public void test1(){
        Random rnd = new Random(System.currentTimeMillis());
        for (int i=0; i<100;i++){
            long sec = Math.abs(rnd.nextLong() % 30);
            sec = Math.max(sec, 5);
            System.out.print(sec + " ,");
        }
    }
}
