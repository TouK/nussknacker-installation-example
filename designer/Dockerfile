ARG NUSSKNACKER_VERSION

FROM touk/nussknacker:${NUSSKNACKER_VERSION}_scala-2.12

ARG FLINK_VERSION
ARG FLINK_VERSION_SHORT
ARG HADOOP_VERSION
ARG FLINK_HADOOP_VERSION
ARG AWS_SDK_VERSION
ARG ICEBERG_VERSION

USER root

RUN curl -L https://repo1.maven.org/maven2/org/apache/iceberg/iceberg-flink-runtime-${FLINK_VERSION_SHORT}/${ICEBERG_VERSION}/iceberg-flink-runtime-${FLINK_VERSION_SHORT}-${ICEBERG_VERSION}.jar \
   -o /opt/nussknacker/components/flink/extra/iceberg-flink-runtime-${FLINK_VERSION_SHORT}-${ICEBERG_VERSION}.jar

RUN curl -L "https://repo1.maven.org/maven2/org/apache/hadoop/hadoop-common/${HADOOP_VERSION}/hadoop-common-${HADOOP_VERSION}.jar" \
   -o /opt/nussknacker/lib/hadoop-common-${HADOOP_VERSION}.jar

RUN curl -L "https://repo.maven.apache.org/maven2/org/apache/flink/flink-shaded-hadoop-2-uber/${FLINK_HADOOP_VERSION}/flink-shaded-hadoop-2-uber-${FLINK_HADOOP_VERSION}.jar" \
   -o /opt/nussknacker/lib/flink-shaded-hadoop-2-uber-${FLINK_HADOOP_VERSION}.jar

RUN curl -L "https://repo1.maven.org/maven2/software/amazon/awssdk/bundle/${AWS_SDK_VERSION}/bundle-${AWS_SDK_VERSION}.jar" \
   -o /opt/nussknacker/components/flink/extra/bundle-${AWS_SDK_VERSION}.jar

RUN chown -R demiourgos728:root /opt/nussknacker

USER demiourgos728