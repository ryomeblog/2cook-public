/* 既存データベースがある場合は削除 */
DROP DATABASE IF EXISTS tocook;

/* データベース作成 */
CREATE DATABASE tocook;

/* データベース選択 */
¥c tocook;

/* 既存ユーザが存在する場合は削除 */
DROP ROLE IF EXISTS tocook;

/* ユーザ作成 */
CREATE ROLE tocook LOGIN PASSWORD 'g68AeeRty3zx';

/* データベース操作全ての権限を与える */
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO tocook;

/* テーブルが存在する場合は削除 */
DROP TABLE IF EXISTS common_mst;

DROP TABLE IF EXISTS routine_eat_tbl;

DROP TABLE IF EXISTS schedule_tbl;

DROP TABLE IF EXISTS cook_food_tbl;

DROP TABLE IF EXISTS food_mst;

DROP TABLE IF EXISTS cook_mst;

DROP TABLE IF EXISTS routine_mst;

DROP TABLE IF EXISTS cook_user_mst;

/* ユーザマスタ作成 */
CREATE TABLE cook_user_mst(
	user_id VARCHAR(12) NOT NULL,
	password VARCHAR NOT NULL,
	user_name VARCHAR(100) NOT NULL,
	secret_id VARCHAR(7) NOT NULL,
	secret_answer VARCHAR(200) NOT NULL,
	error_password SMALLINT,
	lock BOOLEAN,
	authority SMALLINT NOT NULL DEFAULT 0,
	update_datetime DATE NOT NULL DEFAULT CURRENT_TIMESTAMP,
	version SMALLINT NOT NULL DEFAULT 0,
	PRIMARY KEY(user_id)
);

/* 汎用マスタ作成 */
CREATE TABLE common_mst(
	common_id VARCHAR(7) NOT NULL,
	common_group VARCHAR(100) NOT NULL,
	common_name VARCHAR(200) NOT NULL,
	common_value1 VARCHAR(200),
	common_value2 VARCHAR(200),
	update_datetime DATE NOT NULL DEFAULT CURRENT_TIMESTAMP,
	version SMALLINT NOT NULL DEFAULT 0,
	PRIMARY KEY(common_id)
);

CREATE INDEX common_mst_common_group ON common_mst(common_group);

/* 食材テーブル作成 */
CREATE TABLE food_mst(
	food_id VARCHAR(12) NOT NULL,
	food_name VARCHAR(100) NOT NULL,
	food_unit VARCHAR(7) NOT NULL,
	others1 VARCHAR(100),
	others2 VARCHAR(100),
	others3 VARCHAR(100),
	others4 VARCHAR(100),
	others5 VARCHAR(100),
	user_id VARCHAR(12) NOT NULL,
	update_datetime DATE NOT NULL DEFAULT CURRENT_TIMESTAMP,
	version SMALLINT NOT NULL DEFAULT 0,
	PRIMARY KEY(food_id),
	FOREIGN KEY(user_id) REFERENCES cook_user_mst(user_id) ON DELETE CASCADE ON UPDATE CASCADE
);

/* 料理マスタ作成 */
CREATE TABLE cook_mst(
	cook_id VARCHAR(12) NOT NULL,
	cook_name VARCHAR(200) NOT NULL,
	cook_process VARCHAR(4000) NOT NULL,
	cook_price BIGINT NOT NULL DEFAULT 0,
	cook_movie VARCHAR(4000),
	cook_url VARCHAR(4000),
	cook_flg BOOLEAN NOT NULL,
	user_id VARCHAR(12) NOT NULL,
	update_datetime DATE NOT NULL DEFAULT CURRENT_TIMESTAMP,
	version SMALLINT NOT NULL DEFAULT 0,
	PRIMARY KEY(cook_id),
	FOREIGN KEY(user_id) REFERENCES cook_user_mst(user_id) ON DELETE CASCADE ON UPDATE CASCADE
);

