
while [[ true ]]; do
   curl -X 'GET' \
  'http://RELPLACEME/api/fights/hello' \
  -H 'accept: text/plain'

done
