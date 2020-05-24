#!/bin/bash

web_url=$(heroku apps:info -j | jq -r '.app.web_url')

curl -s "${web_url}echo?msg=Hello%20World!" -o msg.txt
curl -s -d "a=10" -d "b=2" ${web_url}sum -o sum.txt
curl -s ${web_url}plot -o plot.png

if [ -f msg.txt ] && [ -f sum.txt ] && [ -f plot.png ]; then
  echo "Success"
else
  echo "Failed"
fi
