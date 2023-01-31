FROM openjdk:8

# Set the working directory to /app
WORKDIR /app

# Copy the JAR file to the image
COPY . .

RUN apt update
RUN apt install maven -y
RUN mvn install -Dmaven.test.skip=true
RUN mv target/*.jar app.jar

# Copy the JAR file to the image
COPY target/app.jar /

# Run the command to start the Spring Boot application
CMD ["java", "-jar", "/app.jar"]
