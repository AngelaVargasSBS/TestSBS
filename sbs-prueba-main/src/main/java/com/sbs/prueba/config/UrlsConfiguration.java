package com.sbs.prueba.config;

import lombok.Setter;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.stereotype.Component;

import java.util.List;

@Setter
@Component
@EnableConfigurationProperties
@ConfigurationProperties(prefix = "security")
public class UrlsConfiguration {
    private List<Url> tokenUrls;

    public List<Url> getTokenUrls() { return tokenUrls; }

    public void setTokenUrls(List<Url> tokenUrls) { this.tokenUrls = tokenUrls; }


    public static class Url
    {
        private String url;
        private String methods;

        public String getUrl() {
            return url;
        }

        public void setUrl(String url) {
            this.url = url;
        }

        public String getMethods() {
            return methods;
        }

        public void setMethods(String methods) {
            this.methods = methods;
        }
    }
}
