#!/bin/sh

response=$(curl -s -o /dev/null -w "%{http_code}" http://localhost:8000)

if [ "$response" -eq 200 ] || [ "$response" -eq 404 ]; then
  exit 0
else
  exit 1
fi
