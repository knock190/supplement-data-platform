-- =========================================================
-- Fivetran用のユーザー（ステップ1-2）
-- 鍵（キーペア）でログインするSERVICEユーザー。パスワードは持たない
--
-- 実行するときは <公開鍵> を、rsa_key.pub の中身を1行にしたものに置き換える
-- （リポジトリには置き換える前のこの形で置く）
-- 秘密鍵 rsa_key.p8 は、Fivetranの設定画面にだけ貼る
-- =========================================================
USE ROLE SECURITYADMIN;

CREATE USER IF NOT EXISTS FIVETRAN_USER
  TYPE = SERVICE
  DEFAULT_ROLE = LOADER
  DEFAULT_WAREHOUSE = LOADING_WH
  COMMENT = 'Fivetran用（RAWへの取込）';

GRANT ROLE LOADER TO USER FIVETRAN_USER;

-- 公開鍵の登録
ALTER USER FIVETRAN_USER SET RSA_PUBLIC_KEY = '<公開鍵>';

-- 確認：TYPE が SERVICE、DEFAULT_ROLE が LOADER、
--       RSA_PUBLIC_KEY_FP が「SHA256:」で始まる値になっていればOK
DESC USER FIVETRAN_USER;
