FROM openjdk:11

# ARGUMENTS
ARG MAVEN_VERSION=3.6.3
ARG USER_HOME_DIR="/root"
ARG SHA=c35a1803a6e70a126e80b2b3ae33eed961f83ed74d18fcd16909b2d44d7dada3203f1ffe726c17ef8dcca2dcaa9fca676987befeadc9b9f759967a8cb77181c0
ARG BASE_URL=https://apache.osuosl.org/maven/maven-3/${MAVEN_VERSION}/binaries

# MAVEN 
RUN mkdir -p .m2 \
    && mkdir -p /usr/share/maven /usr/share/maven/ref \ 
    && curl -k -fsSL -o /tmp/apache-maven.tar.gz ${BASE_URL}/apache-maven-${MAVEN_VERSION}-bin.tar.gz \
    && echo "${SHA}  /tmp/apache-maven.tar.gz" | sha512sum -c - \
    && tar -xzf /tmp/apache-maven.tar.gz -C /usr/share/maven --strip-components=1 \
    && rm -f /tmp/apache-maven.tar.gz \
    && ln -s /usr/share/maven/bin/mvn /usr/bin/mvn

# ENVIRONMENT
ENV MAVEN_HOME /usr/share/maven
ENV MAVEN_CONFIG "$USER_HOME_DIR/.m2"
ENV PATH="$JAVA_HOME/bin:$MAVEN_HOME:${PATH}"

ENTRYPOINT [ "mvn" ]
#CMD exec /bin/bash -c "trap : TERM INT; sleep infinity & wait"