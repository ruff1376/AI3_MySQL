-- Active: 1745889701130@@127.0.0.1@3306@aloha
-- employees : 사원
USE aloha;
DROP TABLE IF EXISTS employees;
CREATE TABLE employees (
    emp_no          INT         PRIMARY KEY COMMENT '사원 번호',
    dept_no         INT                     COMMENT '부서 번호',
    name            VARCHAR(50)             COMMENT '사원 이름',
    salary          INT                     COMMENT '급여',
    commission_pct  DECIMAL(5,2)            COMMENT '커미션 비율',
    bonus           INT                     COMMENT '성과금'
) COMMENT '사원';

-- 사원 테이터 추가
INSERT INTO employees (emp_no, dept_no, name, salary, commission_pct, bonus)
VALUES 
    (1001, 101, '정국', 3300000, 0.8, 2400000),
    (1002, 102, '뷔', 2500000, 0.1, NULL),
    (1003, 103, '지민', 3200000, NULL, NULL),
    (1004, 104, '리사', 4100000, 0.2, NULL),
    (1005, 101, '제니', 5400000, NULL, NULL),
    (1006, 102, '카리나', 2200000, NULL, 1000000),
    (1007, 103, '장원영', 3500000, 0.4, 1400000),
    (1008, 104, '안유진', 4200000, 0.5, 300000),
    (1009, 101, '태용', 6400000, NULL, 500000),
    (1010, 102, '이병헌', 1200000, 0.4, 200000),
    (1011, 103, '송강호', 2700000, 0.1, 100000),
    (1012, 104, '전도연', 3800000, 0.1, 400000),
    (1013, 101, '김태리', 4300000, 0.3, 900000),
    (1014, 102, '박서준', 5100000, 0.2, 200000);