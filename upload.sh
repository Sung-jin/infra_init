#/bin/bash

case "$1" in
 1) DOMAIN="fonnie.xyz" ;;
 2) DOMAIN="fonnie.shop" ;;
 3) DOMAIN="osj4872.shop" ;;
 *)
  echo "Please select the right domain or select the right domain."
  echo "1: fonnie.xyz"
  echo "2: fonnie.shop"
  echo "3: osj4872.shop"
  exit
esac

# with key
if [ $2 ]
  then 
    scp ./$2 fonnie@$DOMAIN:infra_init/$2
    exit
fi

scp -r ./* fonnie@$DOMAIN:infra_init