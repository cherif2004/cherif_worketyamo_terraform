FROM marwaney/ssh-server

COPY  ./.ssh/cherif.pub ~/.ssh/authorized_keys
