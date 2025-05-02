-- 기존 employees 테이블에 파티션 적용
-- 1. 백업 또는 이름 변경
-- 2. 파티션 테이블 생성
-- 3. 데이터 이관

-- 1. 테이블 이름 변경
RENAME TABLE employees TO employees_backup;

-- 2. 파티션 테이블 생성
CREATE TABLE `employees` (
  `emp_no` int NOT NULL,
  `birth_date` date NOT NULL,
  `first_name` varchar(14) NOT NULL,
  `last_name` varchar(16) NOT NULL,
  `gender` enum('M','F') NOT NULL,
  `hire_date` date NOT NULL,
  PRIMARY KEY (`emp_no`, `hire_date`) -- 파티션 지정 컬럼도 기본키로 되어있어야 한다!
)
PARTITION BY RANGE (YEAR(hire_date)) (
    PARTITION p0 VALUES LESS THAN (1970),
    PARTITION p1 VALUES LESS THAN (1980),
    PARTITION p2 VALUES LESS THAN (1990),
    PARTITION p3 VALUES LESS THAN MAXVALUE
);

-- 3. 데이터 이관
INSERT INTO employees
SELECT * FROM employees_backup;

SELECT *
FROM information_schema.PARTITIONS
WHERE `TABLE_NAME` = 'employees';