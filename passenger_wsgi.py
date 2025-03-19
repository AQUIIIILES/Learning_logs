import os
import sys

# Caminho para o projeto Django
sys.path.insert(0, '/home1/mikae090/learning-logs.mikaelacristalaesthetics/Learning_log')

# Define a variável de ambiente do Django
os.environ['DJANGO_SETTINGS_MODULE'] = 'learning_log.settings'

# Ativa o ambiente virtual (se estiver usando)
activate_env = '/home1/mikae090/learning-logs.mikaelacristalaesthetics/Learning_log/env/bin/activate_this.py'
if os.path.exists(activate_env):
    with open(activate_env) as f:
        exec(f.read(), {'__file__': activate_env})

# Carrega a aplicação WSGI do Django
from django.core.wsgi import get_wsgi_application
application = get_wsgi_application()

