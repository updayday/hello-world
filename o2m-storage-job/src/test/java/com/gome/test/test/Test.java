package com.gome.test.test;

import java.text.SimpleDateFormat;
import java.util.Date;


public class Test {

	public static void main(String[] args) {
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String now=df.format(new Date());
		
	}
}
