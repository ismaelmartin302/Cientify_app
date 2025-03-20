#!/bin/bash

if [ ! -d ".git" ]; then
  echo "Inicializando el repositorio Git..."
  git init
  git remote add origin ssh://cientify@cientify.com/~/cientify.com.git
else
  echo "Repositorio Git ya inicializado."
fi

git fetch remote main
git reset --soft remote/main

git add .
git commit -m "Actualización del build"
git push -u remote main

ssh cientify.com << 'EOF'
  if [ ! -d "/home/cientify/cientify.com" ]; then
    git clone /home/cientify/cientify.com.git /home/cientify/cientify.com
  fi
  cd /home/cientify/cientify.com
  git pull origin
EOF