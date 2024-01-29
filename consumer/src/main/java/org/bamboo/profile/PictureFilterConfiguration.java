package org.bamboo.profile;

import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.context.annotation.Configuration;

import java.util.List;

@Configuration
@EnableConfigurationProperties(PictureFilterConfiguration.Security.class)
public class PictureFilterConfiguration {

    @ConfigurationProperties(prefix = "picture-filter.security")
    public static class Security {
        private List<String> permitAllPath;

        public List<String> getPermitAllPath() {
            return permitAllPath;
        }

        public void setPermitAllPath(List<String> permitAllPath) {
            this.permitAllPath = permitAllPath;
        }
    }
}
