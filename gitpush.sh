#!/bin/bash


if [ $# -eq 0 ] 
   then
	echo "Please enter the issue name after ./pushgit.sh <issue name>"
else
	parameterVar=$1
	branchName="$(git symbolic-ref --short HEAD)"
	echo
	echo
	echo "Staging"
	git add *
	echo
	echo
	echo "Commiting the --- ${parameterVar} --- issue to ${branchName}"
	git commit -m "${parameterVar}"
	echo
	echo
	echo "Pulling latest code from ${branchName}"
	git pull
	echo
	echo
	echo "Pushing to origin ${branchName}"
	git push origin ${branchName}
	echo
	echo
	echo
	echo "*** Successful push to ${branchName} ***"
fi
