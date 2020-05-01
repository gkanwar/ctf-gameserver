#!/bin/bash
# Install script for generic linux

sudo python3 setup.py install --prefix=/usr

sudo cp conf/checker/checkermaster.env /etc/ctf-gameserver
sudo cp conf/checker/ctf-checkermaster@.service /lib/systemd/system

sudo cp conf/controller/controller.env /etc/ctf-gameserver
sudo cp conf/controller/flagid.env /etc/ctf-gameserver
sudo cp conf/controller/ctf-controller.service /lib/systemd/system
sudo cp conf/controller/ctf-flagid.service /lib/systemd/system
sudo cp conf/controller/ctf-flagid.timer /lib/systemd/system

sudo cp conf/submission/submission.env /etc/ctf-gameserver
sudo cp conf/submission/ctf-submission@.service /lib/systemd/system

sudo cp conf/web/prod_settings.py /etc/ctf-gameserver/web

# Fix perms on sensitive env files
sudo chmod 0600 /etc/ctf-gameserver/*.env

if test -x /bin/systemctl; then
    sudo systemctl daemon-reload
fi

