-- * dual?
-- : 연산이나 테이블이 없는 결과값을 출력하기 위한 테이블

SELECT 1+1 FROM dual;

-- 숫자함수
SELECT CEIL(12.45), CEIL(-12.45)
FROM dual;
SELECT FLOOR(12.55), FLOOR(-12.55)
FROM dual;

-- ROUND(값, 자리수)
-- : 지정한 값을, 해당 자리수에서 반올림하는 함수
-- A A A A  A.BBBB
-- ...  -2 -1.0123

-- 0.54를 소수점 아래 첫째 자리에서 반올림하시오.
SELECT ROUND(0.54, 0)
FROM dual;

-- 0.54를 소수점 아래 둘째 자리에서 반올림하시오.
SELECT ROUND(0.54, 1)
FROM dual;

-- 125.67을 일의 자리에서 반올림하시오.
SELECT ROUND(125.67, -1)
FROM dual;

-- 125.67을 십의 자리에서 반올림하시오.
SELECT ROUND(125.67, -2)
FROM dual;

-- 3을 8로 나눈 나머지
SELECT MOD(3, 8)
FROM dual;

-- 30을 4로 나눈 나머지
SELECT MOD(30, 4)
FROM dual;

-- 2의 10제곱
SELECT POW(2, 10)
FROM dual;

-- 2의 31제곱
SELECT POW(2, 31)
FROM dual;

-- 9의 제곱근
SELECT SQRT(9)
FROM dual;

--- 100의 제곱근
SELECT SQRT(100)
FROM dual;

-- 절삭
-- TRUNCATE(실수, 자리수)
-- : 해당 수를 절삭하는 함수

-- 527425.1234를 소수점 아래 첫째 자리에서 절삭
SELECT TRUNCATE(527425.1234, 0) FROM dual;
-- 527425.1234를 소수점 아래 둘째 자리에서 절삭
SELECT TRUNCATE(527425.1234, 1) FROM dual;
-- 527425.1234를 일의 자리에서 절삭
SELECT TRUNCATE(527425.1234, -1) FROM dual;
-- 527425.1234를 십의 자리에서 절삭
SELECT TRUNCATE(527425.1234, -2) FROM dual;

-- 절대값
SELECT ABS(-20) FROM dual;

-- 0~1 난수 생성
SELECT RAND() FROM dual;

-- 1~45 사이의 정수 난수를 구하시오.
SELECT TRUNCATE(RAND() * 45 + 1, 0) FROM dual;