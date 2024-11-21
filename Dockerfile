# Dockerfile for Backend
FROM openjdk:17-jdk-slim

# Set working directory
WORKDIR /app

# Copy the backend source code
COPY . .

# Install dependencies and build the application
RUN ./mvnw clean package -DskipTests

# Expose the backend port
EXPOSE 9090

# Set environment variables for runtime
ENV SPRING_PROFILES_ACTIVE=docker

# Run the application
CMD ["java", "-jar", "target/your-app.jar"]
