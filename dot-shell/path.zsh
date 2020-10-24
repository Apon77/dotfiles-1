#!/bin/zsh
if [[ -f ~/.shell/path ]]
then
	while read line;do
		line="${line/#\~/$HOME}"
		PATH="${PATH//($line:|:$line)/}"
		if [[ -d ${line%%|*} ]];then
			if [ "${line##*|}" = "prepend" ];then
				PATH="${line%%|*}${PATH:+:$PATH}"
			else
				PATH="${PATH:+$PATH:}${line%%|*}"
			fi
		fi
	done < ~/.shell/path
	echo $PATH
fi
