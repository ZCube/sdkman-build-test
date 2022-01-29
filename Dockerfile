FROM buildpack-deps:focal

RUN apt update && apt install -y bash curl wget zip unzip

RUN adduser gitpod --disabled-password
ENV HOME=/home/gitpod
WORKDIR $HOME

USER gitpod

RUN curl -fsSL "https://get.sdkman.io" | bash \
 && bash -c ". /home/gitpod/.sdkman/bin/sdkman-init.sh \
             && sdk install java 11.0.13-tem \
             && sdk install gradle \
             && sdk install maven \
             && sdk flush archives \
             && sdk flush temp"
