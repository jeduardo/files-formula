{# First we go to all functions we want to apply #}
{%- for function, managed in salt['pillar.get']('files', {}).items() %}
{# Then we get all items to be managed with this function #}
{%- for name, args in managed.items() %}
files-{{ name }}-{{ function }}:
  file.{{ function }}:
{%- for prop, value in managed.items() %}
    - {{ prop }}: {{ value }}
{%- endfor %}
{%- endfor %}
{%- endfor %}
