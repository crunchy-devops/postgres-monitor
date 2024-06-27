SELECT query, rows, total_time
FROM pg_stat_statements
ORDER BY rows DESC
LIMIT 10;
