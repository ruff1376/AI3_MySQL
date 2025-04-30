-- Active: 1745889701130@@127.0.0.1@3306@employees

-- 문자열을 대문자로, 소문자로, 첫글자만 대문자로 변환하는 쿼리를 작성하시오.
-- 원문 : 'AlohA WoRlD~!'
SELECT 'AlohA WoRlD~!' AS 원문
    ,UPPER('AlohA WoRlD~!') AS 대문자
    ,LOWER('AlohA WoRlD~!') AS 소문자
FROM dual;

-- 문자열의 바이트 수, 글자 수를 변환하는 쿼리를 작성하시오.
-- 영문, 공백 : 1Byte
-- 한글       : 3Byte
SELECT LENGTH('ALOHA CLASS') AS '바이트 수'
    ,LENGTH('알로하 클래스') AS '바이트 수'
    ,CHAR_LENGTH('ALOHA CLASS') AS '글자 수'
    ,CHAR_LENGTH('알로하 클래스') AS '글자 수'
FROM dual;

-- 주어진 문자열을 연결하여 출력하시오.
SELECT CONCAT('ALOHA', 'CLASS')
FROM dual;

-- 문자열에서 특정 문자열을 추출하여 출력하시오.
SELECT SUBSTR('www.alohaclass.com', 1, 3) AS '1'
    ,SUBSTR('www.alohaclass.com', 5, 10) AS '2'
    ,SUBSTR('www.alohaclass.com', 16, 3) AS '3'
FROM dual;

SELECT SUBSTR('www.alohaclass.com', 1, 3) AS '1'
    ,SUBSTR('www.alohaclass.com', 5, 10) AS '2'
    ,SUBSTR('www.alohaclass.com', -3, 3) AS '3'
FROM dual;

-- 대상 문자열을 왼쪽/오른쪽에 출력하고
-- 빈공간을 특정 문자로 채우는 SQL 문을 작성하시오.
SELECT LPAD('ALOHACLASS', 20, '#') AS '왼쪽'
    ,RPAD('ALOHACLASS', 20, '#') AS '오른쪽'
FROM dual;

-- 사원정보를 '이름/성/생년월일' 형식으로 출력하시오.
SELECT CONCAT_WS('/', first_name, last_name, birth_date) '사원정보'
FROM employees;

-- 'wwwaloha@kakao.com' 이메일 주소에서
-- '@' 문자가 몇 번째 위치하는지 출력하시오.
-- LOCATE('찾을 문자', '문자열')
SELECT 'wwwaloha@kakao.com' AS '이메일주소'
    ,LOCATE('@', 'wwwaloha@kakao.com') AS "@위치"
FROM dual;