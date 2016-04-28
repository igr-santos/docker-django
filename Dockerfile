FROM debian
MAINTAINER Igor Santos <igr.exe@gmail.com>

# get up to date
RUN apt-get update --fix-missing && apt-get -y upgrade

# global installs
RUN apt-get install -y build-essential git
RUN apt-get install -y python3 python3-dev
RUN apt-get install -y python3-pip
RUN apt-get install -y nginx supervisor

# stop supervisor service as we'll run it manually
RUN service supervisor stop

# build dependencies for postgres
RUN apt-get install -y libpq-dev

# create a virtual environment and install all depsendecies from pypi
RUN pip3 install virtualenv
RUN virtualenv -p /usr/bin/python3 /srv/venv

# copy src files to srv env
ONBUILD ADD . /srv/www
# install dependencies python env
ONBUILD RUN /srv/venv/bin/pip install --no-cache-dir -r /srv/www/requirements.txt

EXPOSE 80
