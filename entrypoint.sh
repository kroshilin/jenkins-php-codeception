#!/usr/bin/env bash

sudo ntpd -gq
sudo service ntp start
/usr/local/bin/jenkins.sh