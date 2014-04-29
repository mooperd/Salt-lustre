/etc/modprobe.d/lustre.conf:
  file:                   # state declaration
    - managed             # function
    - source: salt://lustre/lustre.conf
    - user: root
    - group: root
    - mode: 644

/etc/nsswitch.conf:
  file:                   # state declaration
    - managed             # function
    - source: salt://lustre/nsswitch.conf
    - user: root
    - group: root
    - mode: 644

/etc/sssd/sssd.conf:
  file:                   # state declaration
    - managed             # function
    - template: jinja
    - source: salt://lustre/sssd.conf
    - user: root
    - group: root
    - mode: 600

/root/.ssh:
  file.recurse:
    - source: salt://lustre/.ssh
    - include_empty: True
    - dir_mode: 0700
    - file_mode: 0700

iptables:
  service:
    - dead
    - enable: False

ipa-client:
  pkg.installed:
    - pkgs:
      - ipa-client
      - libsss_sudo

ipa-client-install -p admin -w X9deiX9dei -U:
  cmd.run
