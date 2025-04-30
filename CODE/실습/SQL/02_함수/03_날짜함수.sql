-- NOW(), CURDATE(), CURTIME()

SELECT NOW() AS '현재 날짜시간'
    ,CURDATE() AS '현재 날짜'
    ,CURTIME() AS '현재 시간'
FROM dual;

-- 사원 테이블에서 입사일자로 부터 날짜, 연/월/일을 추출하시오.
SELECT emp_no
    ,first_name
    ,DATE(hire_date) AS '입사일자'
    ,YEAR(hire_date) AS '연'
    ,MONTH(hire_date) AS '월'
    ,DAY(hire_date) AS '일'
FROM employees;

-- 이번 달(4월)에 입사한 사원을 조회하시오.
SELECT *
FROM employees
WHERE MONTH(hire_date) = MONTH(NOW());

-- 이번 달이 생일인 사원을 조회하시오.
SELECT *
FROM employees
WHERE MONTH(birth_date) = MONTH(NOW());

-- 오늘로부터 5년 뒤는 몇 년도인가요?
SELECT YEAR(DATE_ADD(NOW(), INTERVAL 5 YEAR)) AS '5년 후'
FROM dual;

-- 입사한지 30년이 넘은 사원을 조회하시오.
SELECT *
FROM employees
WHERE DATE_ADD(hire_date, INTERVAL 30 YEAR) <= NOW();

SELECT *
FROM employees
WHERE TIMESTAMPDIFF(YEAR, hire_date, CURDATE()) >= 30;

SELECT *
FROM employees
WHERE YEAR(NOW()) - YEAR(hire_date) >= 30;

-- 종강일로부터 10일 남은 날을 구해보시오.
-- 날짜 형식 기호
-- %Y : 연
-- %m : 월
-- %d : 일
-- %H : 시
-- %i : 분
-- %s : 초
SELECT STR_TO_DATE('2025-09-17', '%Y-%m-%d')
FROM dual;

SELECT
     DATE_SUB(STR_TO_DATE('2025-09-17', '%Y-%m-%d'), INTERVAL 10 DAY) AS '종강일 10일 전'
    ,DATE_SUB(STR_TO_DATE('2025-09-17', '%Y-%m-%d'), INTERVAL 2 MONTH) AS '종강일 2달 전'
    ,DATE_SUB(STR_TO_DATE('2025-09-17', '%Y-%m-%d'), INTERVAL 1 YEAR) AS '종강일 1년 전'
FROM dual;

SELECT TIMESTAMPDIFF(YEAR, from_date, to_date) AS '부서 근속연수'
FROM dept_emp
WHERE YEAR(to_date) != 9999
ORDER BY `부서 근속연수` DESC;