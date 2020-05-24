#!/bin/bash

web_url=$(heroku apps:info -j | jq -r '.app.web_url')

curl -s ${web_url} -o page.txt
curl -s ${web_url}plot -o plot.png

if [ -f page.txt ] && [ -f plot.png ]; then
  echo "Success"
else
  echo "Failed"
fi
