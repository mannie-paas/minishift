# Sample Spring Boot 

mvn clean package && java -jar target/sample-springboot.jar

docker build . -t springboot:0.0.1-SNAPSHOT

docker run -d -p 8088:8080 springboot:0.0.1-SNAPSHOT