{% macro money_converter(column_name, badge_rate) -%}
    round( {{ column_name }} * {{ badge_rate }}, 2 )
{%- endmacro -%}