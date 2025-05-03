#!/bin/bash

if git pull origin dev; then
	echo "===================== Successful PULL request ======================="

	chmod +x after_run.sh

	sh after_run.sh
else
	echo "================ ERROR: Pull request is unsuccessful ========================"
fi
