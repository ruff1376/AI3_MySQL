-- 사원 수를 구하시오.
SELECT COUNT(*) AS '사원 수'
FROM employees;

-- 최고급여, 최저급여를 구하시오.
SELECT MAX(salary) AS '최고급여'
      ,MIN(salary) AS '최저급여'
FROM employees;

-- 급여 합계와 평균을 구하시오.
SELECT SUM(salary) AS '급여합계'
      ,AVG(salary) AS '급여평균'
FROM employees;

-- 부서별 급여의 최고/최저/합계/평균을 구하시오.
SELECT dept_no
      ,MAX(salary) AS '최고급여'
      ,MIN(salary) AS '최저급여'
      ,SUM(salary) AS '급여합계'
      ,AVG(salary) AS '급여평균'
FROM employees
GROUP BY dept_no 
;

-- GROUP_CONCAT()
-- 부서별 사원 이름을 ,로 구분하여 출력하시오.
SELECT dept_no
      ,GROUP_CONCAT(name, ORDER BY name SEPARATOR ', ') '사원 명단'
FROM employees
GROUP BY dept_no
;