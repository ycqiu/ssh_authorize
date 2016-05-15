#!/bin/sh

if [ $# -le 1 ]
then
	echo "usage: $0 [-p port] [user@]machine"
	exit 1
fi

umask 077
test -d ~/.ssh || mkdir ~/.ssh;
test -f ~/.ssh/id_rsa.pub || ssh-keygen -t rsa -P '' -f ~/.ssh/id_rsa
cat ~/.ssh/id_rsa.pub | ssh $@ "umask 077; test -d ~/.ssh || mkdir ~/.ssh; cat >> ~/.ssh/authorized_keys"

