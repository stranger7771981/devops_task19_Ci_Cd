all:
   hosts:
     ubuntu:
       ${host}
       ansible_user: ubuntu
       ansible_ssh_private_key_file: ${{ secrets.SSH_PRIVATE_KEY }}
