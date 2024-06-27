SELECT datname, pid, usename, application_name, client_addr, state, query, state_change
FROM pg_stat_activity
WHERE state = 'active';
