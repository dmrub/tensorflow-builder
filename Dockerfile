ARG BASE_IMAGE=tensorflow/tensorflow:2.8.4-gpu

FROM $BASE_IMAGE

LABEL org.opencontainers.image.authors="Dmitri Rubinstein"
LABEL org.opencontainers.image.source="https://github.com/dmrub/tensorflow-benchmarks"

RUN set -ex; \
    apt-get update; \
    apt-get install -y --no-install-recommends \
        ca-certificates git; \
    apt-get install -y git; \
    apt-get clean; \
    rm -rf /var/lib/apt/lists/*; \
    mkdir -p /opt; \
    git clone https://github.com/tensorflow/benchmarks.git /opt/tf-benchmarks; \
    chmod u+x /opt/*;

ENTRYPOINT ["/opt/launcher.py"]
