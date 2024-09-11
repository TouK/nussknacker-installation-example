ARG FLINK_VERSION

FROM flink:${FLINK_VERSION}

USER root
RUN echo '#!/bin/sh' > /ex-docker-entrypoint.sh && \
    echo 'export FLINK_PROPERTIES=$(cat /opt/flink/conf/flink-properties.yml) && /docker-entrypoint.sh "$@"' >> /ex-docker-entrypoint.sh && \
    chmod +x /ex-docker-entrypoint.sh

USER flink
COPY flink-properties.yml /opt/flink/conf/
RUN mkdir -p /opt/flink/data && \
    chmod -R 777 /opt/flink/data

ARG FLINK_VERSION_SHORT
ARG HADOOP_VERSION
ARG FLINK_HADOOP_VERSION
ARG AWS_SDK_VERSION
ARG ICEBERG_VERSION

RUN curl -L https://github.com/knaufk/flink-faker/releases/download/v${FAKER_VERSION}/flink-faker-${FAKER_VERSION}.jar -o ${FLINK_HOME}/lib/flink-faker-${FAKER_VERSION}.jar

RUN curl -L https://repo1.maven.org/maven2/org/apache/iceberg/iceberg-flink-runtime-${FLINK_VERSION_SHORT}/${ICEBERG_VERSION}/iceberg-flink-runtime-${FLINK_VERSION_SHORT}-${ICEBERG_VERSION}.jar \
   -o ${FLINK_HOME}/lib/iceberg-flink-runtime-${FLINK_VERSION_SHORT}-${ICEBERG_VERSION}.jar

RUN curl -L "https://repo1.maven.org/maven2/org/apache/hadoop/hadoop-common/${HADOOP_VERSION}/hadoop-common-${HADOOP_VERSION}.jar" \
   -o ${FLINK_HOME}/lib/hadoop-common-${HADOOP_VERSION}.jar

RUN curl -L "https://repo.maven.apache.org/maven2/org/apache/flink/flink-shaded-hadoop-2-uber/${FLINK_HADOOP_VERSION}/flink-shaded-hadoop-2-uber-${FLINK_HADOOP_VERSION}.jar" \
   -o ${FLINK_HOME}/lib/flink-shaded-hadoop-2-uber-${FLINK_HADOOP_VERSION}.jar

RUN curl -L "https://repo1.maven.org/maven2/software/amazon/awssdk/bundle/${AWS_SDK_VERSION}/bundle-${AWS_SDK_VERSION}.jar" \
   -o ${FLINK_HOME}/lib/bundle-${AWS_SDK_VERSION}.jar

VOLUME /opt/flink/data

ENTRYPOINT [ "/ex-docker-entrypoint.sh" ]
