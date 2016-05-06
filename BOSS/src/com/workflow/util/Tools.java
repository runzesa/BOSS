/**
 * 
 */
package com.workflow.util;

import org.jbpm.api.Execution;

/**
 * ������
 */
public class Tools {
	
	/**
	 * ȡ����id
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
