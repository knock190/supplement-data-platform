-- =========================================================
-- 取込の確認（ステップ1）
-- Fivetranが入れたRAWの表を、dbtと同じTRANSFORMERロールで読めるか確かめる
-- =========================================================
USE ROLE TRANSFORMER;
USE SECONDARY ROLES NONE;
USE WAREHOUSE TRANSFORMING_WH;

SHOW TABLES IN SCHEMA RAW.GOOGLE_SHEETS;

SELECT * FROM RAW.GOOGLE_SHEETS.SUPPLEMENT_MASTER;
SELECT * FROM RAW.GOOGLE_SHEETS.SUPPLEMENT_LOG;   -- logの接続を作ったら、先頭の -- を消す
