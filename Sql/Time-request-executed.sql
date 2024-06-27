SELECT pid, age(clock_timestamp(), query_start) AS duration, query
FROM pg_stat_activity
WHERE state != 'idle'
ORDER BY duration DESC;
