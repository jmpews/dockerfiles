openssl genrsa -out ./domain.key 4096
openssl req -new -x509 -key ./domain.key -out ./domain.crt -days 3650 -subj /C=CN/ST=state/L=CN/O=jmp/OU=jmp\ unit/CN=jmpews.com/emailAddress=root@jmpews.com
rm -rf certs
mkdir certs
cp domain.* ./certs
