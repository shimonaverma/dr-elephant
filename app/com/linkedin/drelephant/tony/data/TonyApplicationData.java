package com.linkedin.drelephant.tony.data;

import com.linkedin.drelephant.analysis.ApplicationType;
import com.linkedin.drelephant.analysis.HadoopApplicationData;
import com.linkedin.tony.events.Metric;
import java.util.List;
import java.util.Map;
import java.util.Properties;
import org.apache.hadoop.conf.Configuration;


public class TonyApplicationData implements HadoopApplicationData {
  private String _appId;
  private ApplicationType _appType;
  private Properties _props;
  private Map<String, Map<Integer, List<Metric>>> _metricsMap;

  public TonyApplicationData(String appId, ApplicationType appType, Configuration conf,
      Map<String, Map<Integer, List<Metric>>> metricsMap) {
    _appId = appId;
    _appType = appType;

    _props = new Properties();
    for (Map.Entry<String, String> entry : conf) {
      _props.setProperty(entry.getKey(), entry.getValue());
    }

    _metricsMap = metricsMap;
  }

  @Override
  public String getAppId() {
    return _appId;
  }

  @Override
  public Properties getConf() {
    return _props;
  }

  @Override
  public ApplicationType getApplicationType() {
    return _appType;
  }

  public Map<String, Map<Integer, List<Metric>>> getMetricsMap() {
    return _metricsMap;
  }

  @Override
  public boolean isEmpty() {
    return false;
  }
}
