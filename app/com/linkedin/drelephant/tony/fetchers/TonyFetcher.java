package com.linkedin.drelephant.tony.fetchers;

import com.linkedin.drelephant.analysis.AnalyticJob;
import com.linkedin.drelephant.analysis.ElephantFetcher;
import com.linkedin.drelephant.configurations.fetcher.FetcherConfigurationData;
import com.linkedin.drelephant.tony.data.TonyApplicationData;
import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.fs.Path;


public class TonyFetcher implements ElephantFetcher<TonyApplicationData> {
  public static final String TONY_CONF_LOCATION = "tony_conf_location";

//  private final Path finishedDir;


  public TonyFetcher(FetcherConfigurationData fetcherConfData) {
//    String tonyConfLoc = fetcherConfData.getParamMap().get(TONY_CONF_LOCATION);
//    Configuration conf = new Configuration();
//    conf.addResource(new Path(tonyConfLoc));
//    finishedDir = conf.get("tony.history")
  }

  @Override
  public TonyApplicationData fetchData(AnalyticJob job) throws Exception {
    TonyApplicationData jobData = new TonyApplicationData(job.getAppId(),
        job.getAppType());
    // get history files
    // create in-memory parsed representation of file
    // create TonyApplicationData object
    // set stuff in it
    // return it

    return jobData;
  }
}
