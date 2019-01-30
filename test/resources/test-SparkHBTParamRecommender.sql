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

INSERT INTO yarn_app_result(id, name, username, queue_name, start_time, finish_time, tracking_url, job_type, severity, score, workflow_depth, scheduler, job_name, job_exec_id, flow_exec_id, job_def_id, flow_def_id, job_exec_url, flow_exec_url, job_def_url, flow_def_url, resource_used, resource_wasted, total_delay)
  VALUES('application_1547833800460_664575', 'com.linkedin.hello.spark.CountPageView', 'mkumar1', 'sna_default', '1548423066104', '1548423131477', 'http://ltx1-farowp01.grid.linkedin.com:8080/proxy/application_1547833800460_664575/', 'Spark', 4, '553', 0, 'azkaban', 'countPageViewFlow_countPageView', 'https://hostname.com:8443/executor?execid=2136899&job=countPageViewFlow_countPageView&attempt=0', 'https://hostname.com:8443/executor?execid=2136899', 'https://hostname.com:8443/manager?project=spark_starter_kit&flow=countPageViewFlow&job=countPageViewFlow_countPageView', 'https://hostname.com:8443/manager?project=spark_starter_kit&flow=countPageViewFlow', 'https://hostname.com:8443/executor?execid=2136899&job=countPageViewFlow_countPageView&attempt=0', 'https://hostname.com:8443/executor?execid=2136899', 'https://hostname.com:8443/manager?project=spark_starter_kit&flow=countPageViewFlow&job=countPageViewFlow_countPageView', 'https://hostname.com:8443/manager?project=spark_starter_kit&flow=countPageViewFlow', '3095406', '2773917', '0');

INSERT INTO yarn_app_heuristic_result(id, yarn_app_result_id, heuristic_class, heuristic_name, severity, score)
  VALUES(26119, 'application_1547833800460_664575', 'com.linkedin.drelephant.spark.heuristics.ConfigurationHeuristic', 'Spark Configuration', 0, '0');

INSERT INTO yarn_app_heuristic_result(id, yarn_app_result_id, heuristic_class, heuristic_name, severity, score)
  VALUES(26120, 'application_1547833800460_664575', 'com.linkedin.drelephant.spark.heuristics.JobsHeuristic', 'Spark Job Metrics', 0, '0');

INSERT INTO yarn_app_heuristic_result(id, yarn_app_result_id, heuristic_class, heuristic_name, severity, score)
  VALUES(26121, 'application_1547833800460_664575', 'com.linkedin.drelephant.spark.heuristics.StagesHeuristic', 'Spark Stage Metrics', 0, '0');

INSERT INTO yarn_app_heuristic_result(id, yarn_app_result_id, heuristic_class, heuristic_name, severity, score)
  VALUES(26122, 'application_1547833800460_664575', 'com.linkedin.drelephant.spark.heuristics.UnifiedMemoryHeuristic', 'Executor Peak Unified Memory', 4, '200');

INSERT INTO yarn_app_heuristic_result(id, yarn_app_result_id, heuristic_class, heuristic_name, severity, score)
  VALUES(26123, 'application_1547833800460_664575', 'com.linkedin.drelephant.spark.heuristics.JvmUsedMemoryHeuristic', 'Executor JVM Used Memory', 4, '200');

INSERT INTO yarn_app_heuristic_result(id, yarn_app_result_id, heuristic_class, heuristic_name, severity, score)
  VALUES(26124, 'application_1547833800460_664575', 'com.linkedin.drelephant.spark.heuristics.ExecutorGcHeuristic', 'Executor GC', 3, '150');

INSERT INTO yarn_app_heuristic_result(id, yarn_app_result_id, heuristic_class, heuristic_name, severity, score)
  VALUES(26125, 'application_1547833800460_664575', 'com.linkedin.drelephant.spark.heuristics.ExecutorStorageSpillHeuristic', 'Executor spill', 0, '0');

INSERT INTO yarn_app_heuristic_result(id, yarn_app_result_id, heuristic_class, heuristic_name, severity, score)
  VALUES(26126, 'application_1547833800460_664575', 'com.linkedin.drelephant.spark.heuristics.DriverHeuristic', 'Driver Metrics', 3, '3');

