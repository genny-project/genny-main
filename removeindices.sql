-- list all non-unique indexes
SELECT table_name AS `Table`,
       index_name AS `Index`,
       GROUP_CONCAT(column_name ORDER BY seq_in_index) AS `Columns`
FROM information_schema.statistics
WHERE NON_UNIQUE = 1 AND table_schema = 'genny' AND table_name = 'answer'
GROUP BY 1,2;

-- drop all non-unique indexes
SET SESSION group_concat_max_len=10240;

SELECT CONCAT('ALTER TABLE ', `Table`, ' DROP INDEX ', GROUP_CONCAT(`Index` SEPARATOR ', DROP INDEX '),';' )
FROM (
SELECT table_name AS `Table`,
       index_name AS `Index`
FROM information_schema.statistics
WHERE NON_UNIQUE = 1 AND table_schema = 'mydatabase' AND table_name = 'mytable'
GROUP BY `Table`, `Index`) AS tmp
GROUP BY `Table`;

-- add all non-unique indexes , WITHOUT index length spec
SET SESSION group_concat_max_len=10240;
SELECT CONCAT('ALTER TABLE ', `Table`, ' ADD INDEX ', GROUP_CONCAT(CONCAT(`Index`, '(', `Columns`, ')') SEPARATOR ',\n ADD INDEX ') )
FROM (
SELECT table_name AS `Table`,
       index_name AS `Index`,
        GROUP_CONCAT(column_name ORDER BY seq_in_index) AS `Columns`
FROM information_schema.statistics
WHERE NON_UNIQUE = 1 AND table_schema = 'mydatabase' AND table_name = 'mytable'
GROUP BY `Table`, `Index`) AS tmp
GROUP BY `Table`;

