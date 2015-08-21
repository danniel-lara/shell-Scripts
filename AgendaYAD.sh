#!/bin/bash
#
# Agenda Simples em Yad
# Autor: Daniel Lara Souza
# Versao 0.2
# Migrado do Dialog para o Yad
# Ajuda do rai3mb ( Raimundo Alves Portela )
# na Criação do Menu

while : ; do
OPCAO=$( \
yad --list \
--center --title=' AGENDA ' --text='Escolha um opcao: ' \
--width=400 --height=200 \
--column='opcao':NUM --column='texto':TEXT \
--no-headers --print-column=1 --separator='' --hide-column=1 \
1 'Adicionar Contato' \
2 'Listar Contatos' \
3 'Pesquisar Contatos ' \
4 'Deletar Contatos' \
--button="Sair":1 --button="Acessar":0 )


[ $? -ne 0 ] && break

case "$OPCAO" in


1)
NOME=$( yad --center --entry --entry-label="Nome" --entry-text="")

FONE=$( yad --center --entry --entry-label="Telefone" --entry-text="")

echo $NOME - $FONE >> agenda;

;;
2) sort agenda > agenda.tmp

AGENDA=$(cat agenda.tmp)

yad --center --title="Agenda" --text="$AGENDA" --width="300" --height="100"

rm -rf agenda.tmp
;;

3) nome=$( yad --center --entry --entry-label="Nome" --entry-text="" )

AGENDA=$(cat agenda | grep $nome)

yad --center --title="Agenda" --text="$AGENDA" --width="300" --height="100"


;;

4) nome=$( yad --center --entry --entry-label="Nome" --entry-text="" )

mv agenda agenda.tmp

grep -v $nome agenda.tmp > agenda

rm -rf agenda.tmp
;;

0) break

;;
esac
done

