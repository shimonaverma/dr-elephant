package com.linkedin.drelephant.tony.data;

import com.linkedin.tony.events.Metric;
import java.util.List;


public class TonyTaskData {
  private final String _taskType;
  private final int _taskIndex;

  private long _taskStartTime;
  private long _taskEndTime;
  private List<Metric> _metrics;

  public TonyTaskData(String taskType, int taskIndex) {
    _taskType = taskType;
    _taskIndex = taskIndex;
  }

  public long getTaskStartTime() {
    return _taskStartTime;
  }

  public void setTaskStartTime(long taskStartTime) {
    _taskStartTime = taskStartTime;
  }

  public long getTaskEndTime() {
    return _taskEndTime;
  }

  public void setTaskEndTime(long taskEndTime) {
    _taskEndTime = taskEndTime;
  }

  public List<Metric> getMetrics() {
    return _metrics;
  }

  public void setMetrics(List<Metric> metrics) {
    _metrics = metrics;
  }
}
