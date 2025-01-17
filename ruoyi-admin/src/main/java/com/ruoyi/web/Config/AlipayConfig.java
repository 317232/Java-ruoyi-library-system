package com.ruoyi.web.Config;

import lombok.Data;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

@Component
@ConfigurationProperties(prefix = "alipay")
@Data
public class AlipayConfig {
    private String appId;
    private String rsaPrivateKey;
    private String alipayPublicKey;
    private String gateway;
    private String charset;
    private String format;
    private String logPath;
    private String signtype;
}