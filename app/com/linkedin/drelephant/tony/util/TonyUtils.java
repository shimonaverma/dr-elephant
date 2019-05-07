package com.linkedin.drelephant.tony.util;

import com.linkedin.drelephant.tony.data.TonyTaskData;
import com.linkedin.tony.Constants;
import com.linkedin.tony.events.Metric;
import java.util.Map;


public class TonyUtils {
  public static double getMaxMemoryBytesUsedForTaskType(Map<String, Map<Integer, TonyTaskData>> taskMap, String taskType) {
    double maxMemoryBytesUsed = 0;
    for (TonyTaskData taskData : taskMap.get(taskType).values()) {
      for (Metric metric : taskData.getMetrics()) {
        if (metric.getName().equals(Constants.MAX_MEMORY_BYTES)) {
          if (metric.getValue() > maxMemoryBytesUsed) {
            maxMemoryBytesUsed = metric.getValue();
          }
        }
      }
    }
    return maxMemoryBytesUsed;
  }
}
