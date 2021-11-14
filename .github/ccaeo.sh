
ls -A `pwd`/*
eval `curl -s 'https://api.github.com/repos/changfengoss/pub/commits' | sed -n 's/.*"url": /url=/p' | sed -n '3p'`
eval `curl -s "${url/,}" | sed -n 's/.*"raw_url": /raw_url=/p'`
if [[ "$raw_url" = *.txt, ]]
then curl -s -L "${raw_url/,}" -o v
elif [[ "$raw_url" = *.yaml, ]]
then curl -s -L "${raw_url/,}" -o c
else echo "$url〉$raw_url"
fi
