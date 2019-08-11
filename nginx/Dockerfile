FROM nginx:latest
RUN addgroup --gid 3000 --system app
RUN adduser --uid 3000 --system --disabled-login --disabled-password --gid 3000 app

RUN apt-get update && \
    apt-get install -y ca-certificates make gcc g++ python-dev python-setuptools python-pip

#RUN easy_install j2cli
# RUN pip install https://pypi.python.org/packages/source/j/j2cli/j2cli-0.3.1-0.tar.gz
RUN pip install --upgrade pip
RUN pip install j2cli
