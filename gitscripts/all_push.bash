#!/bin/bash

# Push all repositories 
# May 27, 2012: Peli

# $1..translation file name
# $2..main path
function execute
{
	translationfilename=$1
	mainpath=$2
	gitdir=../../../$mainpath/..
	echo "Pushing $mainpath"
	git --git-dir="$gitdir/.git" --work-tree="$gitdir" add .
	git --git-dir="$gitdir/.git" --work-tree="$gitdir" commit -m "import translations from Launchpad"
	git --git-dir="$gitdir/.git" --work-tree="$gitdir" push
}

# Read all apps that should be translated.
# sed:
# - Convert DOS line ending to UNIX line ending using: sed 's/\r//'
# - Remove comment lines starting with "#"
# - Remove empty lines
# apps=( `cat "../applications.txt" | sed -e "s/#.*$//" -e "/^$/d"`)
apps=( `cat "../applications.txt" | sed -e "s/\r//" -e "s/#.*$//" -e "/^$/d"`)

for (( i = 0 ; i < ${#apps[@]} ; i+=2 ))
do
	if [ "${apps[$i]}" == "STOP" ] ; then
		break
	fi
	if [ "${apps[$i]}" == "descriptions" ] ; then
		continue
	fi
	execute ${apps[$i]} ${apps[$i+1]}
done

# Special cases
# (a dummy directory is added in the end, because ".." is used above to find the .git repository)
execute "descriptions" "translations/descriptions/translations"
execute "export" "translations/export/translations_aboutapp"
execute "import" "translations/import/translations_aboutapp"