INSERT INTO yarn_app_heuristic_result_details(yarn_app_heuristic_result_id, name, value, details)
  VALUES(26119, 'spark.application.duration', '53 Seconds', NULL);

INSERT INTO yarn_app_heuristic_result_details(yarn_app_heuristic_result_id, name, value, details)
  VALUES(26119, 'spark.dynamicAllocation.enabled', 'true', NULL);

INSERT INTO yarn_app_heuristic_result_details(yarn_app_heuristic_result_id, name, value, details)
  VALUES(26119, 'spark.dynamicAllocation.maxExecutors', '900', NULL);

INSERT INTO yarn_app_heuristic_result_details(yarn_app_heuristic_result_id, name, value, details)
  VALUES(26119, 'spark.dynamicAllocation.minExecutors', '1', NULL);

INSERT INTO yarn_app_heuristic_result_details(yarn_app_heuristic_result_id, name, value, details)
  VALUES(26119, 'spark.executor.cores', '2', NULL);

INSERT INTO yarn_app_heuristic_result_details(yarn_app_heuristic_result_id, name, value, details)
  VALUES(26119, 'spark.executor.instances', '50', NULL);

INSERT INTO yarn_app_heuristic_result_details(yarn_app_heuristic_result_id, name, value, details)
  VALUES(26119, 'spark.executor.memory', '8 GB', NULL);

INSERT INTO yarn_app_heuristic_result_details(yarn_app_heuristic_result_id, name, value, details)
  VALUES(26119, 'spark.yarn.executor.memoryOverhead', '0 B', NULL);

INSERT INTO yarn_app_heuristic_result_details(yarn_app_heuristic_result_id, name, value, details)
  VALUES(26120, 'Spark completed jobs count', '2', NULL);

INSERT INTO yarn_app_heuristic_result_details(yarn_app_heuristic_result_id, name, value, details)
  VALUES(26120, 'Spark failed jobs count', '0', NULL);

INSERT INTO yarn_app_heuristic_result_details(yarn_app_heuristic_result_id, name, value, details)
  VALUES(26120, 'Spark failed jobs list', '', NULL);

INSERT INTO yarn_app_heuristic_result_details(yarn_app_heuristic_result_id, name, value, details)
  VALUES(26120, 'Spark job failure rate', '0.000', NULL);

INSERT INTO yarn_app_heuristic_result_details(yarn_app_heuristic_result_id, name, value, details)
  VALUES(26120, 'Spark jobs with high task failure rates', '', NULL);

INSERT INTO yarn_app_heuristic_result_details(yarn_app_heuristic_result_id, name, value, details)
  VALUES(26121, 'Spark completed stages count', '4', NULL);

INSERT INTO yarn_app_heuristic_result_details(yarn_app_heuristic_result_id, name, value, details)
  VALUES(26121, 'Spark failed stages count', '0', NULL);

INSERT INTO yarn_app_heuristic_result_details(yarn_app_heuristic_result_id, name, value, details)
  VALUES(26121, 'Spark stage failure rate', '0.000', NULL);

INSERT INTO yarn_app_heuristic_result_details(yarn_app_heuristic_result_id, name, value, details)
  VALUES(26121, 'Spark stages with high task failure rates', '', NULL);

INSERT INTO yarn_app_heuristic_result_details(yarn_app_heuristic_result_id, name, value, details)
  VALUES(26121, 'Spark stages with long average executor runtimes', '', NULL);

INSERT INTO yarn_app_heuristic_result_details(yarn_app_heuristic_result_id, name, value, details)
  VALUES(26122, 'Max peak unified memory', '540.39 KB', NULL);

INSERT INTO yarn_app_heuristic_result_details(yarn_app_heuristic_result_id, name, value, details)
  VALUES(26122, 'Mean peak unified memory', '48.03 KB', NULL);

INSERT INTO yarn_app_heuristic_result_details(yarn_app_heuristic_result_id, name, value, details)
  VALUES(26122, 'spark.executor.memory', '8 GB', NULL);

