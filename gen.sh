rm *.pem

export CASUBJ=//C=IE/ST=Leinster/L=Kilkenny/O=Anthony/OU=Tech/CN=brightech.ie/emailAddress=anthonyquinn.developer@gmail.com

export SERVERSUBJ=//C=IE/ST=Leinster/L=Kilkenny/O=Anthony/OU=Tech/CN=pcbook.com/emailAddress=anthonyquinn.developer@gmail.com
# Generate CA's private key and self-signed cert
openssl req -x509 -newkey rsa:4096 -days 365 -nodes -keyout ca-key.pem -out ca-cert.pem -subj "${CASUBJ}"


echo "CA's self-signed certificate"
openssl x509 -in ca-cert.pem -noout -text

# Generate web server private key & cert signing request (CSR)
openssl req -newkey rsa:4096 -nodes -keyout server-key.pem -out server-req.pem -subj "${SERVERSUBJ}"

# Use CA private key to sign web server CSR and get back signed cert
openssl x509 -req -in server-req.pem -CA ca-cert.pem -CAkey ca-key.pem -CAcreateserial -out server-cert.pem -extfile server-ext.cnf

echo "Web servers signed certificate"
openssl x509 -in server-cert.pem -noout -text
