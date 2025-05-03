#!/bin/bash

curr_branch=$(git branch --show-current)

def run_bash_code() {
	if git pull origin dev; then
		echo "===================== Successful PULL request ======================="

		chmod +x after_run.sh

		sh after_run.sh

	else
		echo "================ ERROR: Pull request is unsuccessful ========================"
	fi
}

if [[ "$curr_branch" == "dev" ]]; then

	run_bash_code

else
	git checkout dev

	run_bash_code
fi