/* 料理食材テーブル作成 */
CREATE TABLE cook_food_tbl(
	cook_food_id VARCHAR(12) NOT NULL,
	cook_id VARCHAR(12) NOT NULL,
	food_id VARCHAR(12) NOT NULL,
	unit_value BIGINT NOT NULL DEFAULT 0,
	user_id VARCHAR(12) NOT NULL,
	update_datetime DATE NOT NULL DEFAULT CURRENT_TIMESTAMP,
	version SMALLINT NOT NULL DEFAULT 0,
	PRIMARY KEY(cook_food_id),
	FOREIGN KEY(cook_id) REFERENCES cook_mst(cook_id) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY(food_id) REFERENCES food_mst(food_id) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY(user_id) REFERENCES cook_user_mst(user_id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE INDEX food_mst_cook_id ON cook_food_tbl(cook_id);

/* ルーティンマスタ作成 */
CREATE TABLE routine_mst(
	routine_id VARCHAR(15) NOT NULL,
	routine_name VARCHAR(200) NOT NULL,
	routine_maxday SMALLINT NOT NULL DEFAULT 0,
	user_id VARCHAR(12) NOT NULL,
	update_datetime DATE NOT NULL DEFAULT CURRENT_TIMESTAMP,
	version SMALLINT NOT NULL DEFAULT 0,
	PRIMARY KEY(routine_id),
	FOREIGN KEY(user_id) REFERENCES cook_user_mst(user_id) ON DELETE CASCADE ON UPDATE CASCADE
);

/* ルーティン食事テーブル作成 */
CREATE TABLE routine_eat_tbl(
	routine_eat_id VARCHAR(20) NOT NULL,
	routine_id VARCHAR(15) NOT NULL,
	cook_id VARCHAR(12) NOT NULL,
	routine_day SMALLINT NOT NULL,
	routine_time SMALLINT NOT NULL,
	user_id VARCHAR(12) NOT NULL,
	update_datetime DATE NOT NULL DEFAULT CURRENT_TIMESTAMP,
	version SMALLINT NOT NULL DEFAULT 0,
	PRIMARY KEY(routine_eat_id),
	FOREIGN KEY(user_id) REFERENCES cook_user_mst(user_id) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY(routine_id) REFERENCES routine_mst(routine_id) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY(cook_id) REFERENCES cook_mst(cook_id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE INDEX routine_eat_tbl_cook_id ON routine_eat_tbl(cook_id);

/* スケジュールテーブル作成 */
CREATE TABLE schedule_tbl(
	schedule_id VARCHAR(18) NOT NULL,
	schedule_date DATE NOT NULL,
	schedule_time SMALLINT NOT NULL,
	cook_id VARCHAR(12) NOT NULL,
	user_id VARCHAR(12) NOT NULL,
	update_datetime DATE NOT NULL DEFAULT CURRENT_TIMESTAMP,
	version SMALLINT NOT NULL DEFAULT 0,
	PRIMARY KEY(schedule_id),
	FOREIGN KEY(cook_id) REFERENCES cook_mst(cook_id) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY(user_id) REFERENCES cook_user_mst(user_id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE INDEX schedule_tbl_cook_id ON schedule_tbl(cook_id);

/* ユーザマスタコメント */
COMMENT ON TABLE cook_user_mst IS 'ユーザマスタ';

COMMENT ON COLUMN cook_user_mst.user_id IS 'ユーザID';

COMMENT ON COLUMN cook_user_mst.password IS 'パスワード';

COMMENT ON COLUMN cook_user_mst.user_name IS 'ユーザ名';

COMMENT ON COLUMN cook_user_mst.secret_id IS '秘密の質問ID';

COMMENT ON COLUMN cook_user_mst.secret_answer IS '秘密の答え';

COMMENT ON COLUMN cook_user_mst.error_password IS 'パスワード間違え回数';

COMMENT ON COLUMN cook_user_mst.lock IS 'アカウントロック';

COMMENT ON COLUMN cook_user_mst.authority IS '権限';

COMMENT ON COLUMN cook_user_mst.update_datetime IS '更新日時';

COMMENT ON COLUMN cook_user_mst.version IS 'バージョン';

/* 汎用マスタコメント */
COMMENT ON TABLE common_mst IS '汎用マスタ';

COMMENT ON COLUMN common_mst.common_id IS '汎用マスタID';

COMMENT ON COLUMN common_mst.common_group IS '汎用マスタグループ';

COMMENT ON COLUMN common_mst.common_name IS '汎用マスタ名';

COMMENT ON COLUMN common_mst.common_value1 IS '汎用マスタ値';

COMMENT ON COLUMN common_mst.common_value2 IS '汎用マスタ値';

COMMENT ON COLUMN common_mst.update_datetime IS '更新日時';

COMMENT ON COLUMN common_mst.version IS 'バージョン';

/* 食材マスタコメント */
COMMENT ON TABLE food_mst IS '食材マスタ';

COMMENT ON COLUMN food_mst.food_id IS '食材ID';

COMMENT ON COLUMN food_mst.food_name IS '食材名';

COMMENT ON COLUMN food_mst.food_unit IS '単位';

COMMENT ON COLUMN food_mst.others1 IS 'その他1';

COMMENT ON COLUMN food_mst.others2 IS 'その他2';

COMMENT ON COLUMN food_mst.others3 IS 'その他3';

COMMENT ON COLUMN food_mst.others4 IS 'その他4';

COMMENT ON COLUMN food_mst.others5 IS 'その他5';

COMMENT ON COLUMN food_mst.user_id IS 'ユーザID';

COMMENT ON COLUMN food_mst.update_datetime IS '更新日時';

COMMENT ON COLUMN food_mst.version IS 'バージョン';

/* 料理マスタ */
COMMENT ON TABLE cook_mst IS '料理マスタ';

COMMENT ON COLUMN cook_mst.cook_id IS '料理ID';

COMMENT ON COLUMN cook_mst.cook_name IS '料理名';

COMMENT ON COLUMN cook_mst.cook_process IS '手順';

COMMENT ON COLUMN cook_mst.cook_price IS '金額';

COMMENT ON COLUMN cook_mst.cook_movie IS '動画URL';

COMMENT ON COLUMN cook_mst.cook_url IS 'その他URL';

COMMENT ON COLUMN cook_mst.cook_flg IS '共有フラグ';

COMMENT ON COLUMN cook_mst.user_id IS 'ユーザID';

COMMENT ON COLUMN cook_mst.update_datetime IS '更新日時';

COMMENT ON COLUMN cook_mst.version IS 'バージョン';

/* 料理食材テーブル */
COMMENT ON TABLE cook_food_tbl IS '料理食材テーブル';

COMMENT ON COLUMN cook_food_tbl.cook_food_id IS '料理食材ID';

COMMENT ON COLUMN cook_food_tbl.cook_id IS '料理ID';

COMMENT ON COLUMN cook_food_tbl.food_id IS '食材ID';

COMMENT ON COLUMN cook_food_tbl.unit_value IS '単位値';

COMMENT ON COLUMN cook_food_tbl.user_id IS 'ユーザID';

COMMENT ON COLUMN cook_food_tbl.update_datetime IS '更新日時';

COMMENT ON COLUMN cook_food_tbl.version IS 'バージョン';

/* ルーティンマスタコメント */
COMMENT ON TABLE routine_mst IS 'ルーティンマスタ';

COMMENT ON COLUMN routine_mst.routine_id IS 'ルーティンID';

COMMENT ON COLUMN routine_mst.routine_name IS 'ルーティン名';

COMMENT ON COLUMN routine_mst.routine_maxday IS 'ルーティン最大日数';

COMMENT ON COLUMN routine_mst.user_id IS 'ユーザID';

COMMENT ON COLUMN routine_mst.update_datetime IS '更新日時';

COMMENT ON COLUMN routine_mst.version IS 'バージョン';

/* ルーティン食事テーブルコメント */
COMMENT ON TABLE routine_eat_tbl IS 'ルーティン食事テーブル';

COMMENT ON COLUMN routine_eat_tbl.routine_eat_id IS 'ルーティン食事ID';

COMMENT ON COLUMN routine_eat_tbl.routine_id IS 'ルーティンID';

COMMENT ON COLUMN routine_eat_tbl.cook_id IS '料理ID';

COMMENT ON COLUMN routine_eat_tbl.routine_day IS 'ルーティン日数';

COMMENT ON COLUMN routine_eat_tbl.routine_time IS 'ルーティン時間';

COMMENT ON COLUMN routine_eat_tbl.user_id IS 'ユーザID';

COMMENT ON COLUMN routine_eat_tbl.update_datetime IS '更新日時';

COMMENT ON COLUMN routine_eat_tbl.version IS 'バージョン';

/* スケジュールテーブルコメント */
COMMENT ON TABLE schedule_tbl IS 'スケジュールテーブル';

COMMENT ON COLUMN schedule_tbl.schedule_id IS 'スケジュールID';

COMMENT ON COLUMN schedule_tbl.schedule_date IS '日付';

COMMENT ON COLUMN schedule_tbl.schedule_time IS '時間';

COMMENT ON COLUMN schedule_tbl.cook_id IS '料理ID';

COMMENT ON COLUMN schedule_tbl.user_id IS 'ユーザID';

COMMENT ON COLUMN schedule_tbl.update_datetime IS '更新日時';

COMMENT ON COLUMN schedule_tbl.version IS 'バージョン';

INSERT INTO
	cook_user_mst(
		user_id,
		password,
		user_name,
		secret_id,
		secret_answer,
		error_password,
		lock,
		authority
	)
VALUES
	(
		'user00000001',
		'$2a$10$m5CzxWKChQWZd464NOHLueG.sgoEfMASNwRZ6pQmN.k2wkFpiAHaS',
		'test',
		'com0001',
		'$2a$10$m5CzxWKChQWZd464NOHLueG.sgoEfMASNwRZ6pQmN.k2wkFpiAHaS',
		'0',
		'FALSE',
		'0'
	);

INSERT INTO
	common_mst(
		common_id,
		common_group,
		common_name,
		common_value1,
		common_value2
	)
VALUES
	(
		'com0001',
		'secret_question',
		'秘密の質問',
		'好きな食べ物は？',
		'好きな食べ物は？'
	);

INSERT INTO
	common_mst(
		common_id,
		common_group,
		common_name,
		common_value1,
		common_value2
	)
VALUES
	(
		'com0002',
		'secret_question',
		'秘密の質問',
		'好きなアーティストは？',
		'好きなアーティストは？'
	);

INSERT INTO
	common_mst(
		common_id,
		common_group,
		common_name,
		common_value1,
		common_value2
	)
VALUES
	(
		'com0003',
		'secret_question',
		'秘密の質問',
		'昔、飼っていたペットの名前は？',
		'昔、飼っていたペットの名前は？'
	);

INSERT INTO
	common_mst(
		common_id,
		common_group,
		common_name,
		common_value1,
		common_value2
	)
VALUES
	(
		'com0100',
		'food_unit',
		'食材単位',
		'なし',
		'なし'
	);

INSERT INTO
	common_mst(
		common_id,
		common_group,
		common_name,
		common_value1,
		common_value2
	)
VALUES
	(
		'com0101',
		'food_unit',
		'食材単位',
		'適量',
		'適量'
	);

INSERT INTO
	common_mst(
		common_id,
		common_group,
		common_name,
		common_value1,
		common_value2
	)
VALUES
	(
		'com0102',
		'food_unit',
		'食材単位',
		'袋',
		'袋'
	);

INSERT INTO
	common_mst(
		common_id,
		common_group,
		common_name,
		common_value1,
		common_value2
	)
VALUES
	(
		'com0103',
		'food_unit',
		'食材単位',
		'個数',
		'個'
	);

INSERT INTO
	common_mst(
		common_id,
		common_group,
		common_name,
		common_value1,
		common_value2
	)
VALUES
	(
		'com0104',
		'food_unit',
		'食材単位',
		'本数',
		'本'
	);

INSERT INTO
	common_mst(
		common_id,
		common_group,
		common_name,
		common_value1,
		common_value2
	)
VALUES
	(
		'com0105',
		'food_unit',
		'食材単位',
		'g（グラム）',
		'g'
	);

INSERT INTO
	common_mst(
		common_id,
		common_group,
		common_name,
		common_value1,
		common_value2
	)
VALUES
	(
		'com0106',
		'food_unit',
		'食材単位',
		'cc',
		'cc'
	);

INSERT INTO
	common_mst(
		common_id,
		common_group,
		common_name,
		common_value1,
		common_value2
	)
VALUES
	(
		'com0107',
		'food_unit',
		'食材単位',
		'ml（ミリリットル）',
		'ml'
	);

INSERT INTO
	common_mst(
		common_id,
		common_group,
		common_name,
		common_value1,
		common_value2
	)
VALUES
	(
		'com0108',
		'food_unit',
		'食材単位',
		'L（リットル）',
		'L'
	);

INSERT INTO
	common_mst(
		common_id,
		common_group,
		common_name,
		common_value1,
		common_value2
	)
VALUES
	(
		'com0109',
		'food_unit',
		'食材単位',
		'大さじ',
		'大さじ'
	);

INSERT INTO
	common_mst(
		common_id,
		common_group,
		common_name,
		common_value1,
		common_value2
	)
VALUES
	(
		'com0110',
		'food_unit',
		'食材単位',
		'小さじ',
		'小さじ'
	);

INSERT INTO
	common_mst(
		common_id,
		common_group,
		common_name,
		common_value1,
		common_value2
	)
VALUES
	(
		'com0111',
		'food_unit',
		'食材単位',
		'コップ',
		'コップ'
	);

INSERT INTO
	common_mst(
		common_id,
		common_group,
		common_name,
		common_value1,
		common_value2
	)
VALUES
	(
		'com0112',
		'food_unit',
		'食材単位',
		'株',
		'株'
	);

INSERT INTO
	common_mst(
		common_id,
		common_group,
		common_name,
		common_value1,
		common_value2
	)
VALUES
	(
		'com0199',
		'food_unit',
		'食材単位',
		'その他',
		'その他'
	);
