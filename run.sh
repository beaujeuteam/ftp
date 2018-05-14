if [ -z "$1" ]
  then
    echo "No argument supplied (public host)"
    exit 1
fi

docker stop ftp-server

docker run -d --rm \
    --name ftp-server \
    -p 21:21 -p 30000-30009:30000-30009 \
    -e "PUBLICHOST=$1" \
    -e PGID=1000 \
    -e PUID=1000 \
    -v $(pwd)/data:/home/ftpusers/ \
    -v $(pwd)/config/passwd:/etc/pure-ftpd/passwd \
    stilliard/pure-ftpd:latest
