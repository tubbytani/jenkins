FROM centos

RUN yum -y install openssh-server

RUN useradd remote_user && \
    echo "remote_user:1234" | chpasswd && \
    mkdir /home/remote_user/.ssh && \
    chmod 700 /home/remote_user/.ssh

COPY remote-key.pub /home/remote_user/.ssh/authorized_keys

RUN chown remote_user:remote_user -R  /home/remote_user/.ssh &&\
    chmod 600 /home/remote_user/.ssh/authorized_keys

RUN ssh-keygen -A

RUN rm -rf /run/nologin

RUN yum -y install mysql

RUN yum install -y \
    python3 \
    python3-pip && \
    pip3 install --upgrade awscli

EXPOSE 22

CMD /usr/sbin/sshd -D

 
