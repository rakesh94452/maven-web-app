FROM tomcat:9.0-jdk17-temurin

LABEL maintainer="rakesh"

# Clean default Tomcat applications
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy Maven generated WAR file into Tomcat ROOT
COPY target/*.war /usr/local/tomcat/webapps/ROOT.war

# Expose Tomcat port
EXPOSE 8080

# Start Tomcat
CMD ["catalina.sh", "run"]
