{% from "tftpd/map.jinja" import tftpd, tftpd_settings with context %}

include:
  - tftpd

{% if tftpd.service_config is defined %}

service_config:
  file.managed:
    - name: {{ tftpd.service_config }}
    - source: {{ 'salt://tftpd/files/service_config.' ~ salt['grains.get']('os_family') }}
    - makedirs: True
    - template: jinja
    - user: root
{% if 'BSD' in salt['grains.get']('os') %}
    - group: wheel
{% else %}
    - group: root
{% endif %}
    - mode: 644
    - watch_in:
      - service: tftpd

{% endif %}
