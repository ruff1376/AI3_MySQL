-- * MySQL에서는 SEQUENCE 직접 지원 안됨
-- * AUTO_INCREMENT로 간접적으로 사용
-- * MariaDB 10.3 버전부터 SEQUENCE 적용됨

CREATE TABLE test (
    no BIGINT AUTO_INCREMENT PRIMARY KEY;
);

-- 간접적으로 시퀀스 사용
CREATE TABLE student (
    stu_no BIGINT PRIMARY KEY,
    NAME VARCHAR(100) NOT NULL
);
CREATE TABLE seq_stuno (
    no BIGINT PRIMARY KEY
);

-- 시퀀스 증가
INSERT INTO seq_stuno VALUES (1);
-- 다음 시퀀스 증가
UPDATE seq_stuno SET no = no + 1;
SELECT no FROM seq_stuno;
SELECT LAST_INSERT_ID();