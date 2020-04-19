# with key
if [ $1 ]
  then 
    scp ./$1 fonnie@osj4872.shop:test2/$1
    exit
fi

scp -r ./* fonnie@osj4872.shop:test2