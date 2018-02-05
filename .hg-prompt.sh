#/bin/bash

__hg_branch ()
{
	hg branch 2> /dev/null | awk '{print $1}'
}

__hg_dirty ()
{
	hg status 2> /dev/null | awk '{print "*"}' | uniq | head -c1
}

__hg_ps1 ()
{
	ret=`__hg_branch`
	if [[ ! -z $ret ]] ; then
		IFS='|'
		mod=`__hg_dirty`
		ret=" (${ret}${mod})"
		echo $ret
		unset IFS
	fi
}

