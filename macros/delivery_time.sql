{% macro delivery_time(commitdate,receiptdate) %}
    case
        when datediff(day, {{ commitdate }}, {{ receiptdate }}) > 30 then 0
        when datediff(day, {{ commitdate }}, {{ receiptdate }}) <= 0 then 1
        when datediff(day, {{ commitdate }}, {{ receiptdate }}) <= 10 then 2
        else 3
    end
{% endmacro %}