all:
   hosts:
     ubuntu:
       ${host}
       ansible_user: ubuntu
       ansible_ssh_private_key_file: /home/denis/Downloads/ssh_connect.pem