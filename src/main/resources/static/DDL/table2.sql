DROP TABLE reply;
DROP SEQUENCE SEQ_REPLY;
DROP TABLE bulletin;
DROP SEQUENCE SEQ_BOARD;
DROP TABLE users;

CREATE SEQUENCE SEQ_BOARD;
CREATE SEQUENCE SEQ_REPLY;

CREATE TABLE users (
    user_id VARCHAR2(20),
    user_pw VARCHAR2(30) NOT NULL,
    user_name VARCHAR2(20) NOT NULL,
    CONSTRAINT pk_user PRIMARY KEY (user_id)
);

ALTER TABLE users ADD CONSTRAINT uk_users_user_name UNIQUE(user_name);

CREATE TABLE bulletin (
    board_no NUMBER(10),
    writer VARCHAR2(50) NOT NULL,
    user_name VARCHAR2(20) NOT NULL,
    title VARCHAR2(200) NOT NULL,
    content VARCHAR2(3000),
    recommend NUMBER(4) DEFAULT 0,
    views NUMBER(5) DEFAULT 0,
    post_time DATE DEFAULT SYSDATE,
    CONSTRAINT pk_bulletin PRIMARY KEY (board_no),
    CONSTRAINT fk_bulletin FOREIGN KEY (writer) REFERENCES users (user_id) ON DELETE CASCADE,
    CONSTRAINT fk_bulletin2 FOREIGN KEY (user_name) REFERENCES users (user_name)
);

CREATE TABLE reply (
    reply_no NUMBER(5) NOT NULL,
    board_no NUMBER(10),
    writer VARCHAR2(20) NOT NULL,
    user_name VARCHAR2(20) NOT NULL,
    content VARCHAR2(1000) NOT NULL,
    reply_date DATE DEFAULT SYSDATE,
    CONSTRAINT pk_reply PRIMARY KEY (reply_no),
    CONSTRAINT fk_reply FOREIGN KEY (writer) REFERENCES users (user_id) ON DELETE CASCADE,
    CONSTRAINT fk_reply2 FOREIGN KEY (board_no) REFERENCES bulletin (board_no) ON DELETE CASCADE,
    CONSTRAINT fk_reply3 FOREIGN KEY (user_name) REFERENCES users (user_name)
);

SELECT * FROM users;
SELECT * FROM bulletin;
SELECT * FROM reply;