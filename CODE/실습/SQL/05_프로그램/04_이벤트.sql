-- Active: 1745889701130@@127.0.0.1@3306@employees
-- 부서별 평균 급여 통계 업데이트
CREATE EVENT update_dept_salary_stats
ON SCHEDULE EVERY 1 WEEK
STARTS '2025-05-08 00:00:00'
DO
  INSERT INTO dept_salary_stats
  SELECT 
    d.dept_no,
    d.dept_name,
    AVG(s.salary) as avg_salary,
    NOW() as calculated_at
  FROM departments d
  JOIN dept_emp de ON d.dept_no = de.dept_no
  JOIN salaries s ON de.emp_no = s.emp_no
  WHERE s.to_date > NOW()
  GROUP BY d.dept_no, d.dept_name;

  -- 
  SELECT *
  FROM information_schema.EVENTS
  WHERE `EVENT_SCHEMA` = DATABASE();   -- 현재 DB 에서만

-- 스케줄러 상태 확인
SHOW VARIABLES LIKE 'event_scheduler';
SET GLOBAL event_scheduler = ON;    -- 스케줄러 활성화
SET GLOBAL event_scheduler = OFF;   -- 스케줄러 비활성화

-- 이벤트 비활성화
ALTER EVENT update_dept_salary_stats DISABLE;
-- 이벤트 활성화
ALTER EVENT update_dept_salary_stats ENABLE;