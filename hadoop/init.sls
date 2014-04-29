system:
    network.system:
      - enabled: True
      - gateway: 192.168.0.1
      - gatewaydev: eth0
eth0:
  network.managed:
    - enabled: True
    - type: eth
    - proto: none
    {% if grains['nodename'] == 'hadoop01.cumberbatch.com' %}
    - ipaddr: 192.168.0.171
    {% elif grains['nodename'] == 'hadoop02.cumberbatch.com' %}
    - ipaddr: 192.168.0.172
    {% elif grains['nodename'] == 'hadoop03.cumberbatch.com' %}
    - ipaddr: 192.168.0.173
    {% elif grains['nodename'] == 'hadoop04.cumberbatch.com' %}
    - ipaddr: 192.168.0.174
    {% endif %}
    - netmask: 255.255.255.0
    - dns:
      - 192.168.0.150
eth1:
  network.managed:
    - enabled: True
    - type: eth
    - proto: none
    {% if grains['nodename'] == 'hadoop01.cumberbatch.com' %}
    - ipaddr: 10.51.0.171
    {% elif grains['nodename'] == 'hadoop02.cumberbatch.com' %}
    - ipaddr: 10.51.0.172
    {% elif grains['nodename'] == 'hadoop03.cumberbatch.com' %}
    - ipaddr: 10.51.0.173
    {% elif grains['nodename'] == 'hadoop04.cumberbatch.com' %}
    - ipaddr: 10.51.0.174
    {% endif %}
    - netmask: 255.255.255.0
network:
  service:
    - running
    - reload: True

/mnt/gandalf:
  file.directory:
    - mode: 777
    - makedirs: True

mypkgs:
  pkg.installed:
    - sources:
      - lustre-client-modules: salt://hadoop/x86_64/lustre-client-modules-2.4.3-2.6.32_431.5.1.el6.x86_64.x86_64.rpm
      - lustre-client: salt://hadoop/x86_64/lustre-client-2.4.3-2.6.32_431.5.1.el6.x86_64.x86_64.rpm
