-- CHECK

CREATE TABLE products(
    no          BIGINT AUTO_INCREMENT PRIMARY KEY,
    price       INT NOT NULL CHECK(price >= 0),
    discount    INT NOT NULL,
    CONSTRAINT check_discount CHECK(price > discount)
);
-- 제약조건 X
INSERT INTO products(price, discount)
VALUES (-1000, 0);
INSERT INTO products(price, discount)
VALUES (10000, 20000);
-- 제약조건 O
INSERT INTO products(price, discount)
VALUES (20000, 10000);

-- 
SELECT *
FROM information_schema.CHECK_CONSTRAINTS
;

-- CHECK 제약 조건 삭제
ALTER TABLE products
DROP CONSTRAINT products_chk_1;

ALTER TABLE products
DROP CONSTRAINT check_discount;