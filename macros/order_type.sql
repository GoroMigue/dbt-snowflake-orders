{% macro order_type(column_name) -%}
    case
        when {{ column_name }} like 'R' then 'RETURN'
        else 'PURCHASE'
    end
{%- endmacro -%}