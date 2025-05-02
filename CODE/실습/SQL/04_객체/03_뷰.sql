-- 뷰 생성
CREATE VIEW emp_mgr
AS SELECT de.dept_no,
          e.emp_no, e.first_name, e.last_name, e.gender,
          m.emp_no mgr_emp_no, 
          m.first_name mgr_first_name, 
          m.last_name mgr_last_name, 
          m.gender mgr_gender
     FROM dept_emp de
     JOIN employees e ON de.emp_no = e.emp_no
     JOIN dept_manager dm ON de.dept_no = dm.dept_no
     JOIN employees m ON dm.emp_no = m.emp_no
     WHERE de.from_date <= CURDATE() AND de.to_date >= CURDATE()
     AND dm.from_date <= CURDATE() AND dm.to_date >= CURDATE()
;

SELECT *
FROM emp_mgr
;

-- 뷰 수정
ALTER VIEW emp_mgr
AS SELECT *
FROM employees
;

-- 뷰 삭제
DROP VIEW emp_mgr;