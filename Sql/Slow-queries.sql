#log_min_duration_statement = 1000  # Log toutes les requêtes qui prennent plus de 1000 ms (1 seconde)
SELECT
    datname,
    temp_files,
    temp_bytes,
    blk_read_time,
    blk_write_time
FROM
    pg_stat_database;
