USE aloha;
CREATE TABLE `departments` (
    `dept_no` INT PRIMARY KEY COMMENT '부서번호',
    `dept_name` VARCHAR(45) COMMENT '부서명'
);

TRUNCATE TABLE departments;
INSERT INTO departments(dept_no, dept_name)
VALUES
    (101, '인사팀'),
    (102, '회계팀'),
    (103, '개발팀'),
    (104, NULL)
;