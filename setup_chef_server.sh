#!/bin/bash

#
# This script expects to be run in the chef-bcpc directory
#

set -e

if [[ -f ./proxy_setup.sh ]]; then
  . ./proxy_setup.sh
fi

# needed within build_bins which we call
if [[ -z "$CURL" ]]; then
	echo "CURL is not defined"
	exit
fi

if dpkg -s chef 2>/dev/null | grep -q Status.*installed; then
  echo chef is installed
else
  dpkg -i cookbooks/bcpc/files/default/bins/chef-client.deb
fi

if dpkg -s chef-server 2>/dev/null | grep -q Status.*installed; then
  echo chef-server is installed
else
  dpkg -i cookbooks/bcpc/files/default/bins/chef-server.deb
  if [ ! -f /etc/chef-server/chef-server.rb ]; then
    if [ ! -d /etc/chef-server ]; then
      mkdir /etc/chef-server
      chown 775 /etc/chef-server
    fi
    cat > /etc/chef-server/chef-server.rb <<EOF
# have nginx listen on port 4000
nginx['non_ssl_port'] = 4000
# allow long-running recipes not to die with an error due to auth
erchef['s3_url_ttl'] = 3600
EOF
  fi
  sudo chef-server-ctl reconfigure
fi

chmod +r /etc/chef-server/admin.pem
chmod +r /etc/chef-server/chef-validator.pem
chmod +r /etc/chef-server/chef-webui.pem

# copy our ssh-key to be authorized for root
if [[ -f $HOME/.ssh/authorized_keys && ! -f /root/.ssh/authorized_keys ]]; then
  if [[ ! -d /root/.ssh ]]; then
    mkdir /root/.ssh
  fi
  cp $HOME/.ssh/authorized_keys /root/.ssh/authorized_keys
fi
