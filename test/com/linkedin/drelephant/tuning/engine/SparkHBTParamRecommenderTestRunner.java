package com.linkedin.drelephant.tuning.engine;

import static common.DBTestUtil.initDBUtil;
import static common.TestConstants.TEST_SPARK_HBT_PARAM_RECOMMENDER;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;

import java.util.HashMap;

import models.AppResult;


public class SparkHBTParamRecommenderTestRunner implements Runnable {

  public void populateTestData() {
    try {
      initDBUtil(TEST_SPARK_HBT_PARAM_RECOMMENDER);
    } catch (Exception e) {
      e.printStackTrace();
    }
  }

  @Override
  public void run() {
    populateTestData();
    testGetHBTSuggestion1();
    testGetHBTSuggestion2();
  }

  private void testGetHBTSuggestion1() {
    AppResult appResult = AppResult.find.where().idEq("application_1547833800460_664575").findUnique();
    SparkHBTParamRecommender sparkHBTParamRecommender = new SparkHBTParamRecommender(appResult);
    HashMap<String, Double> suggestedParameters = sparkHBTParamRecommender.getHBTSuggestion();
    assertEquals("Wrong value for " + SparkConfigurationConstants.SPARK_EXECUTOR_MEMORY_KEY, 929L, suggestedParameters
        .get(SparkConfigurationConstants.SPARK_EXECUTOR_MEMORY_KEY).longValue());
    assertEquals("Wrong value for " + SparkConfigurationConstants.SPARK_EXECUTOR_CORES_KEY, 3,
        suggestedParameters.get(SparkConfigurationConstants.SPARK_EXECUTOR_CORES_KEY).longValue());
    assertTrue(
        "Wrong value for " + SparkConfigurationConstants.SPARK_MEMORY_FRACTION_KEY,
        suggestedParameters.get(SparkConfigurationConstants.SPARK_MEMORY_FRACTION_KEY) > 0
            && suggestedParameters.get(SparkConfigurationConstants.SPARK_MEMORY_FRACTION_KEY) < 1);
    assertEquals("Wrong value for " + SparkConfigurationConstants.SPARK_DRIVER_MEMORY_KEY, 1857L, suggestedParameters
        .get(SparkConfigurationConstants.SPARK_DRIVER_MEMORY_KEY).longValue());
    assertEquals("Wrong value for " + SparkConfigurationConstants.SPARK_DYNAMIC_ALLOCATION_MIN_EXECUTORS, 1L,
        suggestedParameters.get(SparkConfigurationConstants.SPARK_DYNAMIC_ALLOCATION_MIN_EXECUTORS).longValue());
    assertEquals("Wrong value for " + SparkConfigurationConstants.SPARK_DYNAMIC_ALLOCATION_MAX_EXECUTORS, 600,
        suggestedParameters.get(SparkConfigurationConstants.SPARK_DYNAMIC_ALLOCATION_MAX_EXECUTORS).longValue());
    assertEquals("Wrong value for " + SparkConfigurationConstants.SPARK_EXECUTOR_INSTANCES_KEY, 33L,
        suggestedParameters.get(SparkConfigurationConstants.SPARK_EXECUTOR_INSTANCES_KEY).longValue());
  }

  private void testGetHBTSuggestion2() {
    AppResult appResult = AppResult.find.where().idEq("application_1547833800460_664576").findUnique();
    SparkHBTParamRecommender sparkHBTParamRecommender = new SparkHBTParamRecommender(appResult);
    HashMap<String, Double> suggestedParameters = sparkHBTParamRecommender.getHBTSuggestion();
    assertEquals("Wrong value for " + SparkConfigurationConstants.SPARK_EXECUTOR_MEMORY_KEY, 1857L, suggestedParameters
        .get(SparkConfigurationConstants.SPARK_EXECUTOR_MEMORY_KEY).longValue());
    assertEquals("Wrong value for " + SparkConfigurationConstants.SPARK_EXECUTOR_CORES_KEY, 3,
        suggestedParameters.get(SparkConfigurationConstants.SPARK_EXECUTOR_CORES_KEY).longValue());
    assertTrue(
        "Wrong value for " + SparkConfigurationConstants.SPARK_MEMORY_FRACTION_KEY,
        suggestedParameters.get(SparkConfigurationConstants.SPARK_MEMORY_FRACTION_KEY) > 0
            && suggestedParameters.get(SparkConfigurationConstants.SPARK_MEMORY_FRACTION_KEY) < 1);
    assertEquals("Wrong value for " + SparkConfigurationConstants.SPARK_DRIVER_MEMORY_KEY, 1857L, suggestedParameters
        .get(SparkConfigurationConstants.SPARK_DRIVER_MEMORY_KEY).longValue());
    assertEquals("Wrong value for " + SparkConfigurationConstants.SPARK_DYNAMIC_ALLOCATION_MIN_EXECUTORS, 3L,
        suggestedParameters.get(SparkConfigurationConstants.SPARK_DYNAMIC_ALLOCATION_MIN_EXECUTORS).longValue());
    assertEquals("Wrong value for " + SparkConfigurationConstants.SPARK_DYNAMIC_ALLOCATION_MAX_EXECUTORS, 300,
        suggestedParameters.get(SparkConfigurationConstants.SPARK_DYNAMIC_ALLOCATION_MAX_EXECUTORS).longValue());
    assertEquals("Wrong value for " + SparkConfigurationConstants.SPARK_EXECUTOR_INSTANCES_KEY, 16L,
        suggestedParameters.get(SparkConfigurationConstants.SPARK_EXECUTOR_INSTANCES_KEY).longValue());
  }

}
