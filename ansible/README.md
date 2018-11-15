Ansible
===

Simple Ansible container : due to the limitation to forward ssh agent between containers and Docker-for-Mac, 
this container start a user-agent on this container.

## How to use
### Environment variables

* RSA_KEYS : absolute paths colon separated. Each ones will be ss-add(ed).

```dockerfile
ENV RSA_KEYS /root/.ssh/id_rsa:/root/.ssh/id_rsa2:/root/.ssh/id_rsa3
```  

### In a docker-compose

You've got a project like that : 

```
.
├── Makefile
├── README.md
├── app1
├── app2
├── ansistrano
└── docker-compose.yml
```
 
 
In the docker-compose.yml :

```yaml
services:
  ansible:
    image: eheuje/ansible:2.7
    working_dir: /apps/ansistrano
    environment:
      RSA_KEYS: |
        /root/.ssh/foo_id_rsa:
        /root/.ssh/bar_id_rsa:
        /root/.ssh/foobar_rsa
    volumes:
      - ./:/apps
      - ~/.ssh:/root/.ssh:ro
```

Then :

```shell
$ docker-compose run --rm ansible ansible-playbook -i hosts deploy.yml
``` 