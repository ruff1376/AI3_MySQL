-- 사원의 월급 계산 함수
DROP FUNCTION IF EXISTS calculate_month_salary;
DELIMITER //

CREATE FUNCTION calculate_month_salary(p_emp_no INT)
RETURNS DECIMAL(10,2)
DETERMINISTIC           -- 동일한 입력에 대해 항상 동일한 출력 반환
READS SQL DATA          -- 데이터를 읽기만 함
BEGIN
    DECLARE month_salary DECIMAL(10,2);
    
    SELECT salary / 12
    INTO month_salary
    FROM salaries
    WHERE emp_no = p_emp_no
    AND to_date = '9999-01-01'
    ORDER BY from_date DESC
    LIMIT 1
    ;
    
    RETURN month_salary;
END //

DELIMITER ;

-- 함수 호출
SELECT emp_no
        ,first_name
        ,gender
        ,calculate_month_salary(emp_no) AS '월급'
FROM employees
;


-- 사원의 근무 기간(년) 계산 함수
DROP FUNCTION IF EXISTS calculate_years_of_service;
DELIMITER //

CREATE FUNCTION calculate_years_of_service(p_emp_no INT)
RETURNS INT
DETERMINISTIC
READS SQL DATA
BEGIN
    DECLARE years INT;
    
    SELECT TIMESTAMPDIFF(YEAR, hire_date, CURDATE())
    INTO years
    FROM employees
    WHERE emp_no = p_emp_no;
    
    RETURN years;
END //

DELIMITER ;

-- 함수 호출
SELECT emp_no
        ,first_name
        ,gender
        ,calculate_month_salary(emp_no) AS '월급'
        ,calculate_years_of_service(emp_no) AS '근속년수'
FROM employees
;


-- 부서 이름 조회 함수
DROP FUNCTION IF EXISTS get_department_name;
DELIMITER //

CREATE FUNCTION get_department_name(p_dept_no CHAR(4))
RETURNS VARCHAR(40)
DETERMINISTIC
READS SQL DATA
BEGIN
    DECLARE v_dept_name VARCHAR(40);
    
    SELECT dept_name
    INTO v_dept_name
    FROM departments
    WHERE dept_no = p_dept_no;
    
    RETURN v_dept_name;
END //

DELIMITER ;

-- 함수 호출
SELECT e.emp_no
      ,first_name
      ,gender
      ,get_department_name(de.dept_no) AS '부서명'
      ,calculate_month_salary(e.emp_no) AS '월급'
      ,calculate_years_of_service(e.emp_no) AS '근속년수'
FROM employees e
    JOIN dept_emp de ON e.emp_no = de.emp_no
;