INSERT INTO yarn_app_heuristic_result_details(yarn_app_heuristic_result_id, name, value, details)
  VALUES(26122, 'spark.memory.fraction', '0.6', NULL);

INSERT INTO yarn_app_heuristic_result_details(yarn_app_heuristic_result_id, name, value, details)
  VALUES(26122, 'Unified Memory Space Allocated', '4.09 GB', NULL);

INSERT INTO yarn_app_heuristic_result_details(yarn_app_heuristic_result_id, name, value, details)
  VALUES(26123, 'Executor Memory', 'The allocated memory for the executor (in spark.executor.memory) is much more than the peak JVM used memory by executors.', NULL);

INSERT INTO yarn_app_heuristic_result_details(yarn_app_heuristic_result_id, name, value, details)
  VALUES(26123, 'Max executor peak JVM used memory', '342.68 MB', NULL);

INSERT INTO yarn_app_heuristic_result_details(yarn_app_heuristic_result_id, name, value, details)
  VALUES(26123, 'spark.executor.memory', '8 GB', NULL);

INSERT INTO yarn_app_heuristic_result_details(yarn_app_heuristic_result_id, name, value, details)
  VALUES(26123, 'Suggested spark.executor.memory', '412 MB', NULL);

INSERT INTO yarn_app_heuristic_result_details(yarn_app_heuristic_result_id, name, value, details)
  VALUES(26124, 'Gc ratio high', 'The job is spending too much time on GC. We recommend increasing the executor memory.', NULL);

INSERT INTO yarn_app_heuristic_result_details(yarn_app_heuristic_result_id, name, value, details)
  VALUES(26124, 'GC time to Executor Run time ratio', '0.1098475625893188', NULL);

INSERT INTO yarn_app_heuristic_result_details(yarn_app_heuristic_result_id, name, value, details)
  VALUES(26124, 'Total Executor Runtime', '6 Minutes', NULL);

INSERT INTO yarn_app_heuristic_result_details(yarn_app_heuristic_result_id, name, value, details)
  VALUES(26124, 'Total GC time', '41 Seconds', NULL);

INSERT INTO yarn_app_heuristic_result_details(yarn_app_heuristic_result_id, name, value, details)
  VALUES(26125, 'Fraction of executors having non zero bytes spilled', '0.0', NULL);

INSERT INTO yarn_app_heuristic_result_details(yarn_app_heuristic_result_id, name, value, details)
  VALUES(26125, 'Max memory spilled', '0 B', NULL);

INSERT INTO yarn_app_heuristic_result_details(yarn_app_heuristic_result_id, name, value, details)
  VALUES(26125, 'Mean memory spilled', '0 B', NULL);

INSERT INTO yarn_app_heuristic_result_details(yarn_app_heuristic_result_id, name, value, details)
  VALUES(26125, 'Total memory spilled', '0 B', NULL);

INSERT INTO yarn_app_heuristic_result_details(yarn_app_heuristic_result_id, name, value, details)
  VALUES(26126, 'Driver Peak JVM used Memory', 'The allocated memory for the driver (in spark.driver.memory) is much more than the peak JVM used memory by the driver.', NULL);

INSERT INTO yarn_app_heuristic_result_details(yarn_app_heuristic_result_id, name, value, details)
  VALUES(26126, 'Max driver peak JVM used memory', '1,002.64 MB', NULL);

INSERT INTO yarn_app_heuristic_result_details(yarn_app_heuristic_result_id, name, value, details)
  VALUES(26126, 'spark.driver.cores', '1', NULL);

INSERT INTO yarn_app_heuristic_result_details(yarn_app_heuristic_result_id, name, value, details)
  VALUES(26126, 'spark.driver.memory', '3 GB', NULL);

INSERT INTO yarn_app_heuristic_result_details(yarn_app_heuristic_result_id, name, value, details)
  VALUES(26126, 'spark.yarn.driver.memoryOverhead', '0 B', NULL);

