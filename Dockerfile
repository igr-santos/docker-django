FROM python:3.4-onbuild

ENV DJANGO_CONFIGURATION Docker

CMD ["gunicorn", "-c", "gunicorn_conf.py", "--chdir", "{{cookiecutter.src}}", "project.wsgi:application", "--reload"]
