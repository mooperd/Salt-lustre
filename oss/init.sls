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
    {% if grains['nodename'] == 'oss01.cumberbatch.com' %}
    - ipaddr: 192.168.0.141
    {% elif grains['nodename'] == 'oss02.cumberbatch.com' %}
    - ipaddr: 192.168.0.142
    {% elif grains['nodename'] == 'oss03.cumberbatch.com' %}
    - ipaddr: 192.168.0.143
    {% elif grains['nodename'] == 'oss04.cumberbatch.com' %}
    - ipaddr: 192.168.0.144
    {% endif %}
    - netmask: 255.255.255.0
    - dns:
      - 192.168.0.150
eth1:
  network.managed:
    - enabled: True
    - type: eth
    - proto: none
    {% if grains['nodename'] == 'oss01.cumberbatch.com' %}
    - ipaddr: 10.51.0.141
    {% elif grains['nodename'] == 'oss02.cumberbatch.com' %}
    - ipaddr: 10.51.0.142
    {% elif grains['nodename'] == 'oss03.cumberbatch.com' %}
    - ipaddr: 10.51.0.143
    {% elif grains['nodename'] == 'oss04.cumberbatch.com' %}
    - ipaddr: 10.51.0.144
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
