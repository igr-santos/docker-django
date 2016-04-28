FROM igrsantos/pythonweb-base:onbuild
MAINTAINER Igor Santos <igr.exe@gmail.com>

RUN pip3 install supervisor-stdout

# file management, everything after an ADD is uncached, so we do it as late as
# possible in the process.
ADD ./supervisord.conf /etc/supervisord.conf
ADD ./sites-enabled/default /etc/nginx/sites-enabled/default

# create directories to save assets files
WORKDIR /srv
RUN mkdir static media

# stop nginx to load the config
RUN service nginx stop

# start supervisor to run our wsgi server
CMD supervisord -c /etc/supervisord.conf -n
