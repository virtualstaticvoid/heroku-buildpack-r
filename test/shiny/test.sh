#!/bin/bash

web_url=$(heroku apps:info -j | jq -r '.app.web_url')
wss_url=${web_url/http/ws}

curl -s ${web_url} -o shiny.html
curl -s ${web_url}shared/shiny.css -o shiny.css
curl -s ${web_url}shared/shiny.min.js -o shiny.js

# test the websocket
# cat test.json | timeout --signal=INT 5 websocat -v -t ${wss_url}websocket/ --

if [ -f shiny.html ] && [ -f shiny.css ] && [ -f shiny.js ]; then
  echo "Success"
else
  echo "Failed"
fi
