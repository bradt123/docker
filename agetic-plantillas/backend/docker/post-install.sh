#!/usr/bin/env sh

set -e

read -p "El presente script destruirá todo el contenido de tu base de datos. Estas seguro ? " -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]; then
  echo 'Inicializando la base de datos ...'
  docker exec plantillas-backend npm run setup
else
  echo 'Abandonando'
fi