INSERT INTO yarn_app_heuristic_result_details(yarn_app_heuristic_result_id, name, value, details)
  VALUES(26126, 'Suggested spark.driver.memory', '2 GB', NULL);

INSERT INTO yarn_app_result(id, name, username, queue_name, start_time, finish_time, tracking_url, job_type, severity, score, workflow_depth, scheduler, job_name, job_exec_id, flow_exec_id, job_def_id, flow_def_id, job_exec_url, flow_exec_url, job_def_url, flow_def_url, resource_used, resource_wasted, total_delay)
  VALUES('application_1547833800460_664576', 'com.linkedin.hello.spark.CountPageView', 'mkumar1', 'sna_default', '1548423066104', '1548423131477', 'http://ltx1-farowp01.grid.linkedin.com:8080/proxy/application_1547833800460_664576/', 'Spark', 4, '553', 0, 'azkaban', 'countPageViewFlow_countPageView', 'https://hostname.com:8443/executor?execid=2136899&job=countPageViewFlow_countPageView&attempt=0', 'https://hostname.com:8443/executor?execid=2136899', 'https://hostname.com:8443/manager?project=spark_starter_kit&flow=countPageViewFlow&job=countPageViewFlow_countPageView', 'https://hostname.com:8443/manager?project=spark_starter_kit&flow=countPageViewFlow', 'https://hostname.com:8443/executor?execid=2136899&job=countPageViewFlow_countPageView&attempt=0', 'https://hostname.com:8443/executor?execid=2136899', 'https://hostname.com:8443/manager?project=spark_starter_kit&flow=countPageViewFlow&job=countPageViewFlow_countPageView', 'https://hostname.com:8443/manager?project=spark_starter_kit&flow=countPageViewFlow', '3095406', '2773917', '0');

INSERT INTO yarn_app_heuristic_result(id, yarn_app_result_id, heuristic_class, heuristic_name, severity, score)
  VALUES(36119, 'application_1547833800460_664576', 'com.linkedin.drelephant.spark.heuristics.ConfigurationHeuristic', 'Spark Configuration', 0, '0');

INSERT INTO yarn_app_heuristic_result(id, yarn_app_result_id, heuristic_class, heuristic_name, severity, score)
  VALUES(36120, 'application_1547833800460_664576', 'com.linkedin.drelephant.spark.heuristics.JobsHeuristic', 'Spark Job Metrics', 0, '0');

INSERT INTO yarn_app_heuristic_result(id, yarn_app_result_id, heuristic_class, heuristic_name, severity, score)
  VALUES(36121, 'application_1547833800460_664576', 'com.linkedin.drelephant.spark.heuristics.StagesHeuristic', 'Spark Stage Metrics', 0, '0');

INSERT INTO yarn_app_heuristic_result(id, yarn_app_result_id, heuristic_class, heuristic_name, severity, score)
  VALUES(36122, 'application_1547833800460_664576', 'com.linkedin.drelephant.spark.heuristics.UnifiedMemoryHeuristic', 'Executor Peak Unified Memory', 4, '200');

INSERT INTO yarn_app_heuristic_result(id, yarn_app_result_id, heuristic_class, heuristic_name, severity, score)
  VALUES(36123, 'application_1547833800460_664576', 'com.linkedin.drelephant.spark.heuristics.JvmUsedMemoryHeuristic', 'Executor JVM Used Memory', 4, '200');

INSERT INTO yarn_app_heuristic_result(id, yarn_app_result_id, heuristic_class, heuristic_name, severity, score)
  VALUES(36124, 'application_1547833800460_664576', 'com.linkedin.drelephant.spark.heuristics.ExecutorGcHeuristic', 'Executor GC', 3, '150');

INSERT INTO yarn_app_heuristic_result(id, yarn_app_result_id, heuristic_class, heuristic_name, severity, score)
  VALUES(36125, 'application_1547833800460_664576', 'com.linkedin.drelephant.spark.heuristics.ExecutorStorageSpillHeuristic', 'Executor spill', 0, '0');

