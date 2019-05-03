FROM node:6.14-stretch

ENV NODE_ENV=production \
    BABEL_CACHE_PATH=/home/node/.babel.json \
    DB_NOMBRE=plantillas \
    DB_USUARIO=plantillas \
    DB_PASSWORD=plantillas \
    DB_PUERTO=5432 \
    DB_HOST=plantillas_db \
    RUTA_ARCHIVOS_EXTERNOS=./public/externos/ \
    RUTA_DOCUMENTOS=./public/documentos/ \
    HOST_BACKEND=0.0.0.0 \
    HOST_FRONTEND=0.0.0.0 \
    DOCUMENTO_GET=false \
    IDENTIFICADOR_DIRECTOR=2 \
    IDENTIFICADOR_DIRECCION_UNIDAD=2 \
    CITE_DIGITOS=5 \
    CITE_GUIA=acme \
    CORREO_PUERTO=25 \
    CORREO_HOST=localhost \
    CORREO_REMITENTE=Nombre-del-Remitente \
    CORREO_ORIGEN=ejemplo@correo.gob.bo \
    CORREO_SECURE=false \
    CORREO_IGNORETLS=false \
    CORREO_TLS_RECHAZAR=false \
    NOTIFICACION_SMS_URL=http://192.168.1.2/sms \
    NOTIFICACION_SMS_TOKEN=sms-token \
    NOTIFICACION_CORREO_URL=http://192.168.1.2/correo \
    NOTIFICACION_CORREO_TOKEN=correo-token \
    LDAP_URL=ldaps://ldap.example.abc:1234 \
    LDAP_BIND_DN=cn=admin,dc=entidad,dc=com \
    LDAP_PASSWORD=admin \
    LDAP_SEARCHBASE=ou=usuarios,dc=entidad,dc=com \
    JWT_SECRET=esta-cadena-tiene-que-ser-modificada-en-produccion \
    JWT_SESSION=false \
    JWT_TIEMPO=60 \
    BACKEND_PUERTO=8000 \
    FABRIC_HOST=1.2.3.4 \
    FABRIC_PORT=3001 \
    FABRIC_TOKEN=esta-cadena-tiene-que-ser-modificada-en-produccion

RUN npm install -g sequelize-cli pg

USER node

WORKDIR /home/node

COPY --chown=node:node package.json .

RUN npm install --production

COPY --chown=node:node . .

RUN mv config/config.sample.js config/config.js \
    && mv src/config/config.production.sample.js src/config/config.production.js \
    && node_modules/.bin/babel-node parches/parchar.js

EXPOSE 8000

VOLUME /home/node/public

CMD ["node_modules/.bin/babel-node","index.js"]
