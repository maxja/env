# docker image build \
#   -t image_name:tag \
#   -f ./Dockerfile \
#   --build-arg project= \
#   --build-arg maintainer= \
#   --build-arg commit= \
#   --build-arg tag= \
#   --build-arg link=value \
#   .
ARG PACKAGE=none
ARG VARIANT=latest

FROM debian:buster

LABEL Project="${project}"
LABEL Maintainer="${maintainer}"
LABEL Commit="${commit}"
LABEL Tag="${tag}"
LABEL Link="${project}/commit/${commit}"

COPY build/*.sh /tmp/run/

RUN apt-get update \
	&& /bin/bash /tmp/run/${PACKAGE}.sh "${VARIANT}" \
	&& apt-get clean -y \
	&& rm -rf /var/lib/apt/lists/* /tmp/run
