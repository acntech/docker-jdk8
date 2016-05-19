FROM ubuntu:16.04


RUN apt-get -y update && apt-get -y install wget
RUN wget --no-cookies --no-check-certificate --header "Cookie: oraclelicense=accept-securebackup-cookie" "http://download.oracle.com/otn-pub/java/jdk/8u92-b14/jdk-8u92-linux-x64.tar.gz" -O /tmp/jdk.tar.gz
RUN mkdir /opt/java && tar -xzvf /tmp/jdk.tar.gz -C /opt/java/ && ln -s /opt/java/jdk1.8.0_92/ /opt/java/default && rm -f /tmp/jdk.tar.gz
RUN update-alternatives --install "/usr/bin/java" "java" "/opt/java/default/bin/java" 1
RUN update-alternatives --install "/usr/bin/javac" "javac" "/opt/java/default/bin/javac" 1
RUN update-alternatives --install "/usr/bin/jar" "jar" "/opt/java/default/bin/jar" 1
RUN update-alternatives --set "java" "/opt/java/default/bin/java"
RUN update-alternatives --set "javac" "/opt/java/default/bin/javac"
RUN update-alternatives --set "jar" "/opt/java/default/bin/jar"


ENV JAVA_HOME /opt/java/default
ENV PATH $PATH:$JAVA_HOME/bin

#CMD ["java -version"]
CMD ["/bin/bash"]