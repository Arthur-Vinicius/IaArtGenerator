# define a imagen do mysql e versão como base para o container que será criado.
FROM mysql:5.7

# Copia o arquivo schema para dentro do container
COPY schema.sql /docker-entrypoint-initdb.d/

# Expõe a porta 3306 para conexão externa, no caso a conecão da maquina host com a porta do container.
EXPOSE 3306
