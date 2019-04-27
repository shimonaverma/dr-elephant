package com.linkedin.drelephant.tony;

import com.linkedin.drelephant.analysis.HadoopAggregatedData;
import com.linkedin.drelephant.analysis.HadoopApplicationData;
import com.linkedin.drelephant.analysis.HadoopMetricsAggregator;
import com.linkedin.drelephant.configurations.aggregator.AggregatorConfigurationData;


public class TonyMetricsAggregator implements HadoopMetricsAggregator {
  public TonyMetricsAggregator(AggregatorConfigurationData _aggregatorConfigurationData) {
  }

  @Override
  public void aggregate(HadoopApplicationData data) {
    // TODO
  }

  @Override
  public HadoopAggregatedData getResult() {
    HadoopAggregatedData data = new HadoopAggregatedData();
    data.setResourceUsed(1);
    data.setResourceWasted(1);
    data.setTotalDelay(1);
    return data;
  }
}
