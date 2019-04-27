package com.linkedin.drelephant.tony.data;

import com.linkedin.drelephant.analysis.ApplicationType;
import com.linkedin.drelephant.analysis.HadoopApplicationData;
import java.util.Properties;


public class TonyApplicationData implements HadoopApplicationData {
  private String _appId;
  private ApplicationType _appType;

  public TonyApplicationData(String appId, ApplicationType appType) {
    _appId = appId;
    _appType = appType;
  }

  @Override
  public String getAppId() {
    return _appId;
  }

  @Override
  public Properties getConf() {
    return null;
  }

  @Override
  public ApplicationType getApplicationType() {
    return _appType;
  }

  @Override
  public boolean isEmpty() {
    return false;
  }
}