INSERT INTO yarn_app_heuristic_result(id, yarn_app_result_id, heuristic_class, heuristic_name, severity, score)
  VALUES(36126, 'application_1547833800460_664576', 'com.linkedin.drelephant.spark.heuristics.DriverHeuristic', 'Driver Metrics', 3, '3');

INSERT INTO yarn_app_heuristic_result_details(yarn_app_heuristic_result_id, name, value, details)
  VALUES(36119, 'spark.application.duration', '53 Seconds', NULL);

INSERT INTO yarn_app_heuristic_result_details(yarn_app_heuristic_result_id, name, value, details)
  VALUES(36119, 'spark.dynamicAllocation.enabled', 'true', NULL);

INSERT INTO yarn_app_heuristic_result_details(yarn_app_heuristic_result_id, name, value, details)
  VALUES(36119, 'spark.dynamicAllocation.maxExecutors', '30', NULL);

INSERT INTO yarn_app_heuristic_result_details(yarn_app_heuristic_result_id, name, value, details)
  VALUES(36119, 'spark.dynamicAllocation.minExecutors', '9', NULL);

INSERT INTO yarn_app_heuristic_result_details(yarn_app_heuristic_result_id, name, value, details)
  VALUES(36119, 'spark.executor.cores', '1', NULL);

INSERT INTO yarn_app_heuristic_result_details(yarn_app_heuristic_result_id, name, value, details)
  VALUES(36119, 'spark.executor.memory', '8 GB', NULL);

INSERT INTO yarn_app_heuristic_result_details(yarn_app_heuristic_result_id, name, value, details)
  VALUES(36119, 'spark.yarn.executor.memoryOverhead', '0 B', NULL);

INSERT INTO yarn_app_heuristic_result_details(yarn_app_heuristic_result_id, name, value, details)
  VALUES(36120, 'Spark completed jobs count', '2', NULL);

INSERT INTO yarn_app_heuristic_result_details(yarn_app_heuristic_result_id, name, value, details)
  VALUES(36120, 'Spark failed jobs count', '0', NULL);

INSERT INTO yarn_app_heuristic_result_details(yarn_app_heuristic_result_id, name, value, details)
  VALUES(36120, 'Spark failed jobs list', '', NULL);

INSERT INTO yarn_app_heuristic_result_details(yarn_app_heuristic_result_id, name, value, details)
  VALUES(36120, 'Spark job failure rate', '0.000', NULL);

INSERT INTO yarn_app_heuristic_result_details(yarn_app_heuristic_result_id, name, value, details)
  VALUES(36120, 'Spark jobs with high task failure rates', '', NULL);

INSERT INTO yarn_app_heuristic_result_details(yarn_app_heuristic_result_id, name, value, details)
  VALUES(36121, 'Spark completed stages count', '4', NULL);

INSERT INTO yarn_app_heuristic_result_details(yarn_app_heuristic_result_id, name, value, details)
  VALUES(36121, 'Spark failed stages count', '0', NULL);

INSERT INTO yarn_app_heuristic_result_details(yarn_app_heuristic_result_id, name, value, details)
  VALUES(36121, 'Spark stage failure rate', '0.000', NULL);

INSERT INTO yarn_app_heuristic_result_details(yarn_app_heuristic_result_id, name, value, details)
  VALUES(36121, 'Spark stages with high task failure rates', '', NULL);

INSERT INTO yarn_app_heuristic_result_details(yarn_app_heuristic_result_id, name, value, details)
  VALUES(36121, 'Spark stages with long average executor runtimes', '', NULL);

INSERT INTO yarn_app_heuristic_result_details(yarn_app_heuristic_result_id, name, value, details)
  VALUES(36122, 'Max peak unified memory', '540.39 KB', NULL);

INSERT INTO yarn_app_heuristic_result_details(yarn_app_heuristic_result_id, name, value, details)
  VALUES(36122, 'Mean peak unified memory', '48.03 KB', NULL);

INSERT INTO yarn_app_heuristic_result_details(yarn_app_heuristic_result_id, name, value, details)
  VALUES(36122, 'spark.executor.memory', '8 GB', NULL);

