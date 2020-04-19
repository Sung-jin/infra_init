# with key
if [ $1 ]
  then 
    scp ./$1 fonnie@fonnie.xyz:infra_init/$1
    exit
fi

scp -r ./* fonnie@fonnie.xyz:infra_init