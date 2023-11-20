FROM ubuntu:22.04

ARG VERSION="v1.26.0"
RUN apt-get update && \
    apt-get -y install tar wget

RUN wget https://github.com/kubernetes-sigs/cri-tools/releases/download/$VERSION/crictl-$VERSION-linux-amd64.tar.gz && \
    tar zxvf crictl-$VERSION-linux-amd64.tar.gz -C /usr/local/bin && \
    rm -f crictl-$VERSION-linux-amd64.tar.gz

RUN export CONTAINER_RUNTIME_ENDPOINT="/run/containerd/containerd.sock"
COPY entrypoint.sh ./entrypoint.sh
RUN chmod +x ./entrypoint.sh

ENTRYPOINT ["bash" , "./entrypoint.sh" ]
