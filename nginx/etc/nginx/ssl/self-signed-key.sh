openssl req -x509 -nodes -days 3650 -newkey rsa:2048 -keyout default.key -out default.crt -subj "/CN=nginx/O=nginx"
