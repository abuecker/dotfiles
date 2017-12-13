function gsignurl --description 'Get only the signed url from google storage'
	if test -z $GOOGLE_SHORT_URL_KEY
    echo "API key to shorten url not found"
    exit -1
  end

  set -l URL (gsutil signurl -d $argv[1] $argv[2] $argv[3]  | \
    awk 'FNR==2{print $NF}')

  curl "https://www.googleapis.com/urlshortener/v1/url?key=$GOOGLE_SHORT_URL_KEY" \
    -H 'Content-Type: application/json' \
    -d "{\"longUrl\": \"$URL\"}" 2> /dev/null | \
      jq -r ".id"
end
