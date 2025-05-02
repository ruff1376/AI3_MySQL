-- 프로시저 생성
SELECT *
FROM board;

-- 명령어 구분자를 '//' 로 변경
DELIMITER //

-- 저장 프로시저 정의 시작
CREATE PROCEDURE 프로시저이름(매개변수1 타입, 매개변수2 타입)
BEGIN
    -- 프로시저 내부에서 실행할 SQL 작성

END //  -- 프로시저 정의 종료

-- 다시 기본 구분자 ; 으로 변경
DELIMITER;

-- 부서별 평균 급여 조회 프로시저
DELIMITER //

CREATE PROCEDURE get_dept_avg_salary()
BEGIN
    SELECT 
        d.dept_name,
        AVG(s.salary) as avg_salary
    FROM departments d
    JOIN dept_emp de ON d.dept_no = de.dept_no
    JOIN salaries s ON de.emp_no = s.emp_no
    WHERE s.to_date = '9999-01-01'
    GROUP BY d.dept_name;
END //

DELIMITER ;

-- 프로시저 실행
CALL get_dept_avg_salary();


-- 특정 직원의 급여 이력 조회 프로시저
DELIMITER //

CREATE PROCEDURE get_employee_salary_history(IN p_emp_no INT)
BEGIN
    SELECT 
        e.first_name,
        e.last_name,
        s.salary,
        s.from_date,
        s.to_date
    FROM employees e
    JOIN salaries s ON e.emp_no = s.emp_no
    WHERE e.emp_no = p_emp_no
    ORDER BY s.from_date;
END //

DELIMITER ;

-- 파라미터 전달하여 프로시저 호출
CALL get_employee_salary_history(10002);


-- 새로운 직원 추가 프로시저
DELIMITER //

CREATE PROCEDURE insert_new_employee(
    IN p_first_name VARCHAR(14),
    IN p_last_name VARCHAR(16),
    IN p_birth_date DATE,
    IN p_gender ENUM('M','F'),
    IN p_dept_no CHAR(4),
    IN p_salary INT
)
BEGIN
    DECLARE v_emp_no INT;
    
    -- Get the next employee number
    SELECT MAX(emp_no) + 1 INTO v_emp_no FROM employees;
    
    START TRANSACTION;
    
    -- Insert into employees
    INSERT INTO employees VALUES
    (v_emp_no, p_birth_date, p_first_name, p_last_name, p_gender, CURDATE());
    
    -- Insert into dept_emp
    INSERT INTO dept_emp VALUES
    (v_emp_no, p_dept_no, CURDATE(), '9999-01-01');
    
    -- Insert initial salary
    INSERT INTO salaries VALUES
    (v_emp_no, p_salary, CURDATE(), '9999-01-01');
    
    COMMIT;
END //

DELIMITER ;

/*
    IN p_first_name VARCHAR(14),
    IN p_last_name VARCHAR(16),
    IN p_birth_date DATE,
    IN p_gender ENUM('M','F'),
    IN p_dept_no CHAR(4),
    IN p_salary INT
*/
CALL insert_new_employee(
    '조은', '김', STR_TO_DATE('2000-02-02', '%Y-%m-%d'),
    'M', 'd005', 3300000
);


-- OUT 파라미터 활용
-- emp_no 사원 번호를 IN 파라미터로 입력하고,
-- 해당 사원의 최근 발령일자와 급여를 반환하는 프로시저를 정의하시오.
-- OUT : 발령일자, 급여
DELIMITER //

CREATE PROCEDURE get_last_date_and_salary(
    IN p_emp_no INT,
    OUT p_last_date DATE,
    OUT p_last_salary INT
)
BEGIN
    -- 최근 발령일자 조회
    SELECT from_date
    INTO p_last_date
    FROM dept_emp
    WHERE emp_no = p_emp_no
    ORDER BY from_date DESC
    LIMIT 1
    ;
    -- 최근 급여 조회
    SELECT salary
    INTO p_last_salary
    FROM salaries
    WHERE emp_no = p_emp_no
    ORDER BY from_date DESC
    LIMIT 1
    ;
END //

DELIMITER ;

-- 프로시저 호출
-- OUT 파라미터를 받을 변수 선언
SET @last_date = NULL;
SET @last_salary = NULL;

-- 호출
CALL get_last_date_and_salary(20100, @last_date, @last_salary);

-- 결과 확인
SELECT @last_date AS '최근 발령일자',
       @last_salary AS '최근 급여'
;