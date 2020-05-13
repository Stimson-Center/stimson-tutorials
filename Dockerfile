# Docker file for a slim Ubuntu-based Python3 image

FROM ubuntu:latest
LABEL maintainer="cooper@pobox.com"

# Needed for string substitution
SHELL ["/bin/bash", "-c"]

ARG USE_PYTHON_3_NOT_2=True
ARG _PY_SUFFIX=${USE_PYTHON_3_NOT_2:+3}
ARG PYTHON=python${_PY_SUFFIX}
ARG PIP=pip${_PY_SUFFIX}

# See http://bugs.python.org/issue19846
ENV LANG C.UTF-8

RUN apt-get update && apt-get install -y \
    ${PYTHON} \
    ${PYTHON}-pip

RUN ${PIP} --no-cache-dir install --upgrade \
    pip \
    setuptools

# Some TF tools expect a "python" binary
RUN ln -s $(which ${PYTHON}) /usr/local/bin/python

COPY requirements.txt .
RUN ${PIP} --no-cache-dir install virtualenv
RUN ${PIP} --no-cache-dir install -r requirements.txt
RUN ${PYTHON} -m spacy download en

COPY bashrc /etc/bash.bashrc
RUN chmod a+rwx /etc/bash.bashrc

RUN yes | jupyter notebook --generate-config
RUN jupyter serverextension enable --py jupyter_http_over_ws

RUN mkdir -p /tf && chmod -R a+rwx /tf/
RUN mkdir /.local && chmod a+rwx /.local
WORKDIR /tf
COPY readme-for-jupyter.md README.md

ENV TZ=UTC
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN apt-get install -y tzdata

WORKDIR /tf
EXPOSE 8888

RUN ${PYTHON} -m ipykernel.kernelspec

CMD ["bash", "-c", "source /etc/bash.bashrc && jupyter notebook --notebook-dir=/tf --ip 0.0.0.0 --no-browser --allow-root"]

