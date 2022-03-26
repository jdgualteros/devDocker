#!/bin/bash

sudo service ssh start

# useradd -m -p 'admin' -s /bin/bash hadoop
# useradd -m -p 'admin' -s /bin/bash spark
# # echo 'hadoop:admin' | chpasswd
# # echo 'spark:admin' | chpasswd
# echo 'root:admin' | chpasswd
# chown -R hadoop /opt
# $HADOOP_HOME/bin/hdfs namenode -format
$HADOOP_HOME/sbin/start-dfs.sh
$HADOOP_HOME/sbin/start-yarn.sh

# hdfs dfs -mkdir /spark-logs
# hdfs dfs -mkdir /master
# hdfs dfs -mkdir /raw
bash