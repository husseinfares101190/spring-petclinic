FROM anapsix/alpine-java  
COPY /target/spring-petclinic-2.4.2.jar /home/spring-petclinic-2.4.2.jar 
CMD ["java","-jar","/home/spring-petclinic-2.4.2.jar"]