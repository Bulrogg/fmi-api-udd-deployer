FROM jenkins




USER root

RUN apt-get update -qq && apt-get install -qqy \
    maven \
    git




#USER jenkins

#Add plugins
COPY plugins.txt /var/jenkins_home/plugins.txt
RUN plugins.sh /var/jenkins_home/plugins.txt

#Add jobs
COPY jobs /var/jenkins_home/jobs/

RUN ssh-keygen -t rsa -N "" -f ~/.ssh/id_rsa



#USER root
#RUN chmod -R 777  /var/jenkins_home/jobs



#USER jenkins