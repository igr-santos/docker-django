============================
cookiecuter to docker-django
============================

Cookiecutter_ template for a Docker Compose with Nginx, Django, PostgreSQL.

* Github repo: http://github.com/igr-santos/docker-django/tree/docker-compose-template

.. _Cookiecutter: https://github.com/audreyr/cookiecutter

Quickstart
----------

Generate a Docker Compose project::

    cookiecutter git@github.com:igr-santos/docker-django.git --checkout docker-compose-template

TODO
----

- [ ] template README.md with docs Docker Compose
- [ ] template config detail

Example config database::

    DATABASES = {
        'default': {
            'ENGINE': 'django.db.backends.postgresql_psycopg2',
            'NAME': 'postgres',
            'USER': 'postgres',
            'PASSWORD': '',
            'HOST': os.environ['POSTGRES_PORT_5432_TCP_ADDR'],
            'PORT': os.environ['POSTGRES_PORT_5432_TCP_PORT'],
        }
    }
