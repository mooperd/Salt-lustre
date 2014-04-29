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
    {% if grains['nodename'] == 'mds01.cumberbatch.com' %}
    - ipaddr: 192.168.0.201
    {% elif grains['nodename'] == 'mds02.cumberbatch.com' %}
    - ipaddr: 192.168.0.202
    {% endif %}
    - netmask: 255.255.255.0
    - dns:
      - 192.168.0.150
eth1:
  network.managed:
    - enabled: True
    - type: eth
    - proto: none
    {% if grains['nodename'] == 'mds01.cumberbatch.com' %}
    - ipaddr: 10.51.0.201
    {% elif grains['nodename'] == 'mds02.cumberbatch.com' %}
    - ipaddr: 10.51.0.202
    {% endif %}
    - netmask: 255.255.255.0

eth2:
  network.managed:
    - enabled: True
    - type: eth
    - proto: none

network:
  service:
    - running
    - reload: True
