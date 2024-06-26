{% macro delivery_time(commitdate,receiptdate) %}
    case
        when datediff(day, {{ receiptdate }}, {{ commitdate }}) > 10 then 0
        when datediff(day, {{ receiptdate }}, {{ commitdate }}) <= 0 then 1
        else 2
    end
{% endmacro %}