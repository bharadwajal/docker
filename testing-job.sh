#!/bin/bash
set -x
image_tag=$(echo 'docker ps --format "{{.Image}}" | cut -d ':' -f 2' | bash)

echo "Testing begins"

if [ $image_tag == "testing" ]
then
  echo "Tag matched. Running test job 1."
  curl -X POST http://54.172.195.237:8080/job/docker-job/build \
  --user bj:b6475f8b607c0a88dfb82dca1fe02fe2 \
  --data-urlencode json='{"parameter": [{"name":"Name", "value":"Woohoo!"}]}'

elif [ $image_tag == "integration2" ]
then
    echo "Tag:integration2 matched. Running jenkins test job2."
    curl -X POST http://54.172.195.237:8080/job/docker-test-2/build \
  --user bj:b6475f8b607c0a88dfb82dca1fe02fe2 \
  --data-urlencode json='{"parameter": [{"name":"Name", "value":"Woohoo!"}]}'
  
elif [ $image_tag == "integration3" ]
then
    echo "Tag:integration2 matched. Running jenkins test job3."
    curl -X POST http://54.172.195.237:8080/job/docker-test-3/build \
  --user bj:b6475f8b607c0a88dfb82dca1fe02fe2 \
  --data-urlencode json='{"parameter": [{"name":"Name", "value":"Woohoo!"}]}'
  
else
    echo "No tags matched. Sending a message"
    
fi

echo "Testing ends"


