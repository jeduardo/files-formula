{# First we go to all functions we want to apply #}
{%- for function, managed in salt['pillar.get']('files', {}).items() %}
{# Then we get all items to be managed with this function #}
{%- for name, args in managed.items() %}
files-{{ name }}-{{ function }}:
  file.{{ function }}:
    {%- do args.update({'name': name}) %}
    {%- for arg, value in args.items() %}
    {# Contents are sometimes indented and need to be multiline #}
    {%- if arg in ['content', 'contents'] %}
    - {{ arg }}: |
        {{ value | indent(8) }}
    {# Markers need to be forced into a single string #}
    {%- elif 'marker' in arg %}
    - {{ arg }}: "{{ value }}"
    {%- else %}
    - {{ arg }}: {{ value }}
    {%- endif %}
    {%- endfor %}
{%- endfor %}
{%- endfor %}
