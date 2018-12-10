#!/bin/bash

#####	NOME:				gera_cabeçalho.sh
#####	VERSÃO:				1.1
#####	DESCRIÇÃO:			Insere cabeçalhos em novos scripts ou em existentes.
#####	DATA DA CRIAÇÃO:	10/12/2018
#####	ESCRITO POR:		Maurício G. Paiva
#####	E-MAIL:				mauriciodez@gmail.com
#####	DISTRO:				Debian GNU/Linux 8 (jessie)
#####	LICENÇA:			GPLv3
#####	PROJETO:			https://github.com/mauriciodez/gera_cabeçalho.git

TR="#####"
USER="Maurício G. Paiva"
EMAIL="mauriciodez@gmail.com"
GIT="https://github.com/mauriciodez/"
VS="GPLv3"

TXT2	()	{
			sed -i "2s,^,\n$TR\tNOME:\t\t\t\t$(echo $ARQ)\n$TR\tVERSÃO:\t\t\t\t1.0\n$TR\tDESCRIÇÃO:\t\t\t$descricao \
			\n$TR\tDATA DA CRIAÇÃO:\t$(date +"%d/%m/%Y")\n$TR\tESCRITO POR:\t\t$USER\n$TR\tE-MAIL:\t\t\t\t$EMAIL \
			\n$TR\tDISTRO:\t\t\t\t$(cat /etc/*-release|head -1|awk -F'"' '{print $2}')\n$TR\tLICENÇA:\t\t\t$VS \
			\n$TR\tPROJETO:\t\t\t$GIT$(echo $ARQ|cut -d'.' -f1).git\n," $ARQ
			}

x="s"
while [ 1 ];
do

clear && ls *.sh
	echo -e "Qual o arquivo que deseja modificar ? [ENTER] para novo arquivo"
		read ARQ

	if [ -z $ARQ ];then
		echo "Modo de criação"
		read -p "Insira o nome para o novo arquivo -> " ARQ
			if [ `echo $ARQ | cut -d'.' -f2` != "sh" ];then
				ARQ=`echo "$ARQ.sh"`
			fi
				echo -e "#!/bin/bash\n" > $ARQ
				read -p "Insira a descrição do script -> " descricao
				TXT2
				chmod +x $ARQ
				exit 0
			else

		if [ `echo $ARQ | cut -d'.' -f2` != "sh" ];then
			ARQ=`echo "$ARQ.sh"`
		fi

			if [ -e "$ARQ" ];then
				read -p "Insira a descrição do script -> " descricao
				TXT2
			else
				echo "Arquivo não encontardo quer fazer de novo ? [s]"
				read resposta
					if [ $resposta != $x ]; then
                  exit
					fi
			fi
	fi
done