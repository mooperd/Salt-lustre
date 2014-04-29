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
    {% if grains['nodename'] == 'client01.cumberbatch.com' %}
    - ipaddr: 192.168.0.131
    {% elif grains['nodename'] == 'client02.cumberbatch.com' %}
    - ipaddr: 192.168.0.132
    {% elif grains['nodename'] == 'client03.cumberbatch.com' %}
    - ipaddr: 192.168.0.133
    {% elif grains['nodename'] == 'client04.cumberbatch.com' %}
    - ipaddr: 192.168.0.134
    {% endif %}
    - netmask: 255.255.255.0
    - dns:
      - 192.168.0.150
eth1:
  network.managed:
    - enabled: True
    - type: eth
    - proto: none
    {% if grains['nodename'] == 'client01.cumberbatch.com' %}
    - ipaddr: 10.51.0.131
    {% elif grains['nodename'] == 'client02.cumberbatch.com' %}
    - ipaddr: 10.51.0.132
    {% elif grains['nodename'] == 'client03.cumberbatch.com' %}
    - ipaddr: 10.51.0.133
    {% elif grains['nodename'] == 'client04.cumberbatch.com' %}
    - ipaddr: 10.51.0.134
    {% endif %}
    - netmask: 255.255.255.0
network:
  service:
    - running
    - reload: True

mypkgs:
  pkg.installed:
    - sources:
      - lustre-client-modules: salt://hadoop/x86_64/lustre-client-modules-2.4.3-2.6.32_431.5.1.el6.x86_64.x86_64.rpm
      - lustre-client: salt://hadoop/x86_64/lustre-client-2.4.3-2.6.32_431.5.1.el6.x86_64.x86_64.rpm 
