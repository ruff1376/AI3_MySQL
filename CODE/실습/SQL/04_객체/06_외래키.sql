-- 게시판 테이블
DROP TABLE IF EXISTS board;

CREATE TABLE board (
    no INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(100) NOT NULL
);

DROP TABLE IF EXISTS reply;

CREATE TABLE reply (
    no INT AUTO_INCREMENT PRIMARY KEY,
    board_no INT,
    content TEXT,
    FOREIGN KEY (board_no) REFERENCES board(no)
    ON UPDATE RESTRICT
    ON DELETE RESTRICT
);

-- 
INSERT INTO board (title)
VALUES
    ('제목1'),
    ('제목2'),
    ('제목3'),
    ('제목4'),
    ('제목5')
;

--
INSERT INTO reply (board_no, content)
VALUES
    (1, '댓글내용1'),
    (1, '댓글내용2'),
    (1, '댓글내용3')
;

SELECT *
FROM board;

SELECT *
FROM reply;

UPDATE board
SET no = 10
WHERE no = 1;

DELETE FROM board
WHERE no = 1;