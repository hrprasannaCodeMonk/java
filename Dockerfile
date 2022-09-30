FROM ubuntu as builder
RUN apt update -y
RUN apt install git -y
RUN apt install maven -y
RUN apt install default-jre -y 
RUN git clone https://www.github.javarepo.git 
RUN cd javarepo/ -y 
RUN mvn clean install -y

FORM tomcat
COPY --from=builder javarepo/target/*.war /webapps
EXPOSE 8080 
ENTRYPOINT ./bin/startup.sh 
