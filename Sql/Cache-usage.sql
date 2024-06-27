SELECT
    sum(blks_hit) / (sum(blks_hit) + sum(blks_read)) AS hit_ratio
FROM
    pg_stat_database;
