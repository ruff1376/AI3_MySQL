-- 스칼라 서브쿼리
-- 사원 테이블의 가장 높은 급여를 조회
SELECT emp_no
      ,name
      ,(SELECT MAX(salary) FROM employees) AS 최대급여
FROM employees
;

-- 인라인 뷰
-- 급여가 4000000원 이상인, 사원의 사원번호, 이름, 부서명을 출력하시오.
SELECT e.emp_no 사원번호
      ,e.name 이름
      ,d.dept_name 부서명
FROM (
    SELECT * FROM employees
    WHERE salary >= 4000000
) e
JOIN departments d ON e.dept_no = d.dept_no
;

-- 서브쿼리
-- 각 부서별로 가장 높은 급여를 가진 사원의 사원 이름과 급여를 조회하시오.
SELECT d.dept_name
      ,e.name
      ,e.salary
FROM employees e
    ,departments d
WHERE e.dept_no = d.dept_no
    AND (e.dept_no, e.salary) IN (
                                    SELECT dept_no, MAX(salary)
                                    FROM employees
                                    GROUP BY dept_no
                                )
;