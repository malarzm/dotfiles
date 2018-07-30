source ~/.git-prompt.sh
source ~/.hg-prompt.sh
PS1='\[\033]0;$MSYSTEM:${PWD//[^[:ascii:]]/?}\007\]\n\[\033[32m\]\u@\h \[\033[35m\]$MSYSTEM\[\033[33m\]\w\[\033[36m\]`__git_ps1``__hg_ps1`\[\033[0m\]\n$ '

docker() {
	if [[ $1 == "bash" ]]; then
		command docker exec -it "$2" bash
	elif [[ $1 == "ip" ]]; then
		command docker inspect "$2" | grep '"IPAddress": "172' | grep -oE "([0-9\.]+)"
	elif [[ $1 == "nuke" ]]; then
                command docker kill $(command docker ps -q)
                command docker rm $(command docker ps -a -q)
                command docker rmi $(command docker images -q)
	else
		command docker "$@"
	fi
}

phpunit() {
	if [[ -f "./vendor/bin/phpunit" ]]; then
		vendor/bin/phpunit "$@"
	else
		command phpunit "$@"
	fi
}

