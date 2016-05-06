/**
 * 
 */
package com.workflow.test;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.jbpm.api.ExecutionService;
import org.jbpm.api.activity.ActivityExecution;
import org.jbpm.api.activity.ExternalActivityBehaviour;
import org.jbpm.api.model.Transition;
import org.jbpm.pvm.internal.env.EnvironmentImpl;
import org.jbpm.pvm.internal.history.HistoryEvent;
import org.jbpm.pvm.internal.history.events.TaskActivityStart;
import org.jbpm.pvm.internal.model.ActivityImpl;
import org.jbpm.pvm.internal.model.ExecutionImpl;
import org.jbpm.pvm.internal.session.DbSession;
import org.jbpm.pvm.internal.task.TaskImpl;

import com.workflow.util.XmlInfo;

/**
 * @author Administrator
 * 
 */
@Deprecated
public class InFork implements ExternalActivityBehaviour {
	String a;
	private static final long serialVersionUID = -7018328565196107333L;
	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * org.jbpm.api.activity.ActivityBehaviour#execute(org.jbpm.api.activity
	 * .ActivityExecution)
	 */
	public void execute(ActivityExecution arg0) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("InFork!=execute---start\n");
		{
			ExecutionImpl executionImpl = (ExecutionImpl)arg0;
			DbSession dbsession = EnvironmentImpl.getFromCurrent(DbSession.class);
			TaskImpl taskImpl = dbsession.createTask();
			
		}
		
		
		
		
		System.out.println("ActivityExecution ID= " + arg0.getId());
		System.out.println(arg0.getVariables());//流程变量
		
		ExecutionImpl execution = (ExecutionImpl) arg0;
		List<?> list = execution.getActivity().getOutgoingTransitions();
		DbSession dbsession = EnvironmentImpl.getFromCurrent(DbSession.class);
		for (Object obj : list) {
			Transition transition = (Transition)obj;
			ActivityImpl activity = (ActivityImpl)transition.getDestination();
			String targetName = activity.getName();
			TaskImpl task = dbsession.createTask();
			task.setName(targetName+"_test");
//			// 设置了type, 便于以后做流程展示时区别
////			execution.getActivity().setType(COUNTER_SIGN_TASK_TYPE);
			task.setExecution(execution);
			task.setProcessInstance(execution.getProcessInstance());
			task.setSignalling(false); // false, 自己手工处理execution的跳转
			task.setDescription("描述");
			
			XmlInfo xmlInfo = new XmlInfo(arg0.getId().split("\\.")[0]);
			String u = xmlInfo.subUserString(xmlInfo.getElementByName(targetName).getAttributeValue("assignee"));
			task.setAssignee(arg0.getVariable(u)+"");
			dbsession.save(task);
			HistoryEvent.fire(new TaskActivityStart(task), execution);
//			return task;
			System.out.println(activity+" - "+transition.getSource());
			System.out.println(activity.getProperty("assignee"));
			System.out.println(activity.getName());
			System.out.println(activity.getType());
			System.out.println(activity.getType());
			
		}
		
		System.out.println("\nInFork!=execute---end");
		ExecutionService executionService = EnvironmentImpl.getFromCurrent(ExecutionService.class);

		Map<String, Object> countersignUsers = new HashMap<String, Object>();

//		for (String user : countersignUserList) {// 创建子任务
//			countersignUsers.put(user, null);
//			newCounterSignSubTask(dbsession, execution, taskImpl, user, ht);
//		}
//		countersignInfo.setCounterUsers(countersignUsers);
//		countersignInfo.setStrategy(strategy);

//		setCountersingInfo(execution, executionService, countersignInfo);

		a.split("1");
		// 流程等待
//		execution.waitForSignal();
//		
//		
//		return;
	}
	
	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * org.jbpm.api.activity.ExternalActivityBehaviour#signal(org.jbpm.api.activity
	 * .ActivityExecution, java.lang.String, java.util.Map)
	 */
	public void signal(ActivityExecution arg0, String arg1, Map<String, ?> arg2)
			throws Exception {
		// TODO Auto-generated method stub
		System.out.println("InFork!=signal");
		a.split("2");
	}
}
