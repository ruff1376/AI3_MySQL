-- CASE WHEN ... THEN ... ELSE ... END
/*
    CASE
        WHEN 조건식 THEN 값
        WHEN 조건식 THEN 값
        WHEN 조건식 THEN 값
        ELSE 값
    END
*/
-- 사원의 급여가 300만원 대 이면, 1소득
-- 사원의 급여가 400만원 대 이면, 2소득
-- 사원의 급여가 500만원 대 이면, 3소득
-- 사원의 급여가 600만원 대 이면, 4소득
SELECT
    emp_no,
    name,
    salary,
    CASE 
        WHEN salary >= 3000000 AND salary < 4000000 THEN '1소득' 
        WHEN salary >= 4000000 AND salary < 5000000 THEN '2소득' 
        WHEN salary >= 5000000 AND salary < 6000000 THEN '3소득' 
        WHEN salary >= 6000000 AND salary < 7000000 THEN '4소득' 
        ELSE  '5소득'
    END AS 소득구분
FROM employees;

-- IF(조건, 참일 때 값, 거짓일 때 값)
-- 사원을 조회하여 커미션과 성과금 여부를 함께 출력하시오.
SELECT emp.*
      ,IF(commission_pct IS NULL, '없음', '있음') 커미션유무
      ,IF(bonus IS NULL, '없음', '있음') 성과금유무
      ,IF((commission_pct + bonus) IS NOT NULL, '있음', '없음') '커미션&성과금'
FROM employees emp
;

-- VERSION(), DATABASE(), USER()
SELECT
     VERSION()
    ,DATABASE()
    ,USER()
;