DROP TABLE IF EXISTS answerlinks;
DROP TABLE IF EXISTS context;
DROP PROCEDURE IF EXISTS drop_constraint;
DELIMITER //
CREATE PROCEDURE drop_constraint(tbl_name VARCHAR(64), constraint_name VARCHAR(64))
BEGIN
    DECLARE stmt VARCHAR(1024);
    SET @sql := CONCAT('ALTER TABLE ', tbl_name, ' DROP CONSTRAINT ', constraint_name);
    PREPARE stmt FROM @sql;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;
END//
DELIMITER ;
SELECT CONSTRAINT_NAME into @bea_constraint_name FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE WHERE REFERENCED_TABLE_SCHEMA = 'gennydb' AND REFERENCED_TABLE_NAME = 'baseentity' AND TABLE_NAME='baseentity_attribute';
CALL drop_constraint('baseentity_attribute', @bea_constraint_name);
SELECT CONSTRAINT_NAME into @beb_constraint_name FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE WHERE REFERENCED_TABLE_SCHEMA = 'gennydb' AND REFERENCED_TABLE_NAME = 'baseentity' AND TABLE_NAME='baseentity_baseentity';
CALL drop_constraint('baseentity_baseentity', @beb_constraint_name);
ALTER TABLE baseentity MODIFY COLUMN id BIGINT AUTO_INCREMENT;
ALTER TABLE baseentity DROP CONSTRAINT unique_id;
ALTER TABLE baseentity ADD CONSTRAINT unique_id UNIQUE(id);
DROP PROCEDURE IF EXISTS add_constraint;
DELIMITER //
CREATE PROCEDURE add_constraint(tbl_name VARCHAR(64), constraint_name VARCHAR(64), col_name VARCHAR(64))
BEGIN
    DECLARE stmt VARCHAR(1024);
    SET @sql := CONCAT('ALTER TABLE ', tbl_name, ' ADD CONSTRAINT ', constraint_name, ' FOREIGN KEY (', col_name, ') REFERENCES baseentity(id)');
    PREPARE stmt FROM @sql;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;
END//
DELIMITER ;
CALL add_constraint('baseentity_attribute', @bea_constraint_name, 'baseentity_id');
CALL add_constraint('baseentity_baseentity', @beb_constraint_name, 'source_id');
DROP PROCEDURE IF EXISTS add_constraint;
ALTER TABLE baseentity DROP PRIMARY KEY;
ALTER TABLE baseentity ADD CONSTRAINT pri_key PRIMARY KEY (realm,code);
