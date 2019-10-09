# service-discovery

 This application implements a Service Discovery pattern using Netflix server implementation: [Eureka] (https://github.com/Netflix/eureka).
  
  Instead of using Eureka project on its own, this application uses Spring ecosystem to integrate it into the application.
  
  It uses Spring Boot to start Spring context and run the application and Spring Cloud Eureka to integrate Netflix implementation into Spring.
  
  In order to transform a common Spring Boot application into an Eureka Server, only three steps are needed:
  
  + Add Spring Cloud dependency:
  org.springframework.cloud spring-cloud-starter-eureka-server
  
  + Enable Eureka initialization during Spring Boot startup using the annotation @EnableEurekaServer on the main class:
  
    @SpringBootApplication @EnableEurekaServer public class SngDemoEurekaServerApplication { ... }
  
  + Add some configuration. Two configuration files are needed:
  
  application.yml
  
  ````
  server:
      port: 8088
    
    spring:
      application:
        name: config
      cloud:
        config:
          server:
            git:
              # Local files mode --> uri: file:///${user.home}/WS_mborreguero/profile/configuration-local
              uri: https://gitlab.com/profile-sevilla/mstore/configuration-local.git
              force-pull: true
              clone-on-start: true          
              default-label: develop
    
              repos:
    
                develop:
                  uri: https://gitlab.com/profile-sevilla/mstore/configuration-develop.git
                  force-pull: true
                  clone-on-start: true
                  default-label: develop
    
                local:
                  uri: https://gitlab.com/profile-sevilla/mstore/configuration-local.git
                  force-pull: true
                  clone-on-start: true
                  default-label: develop
````