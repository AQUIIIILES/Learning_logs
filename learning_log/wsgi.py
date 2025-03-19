"""
WSGI config for learning_log project.

It exposes the WSGI callable as a module-level variable named ``application``.

For more information on this file, see
https://docs.djangoproject.com/en/5.1/howto/deployment/wsgi/
"""

import os, sys

from django.core.wsgi import get_wsgi_application

sys.path.append('/home/mikae090/learning-logs.mikaelacristalaesthetics')
os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'learning_log.settings')

from django.core.wsgi import get_wsgi_application
application = get_wsgi_application()
