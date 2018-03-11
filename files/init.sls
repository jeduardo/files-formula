{# First we go to all functions we want to apply #}
{%- for function, managed in salt['pillar.get']('files', {}).items() %}
{# Then we get all items to be managed with this function #}
{%- for name, args in managed.items() %}
files-{{ name }}-{{ function }}:
  file.{{ function }}:
    - name: {{ name }}
{%- for prop, value in args %}
    - {{ prop }}: {{ value }}
{%- endfor %}
{%- endfor %}
{%- endfor %}
