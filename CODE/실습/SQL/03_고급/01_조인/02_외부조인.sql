
USE aloha;

-- 사원번호, 사원명, 부서명
-- 부서가 없는 사원도 포함하여 조회하시오.
SELECT emp.emp_no
      ,emp.name
      ,dept.dept_name
FROM employees emp
    LEFT JOIN departments dept
    ON emp.dept_no = dept.dept_no
;

-- 사원번호, 사원명, 부서명
-- 사원이 없는 부서도 포함하여 조회하시오.
SELECT emp.emp_no
      ,emp.name
      ,dept.dept_name
FROM employees emp
    RIGHT JOIN departments dept
    ON emp.dept_no = dept.dept_no
;

-- 사원번호, 사원명, 부서명
-- 사원 및 부서 유무 상관없이 조회하시오.
-- * FULL JOIN은 MySQL에서 직접 지원하지 않는다.
SELECT emp.emp_no
      ,emp.name
      ,dept.dept_name
FROM employees emp
    LEFT JOIN departments dept
    ON emp.dept_no = dept.dept_no
UNION
SELECT emp.emp_no
      ,emp.name
      ,dept.dept_name
FROM employees emp
    RIGHT JOIN departments dept
    ON emp.dept_no = dept.dept_no
;