ARG BUILD_FROM

## builder ##
FROM $BUILD_FROM as build

ENV LANG C.UTF-8
WORKDIR /usr/playit
USER root

# install rust prereqisites
RUN apk add --no-cache --update \
    curl \
    git \
    gcc \
    libgcc \
    g++

# install rust using rustup
RUN curl https://sh.rustup.rs -sSf | sh -s -- -y

# clone playit-agent and build
RUN git clone https://github.com/playit-cloud/playit-agent.git
WORKDIR /usr/playit/playit-agent
RUN $HOME/.cargo/bin/cargo build --release --bin=agent


## addon ##
FROM $BUILD_FROM
#RUN apk add --no-cache --update libgcc

# copy playit binary from builder
COPY --from=build /usr/playit/playit-agent/target/release/agent /bin/playit-agent
RUN chmod a+x /bin/playit-agent

# copy launch script
COPY run.sh /
RUN chmod a+x /run.sh
CMD [ "/run.sh" ]
