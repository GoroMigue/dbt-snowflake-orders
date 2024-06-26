{% macro money_converter(amount, exchange_rate) -%}
    round( {{ amount }} * {{ exchange_rate }}, 2 )
{%- endmacro -%}