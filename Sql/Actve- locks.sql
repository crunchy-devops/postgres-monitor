SELECT
    t.relname AS table_name,
    l.locktype,
    l.mode,
    l.granted,
    a.usename AS user_name,
    a.query AS query_snippet,
    age(now(), a.query_start) AS age
FROM pg_locks l
JOIN pg_stat_all_tables t ON l.relation = t.relid
JOIN pg_stat_activity a ON l.pid = a.pid
ORDER BY l.relation ASC;
