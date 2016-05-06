/**
 * 
 */
package com.workflow.util;

import org.jbpm.api.Execution;

/**
 * 工具类
 */
public class Tools {
	
	/**
	 * 取流程id
	 * @param execution
	 * @return
	 */
	public static Execution getRootExecution(Execution execution){
		Execution e = execution;
		if(e.getParent()==null)
			return e;
		else
			return getRootExecution(e.getParent());
	}
}
