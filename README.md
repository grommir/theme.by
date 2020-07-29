# theme.by

Install docker https://docs.docker.com/install/linux/docker-ce/debian/

Install docker compose https://docs.docker.com/compose/install/

Run

```bash
docker-compose up -d
```

## Adding sites to ap*.tneme.by or ng*.theme.by

### Update environment variable 'DOMAINS' in docker-compose.yml for service 'certbot'

Example:

```bash
    environment:
        DOMAINS: "ap1.theme.by ng1.theme.by"
```

### Create folder according to subdomain name

For Apache:

```bash
./apache/html/ap1
```

Or Nginx:

```bash
./nginx/html/ng1
```

### Restart certbot

```bash
docker-compose up -d --force-recreate certbot
```

Wait a few minutes to let certbot issue a new certificate

### Restart nginx

```bash
docker-compose up -d --force-recreate nginx
```

## Adding custom site

### Create folder according to domain name

For Apache:

```bash
./apache/html/$siteName
```

Or Nginx:

```bash
./nginx/html/$siteName
```

### Update environment variable 'DOMAINS' in docker-compose.yml for service 'certbot' with custom site

Example:

```bash
    environment:
        DOMAINS: "ap1.theme.by ng1.theme.by theme.by www.theme.by"
```

### Add configuration for Nginx

Create new configuration file in

```bash
./nginx/etc/nginx/conf.d/sites/
```

#### with redirect to Apache

Use theme.by.conf as template. Just copy and rename it to new 'domain.name.conf'.
Replace 'theme.by' in the new file with new domain.

#### if server should be served by Nginx

Use ng.conf as template.

### Add configuration for Apache (skip if server should be served by nginx)

Create new configuration file in

```bash
./apache/apache2/sites-enabled/
```

Use theme.by.conf as template. Just copy and rename it to new 'domain.name.conf'.
Replace 'theme.by' in the new file with new domain.

### Restart services

```bash
docker-compose up -d --force-recreate certbot
```

Wait a few minutes to let certbot issue new certificate

```bash
docker-compose up -d --force-recreate nginx
```

#### Restart Apache if the server is being served by it

```bash
docker-compose up -d --force-recreate apache
```
