# Oracle Linux..... because https://www.mysql.com/support/supportedplatforms/database.html.....
FROM oraclelinux:9-slim

RUN sudo yum install mysql-community-server

# MySQL Configurations
RUN chown -R mysql:root /var/lib/mysql/

ENV MYSQL_DATABASE="collie"
ENV MYSQL_ROOT_PASSWORD="Root123!"

# Install Corretto JDK 17
RUN wget -O- https://apt.corretto.aws/corretto.key | sudo apt-key add - && \
  sudo add-apt-repository 'deb https://apt.corretto.aws stable main' && \
  sudo apt-get update && \
  sudo apt-get install -y java-17-amazon-corretto-jdk

# Fix certificate issues
RUN apt-get update && \
  apt-get install ca-certificates-java && \
  apt-get clean && \
  update-ca-certificates -f;

CMD ["/bin/sh"]
