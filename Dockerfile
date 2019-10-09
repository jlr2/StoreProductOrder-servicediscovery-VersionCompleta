FROM maven:3.6-jdk-8 as maven
COPY ./pom.xml ./pom.xml
RUN mvn dependency:go-offline -B
COPY ./src ./src
RUN mvn clean package -DskipTests
EXPOSE 8761
FROM openjdk:8u171-jre-alpine
WORKDIR /service-discovery
COPY --from=maven target/service-discovery-0.0.1-SNAPSHOT.jar ./service-discovery.jar
CMD ["java", "-jar", "./service-discovery.jar"]