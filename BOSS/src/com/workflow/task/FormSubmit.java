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
 * 取连接线列表的action
 */
public class FormSubmit implements Controller {
	public ModelAndView handleRequest(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		System.out.println("FormSubmit");
		
		//取得任务id
		String taskId = request.getParameter("taskid");
		
		//根据任务id取得任务
		ProcessEngine pe = Configuration.getProcessEngine();
		TaskService ts = pe.getTaskService();
		Task currentTask = ts.getTask(taskId);
		
		//提交时把用户表单的信息也做保存,判断节点可能会用到
		Map<String,Object> map = new HashMap<String,Object>();
		Set<?> keys = request.getParameterMap().keySet();
		for (Object key : keys) {
			map.put(key+"", request.getParameter(key+""));
		}
		ts.setVariables(taskId, map);
		
		//通过任务解析出流程名,取其xml
		XmlInfo xmlInfo = new XmlInfo(getProcessDefinitionName(currentTask));
		
		Element root = new Element("returnNext");
		Element current = new Element("current");
		current.setAttribute("id",taskId);
		//当前正在进行的任务名
		current.setAttribute("name",currentTask.getActivityName());
		root.addContent(current);
		
		//取任务节点的连接线列表
		List<TransitionBean> transitionList = xmlInfo.getNodeTransitionList(currentTask.getActivityName());
		ObjectElementBean bean = null;
		for (TransitionBean tranBean : transitionList) {
			Element transition = new Element("transition");
			transition.setAttribute("name",tranBean.getName());
			//连接线指向的节点
			bean = xmlInfo.getTransitionTo(tranBean.getTo());
			String tagName = bean.getTagName();//节点标签名
			String name = bean.getName();//节点名
			
			Element next = new Element("next");
			next.setAttribute("name", name);
			next.setAttribute("type", tagName);
			//如果连接线指向的是end/task/decision节点
			if("end".equals(tagName) || "task".equals(tagName) || "decision".equals(tagName)){
				if(bean.getUserId()!=null){//静态用户->不允许修改的那种用户就填入其属性
					next.setAttribute("usertype", "static_user");
					String userid = GetData.getIdByUserName(bean.getUserId());
					next.setAttribute("userid", userid);
					next.setAttribute("username", GetData.getNameById(userid));
					next.setAttribute("readonly", "true");
				}else{
					next.setAttribute("user", bean.getUser());//用户变量
					//用户变量是否已经填写到了流程id的变量中
					String user = ts.getVariable(taskId, bean.getUser())+"";
					//用户如果不存在流程id的变量中,就只把用户类型存入xml,完了前台让他自己选
					if (user == null || "null".equals(user) || "".equals(user)) {
						next.setAttribute("usertype", bean.getUserType());
					//如果用户存在于流程id对应的变量中,就给他默认值
					} else {
						next.setAttribute("usertype", "static_user");
						next.setAttribute("userid", user);
						next.setAttribute("username", GetData.getNameById(user));
					}
				}
			//若标签为fork或join
			}else if("fork".equals(tagName) || "join".equals(tagName)){
				//继续取其连接线
				List<TransitionBean> transitionList2 = xmlInfo.getNodeTransitionList(name);
				ObjectElementBean bean2 = null;
				for (TransitionBean tranBean2 : transitionList2) {
					bean2 = xmlInfo.getTransitionTo(tranBean2.getTo());//连接线对应的子节点
					Element childnext = new Element("childnext"); 
					childnext.setAttribute("name", bean2.getName());
					childnext.setAttribute("type", bean2.getTagName());
					childnext.setAttribute("user", bean2.getUser());
					if(bean2.getUserId()!=null){//静态用户-不允许修改的
						childnext.setAttribute("usertype", "static_user");
						System.out.println(bean2.getUserId());
						String userid = GetData.getIdByUserName(bean2.getUserId());
						childnext.setAttribute("userid", userid);
						childnext.setAttribute("username", GetData.getNameById(userid));
						childnext.setAttribute("readonly", "true");
					}else{
						//用户变量是否已经填写到了流程id的变量中
						String user = ts.getVariable(taskId, bean2.getUser())+"";
						//用户如果不存在流程id的变量中,就只把用户类型存入xml,完了前台让他自己选
						if (user == null || "null".equals(user) || "".equals(user)) {
							childnext.setAttribute("usertype", bean2.getUserType());
						//如果用户存在于流程id对应的变量中,就给他默认值
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
  <current id="130002" name="科长审核" />
  <next name="处长审核" outname="to 处长审核" asstype="assignee" assvalue="chuzhang" />
  <next name="不同意" outname="to 不同意" asstype="endprocess" assvalue="endprocess" />
  <next name="task的name" outname="到这个task的连接线的name" asstype="用户类型assignee" assvalue="task的用户变量init_user" />
</returnNext>

 * new-
<?xml version="1.0" encoding="GB2312"?>
<returnNext>
  <current id="130002" name="科长审核" />
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
  <!--next name="处长审核" outname="to 处长审核" asstype="assignee" assvalue="chuzhang" />
  <next name="不同意" outname="to 不同意" asstype="endprocess" assvalue="endprocess" />
  <next name="task的name" outname="到这个task的连接线的name" asstype="用户类型assignee" assvalue="task的用户变量init_user" /-->
</returnNext>


FormSubmit
<?xml version="1.0" encoding="GB2312"?>
<returnNext>
  <current id="500015" name="发起计划" />
  <transition name="连接线1">
    <next name="分支" type="fork">
      <childnext name="B填写计划" type="task" usertype="assignee" user="B" />
      <childnext name="A填写计划" type="task" usertype="assignee" user="A" />
    </next>
  </transition>
</returnNext>

FormSubmit
<?xml version="1.0" encoding="GB2312"?>
<returnNext>
  <current id="360025" name="科长审核" />
  <transition name="to 处长审核">
    <next name="处长审核" type="task" usertype="assignee" user="chuzhang" />
  </transition>
  <transition name="to 不同意">
    <next name="不同意" type="end" usertype="endprocess" user="endprocess" />
  </transition>
  <transition name="回退">
    <next name="申请" type="task" usertype="assignee" user="init_user" />
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
