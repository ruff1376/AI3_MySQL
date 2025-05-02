-- 테이블 생성
/*
    CREATE TABLE 데이터베이스.테이블명 (
        컬럼1   데이터타입  [NULL/NOT NULL] [DEFAULT 기본값]   [PRIMARY KEY | UNIQUE] (COMMENT '컬럼설명'),
        컬럼2   데이터타입  [NULL/NOT NULL] [DEFAULT 기본값]   [PRIMARY KEY | UNIQUE] (COMMENT '컬럼설명'),
        컬럼3   데이터타입  [NULL/NOT NULL] [DEFAULT 기본값]   [PRIMARY KEY | UNIQUE] (COMMENT '컬럼설명')
    ) COMMENT '테이블설명' ;
*/

-- 공통 테이블 생성
CREATE TABLE common (
    no          BIGINT          AUTO_INCREMENT  PRIMARY KEY         COMMENT 'PK',
    id          VARCHAR(64)     UNIQUE                              COMMENT 'UK',
    name        VARCHAR(100)    NOT NULL                            COMMENT '이름',
    value       INT             NOT NULL DEFAULT 0                  COMMENT '값',
    created_at  TIMESTAMP       NOT NULL DEFAULT CURRENT_TIMESTAMP  COMMENT '등록일자',
    updated_at  TIMESTAMP       NOT NULL DEFAULT CURRENT_TIMESTAMP
                                            ON UPDATE CURRENT_TIMESTAMP
                                            COMMENT '등록일자'
);

INSERT INTO common (id, name, value)
VALUES (UUID(), '이름', 10);
SELECT * FROM common_backup;

-- 기존 테이블을 복사하여 생성 (백업 테이블 생성)
DROP TABLE IF EXISTS common_backup;
CREATE TABLE common_backup
AS SELECT * FROM common;

-- 기존 테이블을 일부 데이터만 복사하여 생성
CREATE TABLE common_backup_value
AS SELECT name, value
FROM common;

SELECT * FROM common_backup_value;

-- 테이블 수정
-- 컬럼 추가
ALTER TABLE common_backup_value ADD COLUMN no BIGINT AUTO_INCREMENT PRIMARY KEY;
-- 컬럼 수정
ALTER TABLE common_backup_value MODIFY COLUMN value BIGINT;
-- 컬럼 삭제
ALTER TABLE common_backup_value DROP COLUMN value;

DESC common_backup_value;

SELECT * FROM common_backup_value;

-- 테이블 삭제
TRUNCATE TABLE common_backup_value;

DROP TABLE common_backup_value;