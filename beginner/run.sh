#!/bin/bash

curr_branch=$(git branch --show-current)

if [[ "$curr_branch" == "dev" ]]; then

	if git pull origin dev; then
		echo "===================== Successful PULL request ======================="

		chmod +x after_run.sh

		sh after_run.sh
	else
		echo "================ ERROR: Pull request is unsuccessful ========================"
	fi
else
	git checkout dev

	if git pull origin dev; then
                 echo "===================== Successful PULL request ======================="

                 chmod +x after_run.sh

                 sh after_run.sh
         else
                 echo "================ ERROR: Pull request is unsuccessful ========================"
         fi

fi
