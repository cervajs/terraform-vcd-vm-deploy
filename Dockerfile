FROM rockylinux/rockylinux:9.4

ENV container=docker
ENV TZ=Europe/Prague

# see https://hub.docker.com/_/rockylinux
# RockyLinux:9 missing /usr/sbin/init -> ../lib/systemd/systemd
#  see https://github.com/rocky-linux/sig-cloud-instance-images/issues/39
RUN [ ! -f /usr/sbin/init ] && dnf -y install systemd;
RUN ([ -d /lib/systemd/system/sysinit.target.wants ] && cd /lib/systemd/system/sysinit.target.wants/ && for i in *; do [ $i == \
systemd-tmpfiles-setup.service ] || rm -f $i; done); \
rm -f /lib/systemd/system/multi-user.target.wants/*;\
rm -f /etc/systemd/system/*.wants/*;\
rm -f /lib/systemd/system/local-fs.target.wants/*; \
rm -f /lib/systemd/system/sockets.target.wants/*udev*; \
rm -f /lib/systemd/system/sockets.target.wants/*initctl*; \
rm -f /lib/systemd/system/basic.target.wants/*;\
rm -f /lib/systemd/system/anaconda.target.wants/*;


RUN dnf install -y epel-release && dnf -y update && dnf install -y openssh-server sudo NetworkManager  && dnf clean all

RUN dnf config-manager --add-repo https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo && dnf -y install terraform

#Auto remove no-login file
RUN systemctl add-wants multi-user.target systemd-user-sessions.service

RUN ssh-keygen -A

# SSH runtime bug: https://access.redhat.com/solutions/6408321
RUN rm -rf /run/nologin

VOLUME [ "/sys/fs/cgroup" ]
CMD ["/usr/sbin/init"]
