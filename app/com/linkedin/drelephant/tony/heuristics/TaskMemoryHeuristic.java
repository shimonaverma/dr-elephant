/*
 * Copyright 2019 LinkedIn Corp.
 *
 * Licensed under the Apache License, Version 2.0 (the "License"); you may not
 * use this file except in compliance with the License. You may obtain a copy of
 * the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
 * WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the
 * License for the specific language governing permissions and limitations under
 * the License.
 */
package com.linkedin.drelephant.tony.heuristics;

import com.linkedin.drelephant.analysis.Heuristic;
import com.linkedin.drelephant.analysis.HeuristicResult;
import com.linkedin.drelephant.analysis.HeuristicResultDetails;
import com.linkedin.drelephant.analysis.Severity;
import com.linkedin.drelephant.configurations.heuristic.HeuristicConfigurationData;
import com.linkedin.drelephant.tony.data.TonyApplicationData;
import com.linkedin.drelephant.util.Utils;
import com.linkedin.tony.Constants;
import com.linkedin.tony.TonyConfigurationKeys;
import com.linkedin.tony.events.Metric;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Set;
import org.apache.commons.io.FileUtils;
import org.apache.hadoop.conf.Configuration;


/**
 * For each type of task (e.g.: worker, ps), this heuristic checks the max memory used across all tasks of that type
 * and compares against some thresholds. The final severity is the highest severity across all task types.
 */
public class TaskMemoryHeuristic implements Heuristic<TonyApplicationData> {
  private static final int DEFAULT_CONTAINER_MEMORY_MB = 2048;
  private static final String CONTAINER_MEMORY_DEFAULT_MB_CONF = "container_memory_default_mb";
  private static final String TASK_MEMORY_THRESHOLDS_CONF = "task_memory_thresholds";

  private HeuristicConfigurationData _heuristicConfData;
  private long defaultContainerMemoryBytes = DEFAULT_CONTAINER_MEMORY_MB * FileUtils.ONE_MB;

  // Initialized to default max memory thresholds
  private double[] maxMemoryLimits = {0.8, 0.7, 0.6, 0.5};

  public TaskMemoryHeuristic(HeuristicConfigurationData heuristicConfData) {
    this._heuristicConfData = heuristicConfData;

    Map<String, String> params = heuristicConfData.getParamMap();
    // read default container size
    if (params.containsKey(CONTAINER_MEMORY_DEFAULT_MB_CONF)) {
      defaultContainerMemoryBytes = Long.parseLong(params.get(CONTAINER_MEMORY_DEFAULT_MB_CONF)) * FileUtils.ONE_MB;
    }
    // read max memory thresholds
    if (params.containsKey(TASK_MEMORY_THRESHOLDS_CONF)) {
      maxMemoryLimits = Utils.getParam(params.get(TASK_MEMORY_THRESHOLDS_CONF), maxMemoryLimits.length);
    }
  }

  @Override
  public HeuristicResult apply(TonyApplicationData data) {
    Map<String, Map<Integer, List<Metric>>> metrics = data.getMetricsMap();
    Configuration conf = data.getConfiguration();

    Set<String> taskTypes = com.linkedin.tony.util.Utils.getAllJobTypes(conf);
    Severity finalSeverity = Severity.NONE;
    List<HeuristicResultDetails> details = new ArrayList<>();

    for (String taskType : taskTypes) {
      // get per task memory requested
      String memoryString = conf.get(TonyConfigurationKeys.getResourceKey(taskType, Constants.MEMORY));
      String memoryStringMB = com.linkedin.tony.util.Utils.parseMemoryString(memoryString);
      long taskBytesRequested = Long.parseLong(memoryStringMB) * FileUtils.ONE_MB;
      if (taskBytesRequested <= defaultContainerMemoryBytes) {
        // If using default container memory, automatic pass
        continue;
      }

      // get global max memory per task
      double maxMemoryBytesUsed = 0;
      for (List<Metric> taskMetrics : metrics.get(taskType).values()) {
        for (Metric metric : taskMetrics) {
          if (metric.getName().equals(Constants.MAX_MEMORY_BYTES)) {
            if (metric.getValue() > maxMemoryBytesUsed) {
              maxMemoryBytesUsed = metric.getValue();
            }
          }
        }
      }

      // compare to threshold and update severity
      double maxMemoryRatio = maxMemoryBytesUsed / taskBytesRequested;
      Severity taskMemorySeverity = Severity.getSeverityDescending(maxMemoryRatio, maxMemoryLimits[0],
          maxMemoryLimits[1], maxMemoryLimits[2], maxMemoryLimits[3]);
      finalSeverity = Severity.max(finalSeverity, taskMemorySeverity);

      // add heuristic details
      details.add(new HeuristicResultDetails("Number of " + taskType + " tasks",
          Integer.toString(metrics.get(taskType).size())));
      details.add(new HeuristicResultDetails("Requested memory (MB) per " + taskType + " task",
          Long.toString(taskBytesRequested / FileUtils.ONE_MB)));
      details.add(new HeuristicResultDetails("Max memory (MB) used in any " + taskType + " task",
          Long.toString((long) maxMemoryBytesUsed / FileUtils.ONE_MB)));
    }

    return new HeuristicResult(_heuristicConfData.getClassName(), _heuristicConfData.getHeuristicName(), finalSeverity,
        0, details);
  }

  @Override
  public HeuristicConfigurationData getHeuristicConfData() {
    return _heuristicConfData;
  }
}