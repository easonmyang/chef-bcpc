name             'role-bcpc-node-head'
maintainer       'Bloomberg Finance L.P.'
maintainer_email 'bcpc@bloomberg.net'
license          'Apache 2.0'
description      'Installs/Configures role-bcpc-node-head'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '6.0.0'

depends          'role-bcpc-common',        '>= 6.0.0'
depends          'role-bcpc-node-common',   '>= 6.0.0'
depends          'bcpc-ceph',               '>= 6.0.0'
depends          'bcpc-health-check',       '>= 6.0.0'
depends          'bcpc-mysql',              '>= 6.0.0'
depends          'bcpc-powerdns',           '>= 6.0.0'
depends          'bcpc-rabbitmq',           '>= 6.0.0'
depends          'bcpc-memcached',          '>= 6.0.0'
depends          'bcpc-haproxy',            '>= 6.0.0'
depends          'bcpc-keepalived',         '>= 6.0.0'
depends          'bcpc-apache',             '>= 6.0.0'
depends          'bcpc-openstack-common',   '>= 6.0.0'
depends          'bcpc-openstack-keystone', '>= 6.0.0'
depends          'bcpc-openstack-glance',   '>= 6.0.0'
depends          'bcpc-openstack-cinder',   '>= 6.0.0'
depends          'bcpc-openstack-nova',     '>= 6.0.0'
depends          'bcpc-openstack-heat',     '>= 6.0.0'
depends          'bcpc-openstack-horizon',  '>= 6.0.0'
depends          'bcpc-openstack-rally',    '>= 6.0.0'
