function uploadReta --description 'Uploads the reta assets to S3'
  aws --profile retatrust s3 cp --recursive --acl public-read  ~/Downloads/$argv[1] s3://reta-assets/2023/$argv[1]
  for f in (aws --profile retatrust s3 ls --recursive s3://reta-assets/2023/$argv[1]/)
    echo https://assets.retatrust.org/(echo $f | awk '{for(i=4;i<=NF;i++)printf $i""FS; print""}' | awk '{$1=$1;print}' |  sed 's/ /+/g')
  end
end
