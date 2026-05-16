# OpenRA Docker

**compose.yml**

```yml
services:
  openra:
     build: .
     restart: unless-stopped
     ports:
       - "1234:1234"
     environment:
       MOD: ra
       SERVER_NAME: "Example server name"
       PORT: 1234
```
