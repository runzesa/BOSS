package com.workflow.task;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

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

import com.workflow.util.GetData;
import com.workflow.util.XmlInfo;
import com.workflow.util.beans.ObjectElementBean;
import com.workflow.util.beans.TransitionBean;

/**
 * ȡ�������б��action
 */
public class FormSubmit implements Controller {
	public ModelAndView handleRequest(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		System.out.println("FormSubmit");
		
		//ȡ������id
		String taskId = request.getParameter("taskid");
		
		//��������idȡ������
		ProcessEngine pe = Configuration.getProcessEngine();
		TaskService ts = pe.getTaskService();
		Task currentTask = ts.getTask(taskId);
		
		//�ύʱ���û�������ϢҲ������,�жϽڵ���ܻ��õ�
		Map<String,Object> map = new HashMap<String,Object>();
		Set<?> keys = request.getParameterMap().keySet();
		for (Object key : keys) {
			map.put(key+"", request.getParameter(key+""));
		}
		ts.setVariables(taskId, map);
		
		//ͨ�����������������,ȡ��xml
		XmlInfo xmlInfo = new XmlInfo(getProcessDefinitionName(currentTask));
		
		Element root = new Element("returnNext");
		Element current = new Element("current");
		current.setAttribute("id",taskId);
		//��ǰ���ڽ��е�������
		current.setAttribute("name",currentTask.getActivityName());
		root.addContent(current);
		
		//ȡ����ڵ���������б�
		List<TransitionBean> transitionList = xmlInfo.getNodeTransitionList(currentTask.getActivityName());
		ObjectElementBean bean = null;
		for (TransitionBean tranBean : transitionList) {
			Element transition = new Element("transition");
			transition.setAttribute("name",tranBean.getName());
			//������ָ��Ľڵ�
			bean = xmlInfo.getTransitionTo(tranBean.getTo());
			String tagName = bean.getTagName();//�ڵ��ǩ��
			String name = bean.getName();//�ڵ���
			
			Element next = new Element("next");
			next.setAttribute("name", name);
			next.setAttribute("type", tagName);
			//���������ָ�����end/task/decision�ڵ�
			if("end".equals(tagName) || "task".equals(tagName) || "decision".equals(tagName)){
				if(bean.getUserId()!=null){//��̬�û�->�������޸ĵ������û�������������
					next.setAttribute("usertype", "static_user");
					String userid = GetData.getIdByUserName(bean.getUserId());
					next.setAttribute("userid", userid);
					next.setAttribute("username", GetData.getNameById(userid));
					next.setAttribute("readonly", "true");
				}else{
					next.setAttribute("user", bean.getUser());//�û�����
					//�û������Ƿ��Ѿ���д��������id�ı�����
					String user = ts.getVariable(taskId, bean.getUser())+"";
					//�û��������������id�ı�����,��ֻ���û����ʹ���xml,����ǰ̨�����Լ�ѡ
					if (user == null || "null".equals(user) || "".equals(user)) {
						next.setAttribute("usertype", bean.getUserType());
					//����û�����������id��Ӧ�ı�����,�͸���Ĭ��ֵ
					} else {
						next.setAttribute("usertype", "static_user");
						next.setAttribute("userid", user);
						next.setAttribute("username", GetData.getNameById(user));
					}
				}
			//����ǩΪfork��join
			}else if("fork".equals(tagName) || "join".equals(tagName)){
				//����ȡ��������
				List<TransitionBean> transitionList2 = xmlInfo.getNodeTransitionList(name);
				ObjectElementBean bean2 = null;
				for (TransitionBean tranBean2 : transitionList2) {
					bean2 = xmlInfo.getTransitionTo(tranBean2.getTo());//�����߶�Ӧ���ӽڵ�
					Element childnext = new Element("childnext"); 
					childnext.setAttribute("name", bean2.getName());
					childnext.setAttribute("type", bean2.getTagName());
					childnext.setAttribute("user", bean2.getUser());
					if(bean2.getUserId()!=null){//��̬�û�-�������޸ĵ�
						childnext.setAttribute("usertype", "static_user");
						System.out.println(bean2.getUserId());
						String userid = GetData.getIdByUserName(bean2.getUserId());
						childnext.setAttribute("userid", userid);
						childnext.setAttribute("username", GetData.getNameById(userid));
						childnext.setAttribute("readonly", "true");
					}else{
						//�û������Ƿ��Ѿ���д��������id�ı�����
						String user = ts.getVariable(taskId, bean2.getUser())+"";
						//�û��������������id�ı�����,��ֻ���û����ʹ���xml,����ǰ̨�����Լ�ѡ
						if (user == null || "null".equals(user) || "".equals(user)) {
							childnext.setAttribute("usertype", bean2.getUserType());
						//����û�����������id��Ӧ�ı�����,�͸���Ĭ��ֵ
						} else {
							childnext.setAttribute("usertype", "static_user");
							childnext.setAttribute("userid", user);
							childnext.setAttribute("username", GetData.getNameById(user));
						}
					}
					next.addContent(childnext);
				}
//			}else if("".equals(tagName)){
			}else{
				System.out.println("Error: unknow tagName ->FormSubmit");
			}
			transition.addContent(next);
			root.addContent(transition);
		}

		Document doc = new Document(root);
		response.setContentType("application/xml;charset=GB2312");
		Format format = Format.getPrettyFormat();
		format.setEncoding("GB2312");
		XMLOutputter outer = new XMLOutputter(format);
		outer.output(doc, response.getWriter());
		outer.output(doc, System.out);
/* old-
<?xml version="1.0" encoding="GB2312"?>
<returnNext>
  <current id="130002" name="�Ƴ����" />
  <next name="�������" outname="to �������" asstype="assignee" assvalue="chuzhang" />
  <next name="��ͬ��" outname="to ��ͬ��" asstype="endprocess" assvalue="endprocess" />
  <next name="task��name" outname="�����task�������ߵ�name" asstype="�û�����assignee" assvalue="task���û�����init_user" />
</returnNext>

 * new-
<?xml version="1.0" encoding="GB2312"?>
<returnNext>
  <current id="130002" name="�Ƴ����" />
  <transition name="">
  	<next type="task" name="" asstype="" assvalue=""/>
  	<next type="task" name="" asstype="" assvalue=""/>
  </transition>
  <transition name="">
  	<next type="fork" name="">
		<childnext type="task" name="" asstype="" assvalue=""/>
		<childnext type="task" name="" asstype="" assvalue=""/>
  	</next>
  	<next type="task" name="" asstype="" assvalue=""/>
  </transition>
  ......
  <!--next name="�������" outname="to �������" asstype="assignee" assvalue="chuzhang" />
  <next name="��ͬ��" outname="to ��ͬ��" asstype="endprocess" assvalue="endprocess" />
  <next name="task��name" outname="�����task�������ߵ�name" asstype="�û�����assignee" assvalue="task���û�����init_user" /-->
</returnNext>


FormSubmit
<?xml version="1.0" encoding="GB2312"?>
<returnNext>
  <current id="500015" name="����ƻ�" />
  <transition name="������1">
    <next name="��֧" type="fork">
      <childnext name="B��д�ƻ�" type="task" usertype="assignee" user="B" />
      <childnext name="A��д�ƻ�" type="task" usertype="assignee" user="A" />
    </next>
  </transition>
</returnNext>

FormSubmit
<?xml version="1.0" encoding="GB2312"?>
<returnNext>
  <current id="360025" name="�Ƴ����" />
  <transition name="to �������">
    <next name="�������" type="task" usertype="assignee" user="chuzhang" />
  </transition>
  <transition name="to ��ͬ��">
    <next name="��ͬ��" type="end" usertype="endprocess" user="endprocess" />
  </transition>
  <transition name="����">
    <next name="����" type="task" usertype="assignee" user="init_user" />
  </transition>
</returnNext>
*/
		return null;
	}
	
	private String getProcessDefinitionName(Task curTask){
		String executionId = (curTask.getExecutionId()).replace(".",",");
		String[] names = (executionId).split(",");
		return names[0];
	}
}
