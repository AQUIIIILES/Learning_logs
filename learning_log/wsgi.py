# +++++++++++ DJANGO +++++++++++
# To use your own django app use code like this:
import os
import sys
#
## assuming your django settings file is at '/home/AQUILES/Learning_logs/learning_log/settings.py'
## and your manage.py is is at '/home/AQUILES/mysite/manage.py'
path = '/home/AQUILES/Learning_logs'
if path not in sys.path:
    sys.path.append(path)

os.environ['DJANGO_SETTINGS_MODULE'] = 'learning_log.settings'
#
## then:
from django.core.wsgi import get_wsgi_application
application = get_wsgi_application()
