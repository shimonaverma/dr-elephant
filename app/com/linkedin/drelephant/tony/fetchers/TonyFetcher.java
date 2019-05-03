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
package com.linkedin.drelephant.tony.fetchers;

import com.linkedin.drelephant.analysis.AnalyticJob;
import com.linkedin.drelephant.analysis.ElephantFetcher;
import com.linkedin.drelephant.configurations.fetcher.FetcherConfigurationData;
import com.linkedin.drelephant.tony.data.TonyApplicationData;
import com.linkedin.tony.Constants;
import com.linkedin.tony.TonyConfigurationKeys;
import com.linkedin.tony.events.Event;
import com.linkedin.tony.events.EventType;
import com.linkedin.tony.events.Metric;
import com.linkedin.tony.events.TaskFinished;
import com.linkedin.tony.util.ParserUtils;
import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.fs.FileSystem;
import org.apache.hadoop.fs.Path;


public class TonyFetcher implements ElephantFetcher<TonyApplicationData> {
  private final Path _finishedDir;
  private final FileSystem _fs;

  public TonyFetcher(FetcherConfigurationData fetcherConfig) throws IOException {
    Configuration conf = new Configuration();

    String tonyConfDir = System.getenv(Constants.TONY_CONF_DIR);
    if (fetcherConfig.getParamMap().containsKey(Constants.TONY_CONF_DIR)) {
      tonyConfDir = fetcherConfig.getParamMap().get(Constants.TONY_CONF_DIR);
    }

    conf.addResource(new Path(tonyConfDir + Path.SEPARATOR + Constants.TONY_SITE_CONF));
    _finishedDir = new Path(conf.get(TonyConfigurationKeys.TONY_HISTORY_FINISHED));
    _fs = _finishedDir.getFileSystem(conf);
  }

  private static Map<String, Map<Integer, List<Metric>>> parseMetricsMap(List<Event> events) {
    Map<String, Map<Integer, List<Metric>>> metricsMap = new HashMap<>();
    for (Event e : events) {
      if (e.getType().equals(EventType.TASK_FINISHED)) {
        TaskFinished taskFinishedEvent = (TaskFinished) e.getEvent();
        if (!metricsMap.containsKey(taskFinishedEvent.getTaskType())) {
          metricsMap.put(taskFinishedEvent.getTaskType(), new HashMap<>());
        }
        metricsMap.get(taskFinishedEvent.getTaskType()).put(taskFinishedEvent.getTaskIndex(),
            taskFinishedEvent.getMetrics());
      }
    }
    return metricsMap;
  }

  @Override
  public TonyApplicationData fetchData(AnalyticJob job) throws Exception {
    long finishTime = job.getFinishTime();
    Date date = new Date(finishTime);
    String yearMonthDay = ParserUtils.getYearMonthDayDirectory(date);
    Path jobDir = new Path(_finishedDir, yearMonthDay + Path.SEPARATOR + job.getAppId());

    Map<String, Map<Integer, List<Metric>>> metricsMap = parseMetricsMap(ParserUtils.parseEvents(_fs, jobDir));

    Path confFile = new Path(jobDir, Constants.TONY_FINAL_XML);
    Configuration conf = new Configuration(false);
    conf.addResource(_fs.open(confFile));

    return new TonyApplicationData(job.getAppId(), job.getAppType(), conf, metricsMap);
  }
}
