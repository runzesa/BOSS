package com.workflow.task;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.jbpm.api.Configuration;
import org.jbpm.api.ProcessEngine;
import org.jbpm.api.TaskService;
import org.jbpm.api.task.Task;
import org.jdom.Document;
import org.jdom.Element;
import org.jdom.output.Format;
import org.jdom.output.XMLOutputter;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import com.workflow.util.XmlInfo;

/**
 * ���̽�����,ȡֻ��/��д���ֶ�
 */
public class GetFormItemAction implements Controller {

	public ModelAndView handleRequest(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		System.out.println("GetFormItemAction");
		
		String taskId = request.getParameter("taskid");
		
		ProcessEngine pe = Configuration.getProcessEngine();
		TaskService ts = pe.getTaskService();
		
		//��������id��ȡ����
		Task currentTask = ts.getTask(taskId);
		String taskName = currentTask.getName();
		//������task�ڵ���ȡ
		XmlInfo xmlInfo = new XmlInfo(getProcessDefinitionName(currentTask));
		Element taskNode = xmlInfo.getElementByName("task", taskName);
		
		//��ȡ�ɶ�/��д�ı��ֶ�
		String formItem_r = taskNode.getAttributeValue("formitem_r")!=null?
				taskNode.getAttributeValue("formitem_r"):"";
		String formItem_w = taskNode.getAttributeValue("formitem_w")!=null?
				taskNode.getAttributeValue("formitem_w"):"";
		
		Element returnRoot = new Element("form");
		Element itemElement = new Element("formitem");
		itemElement.setAttribute("formitem_r",formItem_r);
		itemElement.setAttribute("formitem_w",formItem_w);
		
		returnRoot.addContent(itemElement);
		Document returnDoc = new Document(returnRoot);
		response.setContentType("application/xml;charset=GB2312");
		Format format = Format.getPrettyFormat();
		format.setEncoding("GB2312");
		XMLOutputter outer = new XMLOutputter(format);
		outer.output(returnDoc, response.getWriter());
		outer.output(returnDoc, System.out);

//		pe.getExecutionService().endProcessInstance("workflow_join.1300029.�ƻ��ַ�", "");
//		pe.getExecutionService().deleteProcessInstanceCascade("wt1.2050007");//��Ҫɾ��
//		pe.getExecutionService().deleteProcessInstanceCascade("wt1.2070001");//��Ҫɾ��
//		pe.getExecutionService().deleteProcessInstanceCascade("wt1.2220007");//��Ҫɾ��
		
		/*TODO test start ->
		System.out.println("start-----\n");
		EnvironmentImpl env = ((EnvironmentFactory)pe).openEnvironment();
		List<Task> list = ts.createTaskQuery().processInstanceId("workflow_join.1750028").list();
		String s = "";
		for (Task task : list) {
			TaskImpl taskImpl = (TaskImpl)task;
			ExecutionImpl executionImpl = taskImpl.getExecution();
			System.out.println(executionImpl.getName());
			List<Transition> transitionList = taskImpl.getExecution().getActivity().getIncomingTransitions();
			for (Transition transition : transitionList) {
				if(!transition.getName().equals(executionImpl.getName())){
					s = taskImpl.getId();
				}
			}
		}
		env.close();
		if(!"".equals(s) && !"null".equals(s) && null!=s)
			ts.completeTask(s);
		System.out.println("\nend-----");
		*/
		
		return null;
	}
	
	/**
	 * ͨ����������������id��������xml�ļ�������
	 * @param curTask
	 * @return
	 */
	public String getProcessDefinitionName(Task curTask){
		String[] names = (curTask.getExecutionId()).split("\\.");
		return names[0];
	}
}
