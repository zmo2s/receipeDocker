# install java8 image
FROM openjdk:11

EXPOSE 3307
# cd /var/www/java sur la machine docker
WORKDIR /var/www/java
# copy le fichier dans le repertoire courrant dnas /var/www/java
COPY . /var/www/java
# executer dans le terminal compilation
RUN ls
WORKDIR /var/www/java/dist/
RUN java -jar receipes.jar
