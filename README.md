1. Khái niệm
- Inventory: Nơi chứa các cấu hình cài đặt của các agent node (default location /etc/ansible/host)
```inventory
# For example /etc/ansible/hosts
# Alias for each server
web     ansible_host=server1.company.com ansible_connection=ssh     ansible_user=root   ansible_ssh_pass=123@
db      ansible_host=server2.company.com ansible_connection=winrm   ansible_user=admin  ansible_password=22@#
mail    ansible_host=server3.company.com ansible_connection=ssh     ansible_user=abc    ansible_ssh_pass=asd!

localhost ansible_connection=localhost
```

- Inventory Parameters:
    + ansible_connection - ssh/wirnm/localhost
    + ansible_port - 22/5986
    + ansible_user - root/adminstrator
    + ansible_ssh_pass - Password

- Security: Ansible Vault
- Grouping and Parent-Child Relationships
```
# 1. Using INI configure file
[webserver:children]
webservers_us
webservers_eu

[webservers_us]
server1_us.com ansible_host=192.168.1.1
server2_us.com ansible_host=192.168.1.2
[webservers_eu]
server1_eu.com ansible_host=192.168.1.1
server2_eu.com ansible_host=192.168.1.2

# 2. Using yaml file
all:
  children:
    webservers:
      children:
        webservers_us:
          hosts:
            server1:
              ansible_host: 192.168.1.1
            server2:
              ansible_host: 192.168.1.2
        webservers_eu:
          hosts:
            server1:
              ansible_host: 192.168.1.1
            server2:
              ansible_host: 192.168.1.2    
```
- Ansible Variables: Stores infomation that varies with each host
```inventory
web     ansible_host=server1.company.com ansible_connection=ssh     ansible_user=root   ansible_ssh_pass=123@
db      ansible_host=server2.company.com ansible_connection=winrm   ansible_user=admin  ansible_ssh_pass=22@#
mail    ansible_host=server3.company.com ansible_connection=ssh     ansible_user=abc    ansible_ssh_pass=asd!
```

```Playbook.yaml
-
  name: Add DNS server to resolv.conf
  hosts: localhost
    vars:
      dns_server: 10.2.4.5

    tasks:
      - lineinfile:
          path: /etc/resolve.conf
          line: 'nameserver {{ dns_server }}'
```

```variables
variable1: value
variable2: value
```

- Variables Type:
    + String
    + Number
    + Boolean <true/false>
    + Dictionary