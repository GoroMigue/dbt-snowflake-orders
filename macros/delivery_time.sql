{% macro delivery_time(commitdate,receiptdate) %}
    case
        when datediff(day, {{ receiptdate }}, {{ commitdate }}) > 30 then 0
        when datediff(day, {{ receiptdate }}, {{ commitdate }}) <= 0 then 1
        when datediff(day, {{ receiptdate }}, {{ commitdate }}) <= 10 then 2
        else 3
    end
{% endmacro %}