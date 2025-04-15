
while [[ true ]]; do
   curl -X 'GET' \
  'http://rest-fights-dev-user1.apps.cluster-lzxlf.lzxlf.sandbox1417.opentlc.com/api/fights/hello' \
  -H 'accept: text/plain'

done
