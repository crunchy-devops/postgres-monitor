SELECT COUNT(*) AS active_connections
FROM pg_stat_activity
WHERE state = 'active';
