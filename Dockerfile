<<<<<<< HEAD
FROM java:8  
COPY . /
WORKDIR /  
RUN javac DockerConnectMySQL.java
CMD ["java", "-classpath", "mysql-connector-java-5.1.6.jar:.","DockerConnectMySQL"]
=======
# install java8 image
FROM openjdk:11
# cd /var/www/java sur la machine docker
WORKDIR /var/www/java
# copy le fichier dans le repertoire courrant dnas /var/www/java
COPY ./java /var/www/java
# executer dans le terminal compilation
RUN ls
WORKDIR /var/www/java/dist/
RUN java -jar receipes.jar
>>>>>>> 209941ed38ec35f353da02121f7fc85cc57ad5ca