INSERT INTO yarn_app_heuristic_result_details(yarn_app_heuristic_result_id, name, value, details)
  VALUES(36122, 'spark.memory.fraction', '0.6', NULL);

INSERT INTO yarn_app_heuristic_result_details(yarn_app_heuristic_result_id, name, value, details)
  VALUES(36122, 'Unified Memory Space Allocated', '4.09 GB', NULL);

INSERT INTO yarn_app_heuristic_result_details(yarn_app_heuristic_result_id, name, value, details)
  VALUES(36123, 'Executor Memory', 'The allocated memory for the executor (in spark.executor.memory) is much more than the peak JVM used memory by executors.', NULL);

INSERT INTO yarn_app_heuristic_result_details(yarn_app_heuristic_result_id, name, value, details)
  VALUES(36123, 'Max executor peak JVM used memory', '342.68 MB', NULL);

INSERT INTO yarn_app_heuristic_result_details(yarn_app_heuristic_result_id, name, value, details)
  VALUES(36123, 'spark.executor.memory', '8 GB', NULL);

INSERT INTO yarn_app_heuristic_result_details(yarn_app_heuristic_result_id, name, value, details)
  VALUES(36123, 'Suggested spark.executor.memory', '412 MB', NULL);

INSERT INTO yarn_app_heuristic_result_details(yarn_app_heuristic_result_id, name, value, details)
  VALUES(36124, 'Gc ratio high', 'The job is spending too much time on GC. We recommend increasing the executor memory.', NULL);

INSERT INTO yarn_app_heuristic_result_details(yarn_app_heuristic_result_id, name, value, details)
  VALUES(36124, 'GC time to Executor Run time ratio', '0.1098475625893188', NULL);

INSERT INTO yarn_app_heuristic_result_details(yarn_app_heuristic_result_id, name, value, details)
  VALUES(36124, 'Total Executor Runtime', '6 Minutes', NULL);

INSERT INTO yarn_app_heuristic_result_details(yarn_app_heuristic_result_id, name, value, details)
  VALUES(36124, 'Total GC time', '41 Seconds', NULL);

INSERT INTO yarn_app_heuristic_result_details(yarn_app_heuristic_result_id, name, value, details)
  VALUES(36125, 'Fraction of executors having non zero bytes spilled', '0.0', NULL);

INSERT INTO yarn_app_heuristic_result_details(yarn_app_heuristic_result_id, name, value, details)
  VALUES(36125, 'Max memory spilled', '0 B', NULL);

INSERT INTO yarn_app_heuristic_result_details(yarn_app_heuristic_result_id, name, value, details)
  VALUES(36125, 'Mean memory spilled', '0 B', NULL);

INSERT INTO yarn_app_heuristic_result_details(yarn_app_heuristic_result_id, name, value, details)
  VALUES(36125, 'Total memory spilled', '0 B', NULL);

INSERT INTO yarn_app_heuristic_result_details(yarn_app_heuristic_result_id, name, value, details)
  VALUES(36126, 'Driver Peak JVM used Memory', 'The allocated memory for the driver (in spark.driver.memory) is much more than the peak JVM used memory by the driver.', NULL);

INSERT INTO yarn_app_heuristic_result_details(yarn_app_heuristic_result_id, name, value, details)
  VALUES(36126, 'Max driver peak JVM used memory', '1,002.64 MB', NULL);

INSERT INTO yarn_app_heuristic_result_details(yarn_app_heuristic_result_id, name, value, details)
  VALUES(36126, 'spark.driver.cores', '1', NULL);

INSERT INTO yarn_app_heuristic_result_details(yarn_app_heuristic_result_id, name, value, details)
  VALUES(36126, 'spark.driver.memory', '3 GB', NULL);

INSERT INTO yarn_app_heuristic_result_details(yarn_app_heuristic_result_id, name, value, details)
  VALUES(36126, 'spark.yarn.driver.memoryOverhead', '0 B', NULL);

INSERT INTO yarn_app_heuristic_result_details(yarn_app_heuristic_result_id, name, value, details)
  VALUES(36126, 'Suggested spark.driver.memory', '2 GB', NULL);

