/**
 * 
 */
package com.workflow.util.beans;

/**
 * @author Administrator
 *
 */
public class TransitionBean {
	/** *连接线名* **/
	private String name;
	/** *连接到哪里* **/
	private String to;

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getTo() {
		return this.to;
	}

	public void setTo(String to) {
		this.to = to;
	}

	public String toString() {
		return "TransitionBean: name=" + this.name + "; to=" + this.to + "; ";
	}
}
