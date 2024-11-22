# Dockerfile for Backend
FROM openjdk:17-jdk-slim

# Set working directory
WORKDIR /app

# Copy the backend source code
COPY target/Backend-0.0.1-SNAPSHOT.jar app.jar

COPY src/main/resources/application.properties /app/resources/
# Expose the backend port
EXPOSE 9090

# Set environment variables for runtime
ENV SPRING_PROFILES_ACTIVE=docker

# Run the application
CMD ["java", "-jar", "target/your-app.jar"]
