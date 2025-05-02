-- Active: 1745889701130@@127.0.0.1@3306@employees
-- INDEX 생성 전 성능 확인
SET PROFILING = 1;

SELECT NOW(6);
-- 쿼리
SELECT *
FROM employees
WHERE last_name = 'Baba'
    AND gender = 'M'
;
SELECT NOW(6);

/*
2025-05-02 10:57:22.375750
2025-05-02 10:57:22.510279
*/
/*
2025-05-02 11:02:53.680270
2025-05-02 11:02:53.733321
*/


-- 인덱스 생성
CREATE INDEX index_lastname_gender ON employees (last_name, gender);
DROP INDEX index_lastname_gender ON employees;

EXPLAIN
SELECT * FROM employees WHERE last_name = 'Smith' AND gender = 'M';

-- 인덱스 삭제
DROP INDEX index_lastname_gender ON employees;

-- 프로파일 확인
SHOW PROFILE FOR QUERY 1;

SELECT *
FROM performance_schema.events_stages_history
;