# Railgun


## Running
Using docker-compose:

```yaml
version: '2'

services:
    railgun:
        image: xigen/railgun
        container_name: railgun
        restart: always
        mem_limit: 1024m
        environment:
         - RG_TOKEN=puttokenhere
        restart: always
        ports:
            - "2408:2408"
```
