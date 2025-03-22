#!/bin/bash
cd /

echo "Iniciando configuração da infraestrutura do servidor!"
# Excluir diretórios, arquivos grupos e usuários criados anteriormente
# Todo provisionamento deve ser feito em um arquivo do tipo Bash Script

echo "Excluindo usuários e suas pastas no  diretório /home, bem como o grupo individual do usuário"
userdel -r carlos
userdel -r maria
userdel -r joao

userdel -r debora
userdel -r sebastiana
userdel -r roberto

userdel -r josefina
userdel -r amanda
userdel -r rogerio

echo "Excluindo os grupos específicos"
groupdel GRP_ADM
groupdel GRP_VEN
groupdel GRP_SEC

echo "Excluindo os diretórios específicos na pasta raiz"
rm -rf /publico /adm /ven /sec

# O dono de todos os diretórios criados será o usuário root

echo "Criando as pastas no diretório raiz"
mkdir /publico /adm /ven /sec

echo "Criando os Grupos"
groupadd GRP_ADM
groupadd GRP_VEN
groupadd GRP_SEC

echo "Trocando os grupos e permissões dos diretórios na raiz"
chown -vR root:GRP_ADM /adm
chown -vR root:GRP_VEN /ven
chown -vR root:GRP_SEC /sec

# Todos os usuários terão permissão total dentro do diretório publico
echo "Atribuindo permissões livres ao diretório /publico"
chmod 777 /publico

# Os usuários de cada grupo terão permissão total dentro de seu respectivo diretório
# Os usuários não poderão ter permissão de leitura, escrita e execução em diretórios de departamentos que eles não pertencem
echo "Trocando permissões dos grupos privados"
chmod 770 /adm
chmod 770 /ven
chmod 770 /sec

echo "Adicionando usuários Administradores"
useradd carlos -m -c "Carlos Rodrigues" -g GRP_ADM -s /bin/bash -p $(openssl passwd -6 senha123)
passwd -e carlos
useradd maria -m -c "Maria Souza" -g GRP_ADM -s /bin/bash -p $(openssl passwd -6 senha123)
passwd -e maria
useradd joao -m -c "Joao Fernandes" -g GRP_ADM -s /bin/bash -p $(openssl passwd -6 senha123)
passwd -e joao

echo "Adicionando usuários do grupo Vendas"
useradd debora -m -c "Debora Barbosa" -g GRP_VEN -s /bin/bash -p $(openssl passwd -6 senha123)
passwd -e debora
useradd sebastiana -m -c "Sebastiana Santana" -g GRP_VEN -s /bin/bash -p $(openssl passwd -6 senha123)
passwd -e sebastiana
useradd roberto -m -c "Roberto dos Santos" -g GRP_VEN -s /bin/bash -p $(openssl passwd -6 senha123)
passwd -e roberto

echo "Adicionando usuários do grupo Secretariado"
useradd josefina -m -c "Josefina Soares" -g GRP_SEC -s /bin/bash -p $(openssl passwd -6 senha123)
passwd -e josefina
useradd amanda -m -c "Amanda Ribeiro" -g GRP_SEC -s /bin/bash -p $(openssl passwd -6 senha123)
passwd -e amanda
useradd rogerio -m -c "Rogerio Silva" -g GRP_SEC -s /bin/bash -p $(openssl passwd -6 senha123)
passwd -e rogerio

echo "Configuração do servidor completa!"
