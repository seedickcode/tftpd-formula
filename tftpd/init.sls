{% from "tftpd/map.jinja" import tftpd with context %}

tftpd:
  pkg.installed:
    - name: {{ tftpd.server }}
  service.running:
    - name: {{ tftpd.service }}
    - enable: True
    - require:
      - pkg: tftpd
