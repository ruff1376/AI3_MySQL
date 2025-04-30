-- Active: 1745889701130@@127.0.0.1@3306@employees
-- employees, dept_emp, departments
-- 사원번호, 이름, 부서명을 조회하시오

SELECT * FROM employees;

SELECT * FROM dept_emp;

SELECT * FROM departments;

-- employees, dept_emp 두 테이블을 조인하시오.
SELECT emp.emp_no
      ,emp.first_name
      ,de.dept_no
FROM employees emp
    ,dept_emp de
WHERE emp.emp_no = de.emp_no
;

-- employees, dept_emp, departments 세 테이블을 조인하시오.
SELECT emp.emp_no 사원번호
      ,emp.first_name 이름
      ,de.dept_no 부서번호
      ,dept.dept_name 부서명
FROM employees emp
    ,dept_emp de
    ,departments dept
WHERE emp.emp_no = de.emp_no
    AND de.dept_no = dept.dept_no
;

-- INNER JOIN 을 사용하여
-- employees, dept_emp, departments 세 테이블을 조인하시오.
SELECT emp.emp_no 사원번호
      ,emp.first_name 이름
      ,de.dept_no 부서번호
      ,dept.dept_name 부서명
FROM employees emp
    INNER JOIN dept_emp de ON emp.emp_no = de.emp_no
    INNER JOIN departments dept ON de.dept_no = dept.dept_no
;