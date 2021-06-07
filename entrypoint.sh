#!/bin/sh -l

token=$1
url=$2
method=$3
arg=$4

if [ -z $token -o -z $url -o -z $method -o ]; then
  echo 'Required argument lacks.'
  exit 1
fi

criterion=$(echo $url | grep -E "^https://api.github.com/")
if [ -z "$criterion" ]; then
  echo 'The url of inputs contains illegal domain.'
  exit 1
fi

curl \
  -X $method \
  -H "Authorization: token $token" \
  -H "Accept: application/vnd.github.v3+json" \
  $url \
  -d $arg
