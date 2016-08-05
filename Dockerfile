FROM jjeffcaii/mesos:0.28.1

MAINTAINER jjeffcaii@outlook.com

ENV \
SPARK_HOME="/opt/spark" \
SPARK_VERSION="1.6.2" \
HADOOP_VERSION="2.6"

RUN \
apt-get update -y && \
apt-get install curl -y && \
curl -o /tmp/spark.tar.gz http://www-us.apache.org/dist/spark/spark-${SPARK_VERSION}/spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION}.tgz && \
tar xvzf /tmp/spark.tar.gz -C /opt && \
mv /opt/spark* /opt/spark && \
rm -rf /tmp/spark.tar.gz \
$SPARK_HOME/lib/spark-examples-*.jar \
$SPARK_HOME/lib/*yarn*.jar \
$SPARK_HOME/bin/*.cmd \
$SPARK_HOME/data \
$SPARK_HOME/ec2 \
$SPARK_HOME/examples \
$SPARK_HOME/licenses \
$SPARK_HOME/CHANGES.txt \
$SPARK_HOME/README.md \
$SPARK_HOME/NOTICE \
$SPARK_HOME/LICENSE \
$SPARK_HOME/conf/* && \
apt-get remove curl -y && \
apt-get clean && \
rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY hadoop-native/* /usr/lib/

WORKDIR $SPARK_HOME

CMD [ "bash" ]
