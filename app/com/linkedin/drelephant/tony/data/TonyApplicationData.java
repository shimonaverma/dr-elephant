package com.linkedin.drelephant.tony.data;

import com.linkedin.drelephant.analysis.ApplicationType;
import com.linkedin.drelephant.analysis.HadoopApplicationData;
import com.linkedin.tony.events.Event;
import com.linkedin.tony.events.EventType;
import com.linkedin.tony.events.TaskFinished;
import com.linkedin.tony.events.TaskStarted;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;
import org.apache.hadoop.conf.Configuration;


public class TonyApplicationData implements HadoopApplicationData {
  private String _appId;
  private ApplicationType _appType;
  private Configuration _configuration;
  private Properties _props;
  private Map<String, Map<Integer, TonyTaskData>> _taskMap;

  public TonyApplicationData(String appId, ApplicationType appType, Configuration configuration, List<Event> events) {
    _appId = appId;
    _appType = appType;

    _configuration = configuration;
    _props = new Properties();
    for (Map.Entry<String, String> entry : configuration) {
      _props.setProperty(entry.getKey(), entry.getValue());
    }

    _taskMap = new HashMap<>();
    processEvents(events);
  }

  @Override
  public String getAppId() {
    return _appId;
  }

  public Configuration getConfiguration() {
    return _configuration;
  }

  @Override
  public Properties getConf() {
    return _props;
  }

  @Override
  public ApplicationType getApplicationType() {
    return _appType;
  }

  public Map<String, Map<Integer, TonyTaskData>> getTaskMap() {
    return _taskMap;
  }

  @Override
  public boolean isEmpty() {
    return false;
  }

  private void initTaskMap(String taskType, int taskIndex) {
    if (!_taskMap.containsKey(taskType)) {
      _taskMap.put(taskType, new HashMap<>());
    }

    if (!_taskMap.get(taskType).containsKey(taskIndex)) {
      _taskMap.get(taskType).put(taskIndex, new TonyTaskData(taskType, taskIndex));
    }
  }

  private void processEvents(List<Event> events) {
    for (Event event : events) {
      if (event.getType().equals(EventType.TASK_STARTED)) {
        TaskStarted taskStartedEvent = (TaskStarted) event.getEvent();
        String taskType = taskStartedEvent.getTaskType();
        int taskIndex = taskStartedEvent.getTaskIndex();
        initTaskMap(taskType, taskIndex);
        _taskMap.get(taskType).get(taskIndex).setTaskStartTime(event.getTimestamp());
      } else if (event.getType().equals(EventType.TASK_FINISHED)) {
        TaskFinished taskFinishedEvent = (TaskFinished) event.getEvent();
        String taskType = taskFinishedEvent.getTaskType();
        int taskIndex = taskFinishedEvent.getTaskIndex();
        initTaskMap(taskType, taskIndex);
        _taskMap.get(taskType).get(taskIndex).setTaskEndTime(event.getTimestamp());
        _taskMap.get(taskType).get(taskIndex).setMetrics(taskFinishedEvent.getMetrics());
      }
    }
  }
}
