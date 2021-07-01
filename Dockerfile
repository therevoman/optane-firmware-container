#FROM registry.redhat.io/rhel8/buildah:latest
FROM registry.access.redhat.com/ubi8/ubi:8.3


USER root

COPY    dl/. /tmp

#RUN yum --disablerepo=* --enablerepo=rhel-8-for-x86_64-baseos-rpms --enablerepo=rhel-8-for-x86_64-appstream-rpms --disableplugin=subscription-manager -y install ndctl \
#  && yum --disablerepo=* --enablerepo=ubi-8-appstream --enablerepo=ubi-8-baseos --enablerepo=rhel-8-for-x86_64-baseos-beta-rpms --disableplugin=subscription-manager -y localinstall /tmp/firmware-dcpmm-1.2.0.5435-2.1.x86_64.rpm \
#  && yum --disableplugin=subscription-manager clean all
#RUN yum --disablerepo=* --enablerepo=ubi-8-appstream --enablerepo=ubi-8-baseos --enablerepo=rhel-8-for-x86_64-baseos-beta-rpms --disableplugin=subscription-manager -y install ndctl \

RUN dnf --enablerepo=ubi-8-appstream --enablerepo=ubi-8-baseos --disableplugin=subscription-manager -y localinstall /tmp/*.rpm \
  && yum --disableplugin=subscription-manager clean all


#COPY   dl/firmware-dcpmm-1.2.0.5435-2.1.x86_64.rpm /tmp
#COPY   dl/firmware-dcpmm-1.2.0.5435-2.1.x86_64.compsig /tmp

RUN echo "Running Container"

#https://github.com/intel/ipmctl/releases/download/v02.00.00.3871/ipmctl-02.00.00.3871-1.el8.x86_64.rpm
#https://github.com/intel/ipmctl/releases/download/v02.00.00.3871/libipmctl-02.00.00.3871-1.el8.x86_64.rpm
