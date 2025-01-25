# OpenSSL Certificate Generation Script

This guide explains how to generate a Certificate Authority (CA), server certificates, and sign them using OpenSSL. The process is automated with a bash script.

## Script Overview
The script performs the following tasks:

1. Removes any existing `.pem`, `.csr`, and `.srl` files.
2. Generates a private key and self-signed certificate for the Certificate Authority (CA).
3. Creates a private key and Certificate Signing Request (CSR) for the server.
4. Defines a configuration file for server certificate extensions.
5. Signs the server's CSR with the CA's private key and certificate.
6. Verifies the generated server certificate.


## Usage Instructions

### 1. Download the Script
Save the above script as `gen.sh` or download the pre-created script:
[Download gen.sh](sandbox:/mnt/data/gen.sh)

### 2. Make the Script Executable
Run the following command to give the script execute permissions:
```bash
chmod +x gen.sh
```

### 3. Execute the Script
Run the script to generate the certificates:
```bash
./gen.sh
```

### 4. Verify Generated Files
The following files will be created:
- **`ca-key.pem`**: The CA's private key.
- **`ca-cert.pem`**: The CA's self-signed certificate.
- **`server-key.pem`**: The server's private key.
- **`server-cert.csr`**: The server's Certificate Signing Request (CSR).
- **`server-cert.pem`**: The server's signed certificate.

### 5. Inspect the Certificates
You can inspect the generated certificates and CSR using these commands:

- **Inspect the CA certificate**:
  ```bash
  openssl x509 -in ca-cert.pem -noout -text
  ```

- **Inspect the server certificate**:
  ```bash
  openssl x509 -in server-cert.pem -noout -text
  ```

- **Inspect the CSR**:
  ```bash
  openssl req -in server-cert.csr -noout -text
  ```

## Notes
- The script uses a 4096-bit RSA key for enhanced security.
- Ensure the `openssl` tool is installed and available in your `PATH` before running the script.
- Update the `CASUBJ` and `SERVERSUBJ` variables to match your organization's details.

## Troubleshooting
If you encounter errors, ensure:
- You have write permissions in the directory.
- The `openssl` command is properly installed and configured.

Feel free to modify the script to fit your specific needs.