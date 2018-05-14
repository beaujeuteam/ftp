if [ -z "$1" ]
  then
    echo "No argument supplied (username)"
    exit 1
fi

echo "Create user ($1)"
docker exec -it ftp-server pure-pw useradd $1 -f /etc/pure-ftpd/passwd/pureftpd.passwd -m -u ftpuser -d /home/ftpusers
