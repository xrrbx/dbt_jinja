-- Snowflake version:
-- {% macro grant_select( schema=target.schema, role=target.role, database=target.database ) %}
--     {% set sql %}
--         grant usage on schema {{ schema }} to role {{ role }};
--         grant select on all tables in schema {{ schema }} to role {{ role }};
--         grant select on all views in schema {{ schema }} to role {{ role }}
--     {% endset %}

--     {{ log ('Granting select on schema ' ~ schema ~ ' to role ' ~ role, info=True) }}
--     {% do run_query(sql) %}
--     {{ log ('Finished granting select on schema ' ~ schema ~ ' to role ' ~ role, info=True) }}
-- {% endmacro %}

-- BQ version:
{% macro grant_select(schema=target.dataset, role="roles/bigquery.dataViewer", database=target.project) %}
    
    {# BigQuery uses standard IAM policy statements instead of 'grant usage' #}
    {% set sql %}
        GRANT `{{ role }}`
        ON SCHEMA `{{ database }}.{{ schema }}`
        TO "user:renzo.rivera@gmail.com"; -- Replace with your service account or GCP email if needed
    {% endset %}

    {{ log ('Granting BigQuery access on schema ' ~ schema, info=True) }}
    
    {# Only execute this during an actual dbt run, not during compilation #}
    {% if execute %}
        {% do run_query(sql) %}
    {% endif %}
    
    {{ log ('Finished granting access on schema ' ~ schema, info=True) }}
{% endmacro %}