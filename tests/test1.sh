#!/bin/bash

clear

echo "Hello word!"

var="Bing!"
echo "$var What's you name ?"
read name
echo "Hello $name."
read -p "Can I get your age : " age
echo ""
read -p "And your sex : " sex
echo "I know you know: $name, $age, $sex"

