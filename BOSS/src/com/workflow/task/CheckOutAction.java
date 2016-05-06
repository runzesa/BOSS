package com.workflow.task;

import java.net.URLDecoder;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.jbpm.api.Configuration;
import org.jbpm.api.Execution;
import org.jbpm.api.ExecutionService;
import org.jbpm.api.HistoryService;
import org.jbpm.api.ProcessEngine;
import org.jbpm.api.TaskService;
import org.jdom.Document;
import org.jdom.Element;
import org.jdom.output.Format;
import org.jdom.output.XMLOutputter;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import com.workflow.util.Tools;

/**
 * ���������ύ��action
 */
public class CheckOutAction implements Controller {
	public ModelAndView handleRequest(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		System.out.println("CheckOutAction");
		
		String taskId = request.getParameter("taskid");//����id
		String outTo = URLDecoder.decode(request.getParameter("outto"),"utf-8");//��ת�����ߵ�name,������ת�õĹؼ���
		String outType = request.getParameter("outtype");//��ת�û�����
		String outValue = request.getParameter("outvalue");//����˭(id)
		String assValue = request.getParameter("assvalue");//��ת�û�����
//		String tagname = request.getParameter("tagname");//����Ľڵ�����
		
		ProcessEngine pe = Configuration.getProcessEngine();
		ExecutionService es = pe.getExecutionService();
		TaskService ts = pe.getTaskService();
		HistoryService hs = pe.getHistoryService();

		//ȡ����id,���浽��ʷ,�����task���֮ǰ��
		String eid = ts.getTask(taskId).getExecutionId();
		Execution exe = es.findExecutionById(eid);
		eid = Tools.getRootExecution(exe).getId();
		//es.createVariables(, ts.getVariables(taskId, ts.getVariableNames(taskId)), true);
		if(hs.getVariableNames(eid).size()==0){
			es.createVariables(eid, ts.getVariables(taskId, ts.getVariableNames(taskId)), true);
		}else{
			es.setVariables(eid, ts.getVariables(taskId, ts.getVariableNames(taskId)));
		}
		
		//��Ϊ��̬�û���ֱ�Ӹ���������ָ����ת
		if(outType.equals("static_user")){
			Map<String,Object> map = new HashMap<String,Object>();
			String keys[] = assValue.split(",");
			String users[] = outValue.split(",");
			
			if(keys.length==1){
				map.put(keys[0],users[0]);
			}else{
				for (int i = 0; i < keys.length && users.length==keys.length; i++) {
					if(!"init_user".equals(keys[i]) && !"".equals(keys[i]) && !"".equals(users[i]))
						map.put(keys[i], users[i]);
				}
			}
			ts.setVariables(taskId,map);
			ts.completeTask(taskId,outTo);
		//����Ͱ��û��������ȥ����ת
		}else if(outType.equals("assignee")){//������1
			Map<String,Object> map = new HashMap<String,Object>();
			String keys[] = assValue.split(",");
			String users[] = outValue.split(",");
			
			if(keys.length==1){
				map.put(keys[0],users[0]);
			}else{
				for (int i = 0; i < keys.length && users.length==keys.length; i++) {
					if(!"init_user".equals(keys[i]) && !"".equals(keys[i]) && !"".equals(users[i]))
						map.put(keys[i], users[i]);
				}
			}
			ts.setVariables(taskId,map);
			ts.completeTask(taskId,outTo);
		//��Ϊ����Ҳ��ֱ����ת
		}else if(outType.equals("endprocess") || outType.equals("decisionprocess")){
			//�ѱ���������ʷ
			ts.completeTask(taskId,outTo);
		}else{
			System.out.println("Error: Unknow outType->CheckOutAction");
		}
		
		Element returnRoot = new Element("returnResult");
		Element result = new Element("result");
		result.setAttribute("return","success");
		returnRoot.addContent(result);
		Document returnDoc = new Document(returnRoot);
		response.setContentType("application/xml;charset=GB2312");
		Format format = Format.getPrettyFormat();
		format.setEncoding("GB2312");
		XMLOutputter outer = new XMLOutputter(format);
		outer.output(returnDoc, response.getWriter());
		outer.output(returnDoc, System.out);
		return null;
	}
}
