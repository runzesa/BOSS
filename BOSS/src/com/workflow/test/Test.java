package com.workflow.test;

import java.util.*;

import javax.script.*;

import org.jbpm.api.task.Task;

@SuppressWarnings("unused")
public class Test {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		/*
		String a = "#{1234567}";
		String b = a.substring(2,a.length()-1);
		System.out.println(b);*/
		
		// create a script engine manager
        ScriptEngineManager factory = new ScriptEngineManager();
        // create a JavaScript engine
        ScriptEngine engine = factory.getEngineByName("js");
        // evaluate JavaScript code from String
        System.out.println(factory.getEngineFactories().get(0).getEngineName());
        try {
	        engine.eval("print('Hello, World')");
			
			ScriptEngine jse = new ScriptEngineManager().getEngineByName("JavaScript");
			System.out.println(jse);
			System.out.println(jse.eval("6 > 3 ? 'a' : 'b'"));
		} catch (ScriptException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
