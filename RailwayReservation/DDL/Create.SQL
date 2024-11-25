CREATE TABLE roles
(
    id   NUMBER GENERATED ALWAYS AS IDENTITY, -- Identity column for auto-increment
    name VARCHAR2(50) NOT NULL UNIQUE,
    CONSTRAINT PK_roles_id PRIMARY KEY (id)   -- Custom primary key name
);

INSERT INTO roles (name)
VALUES ('ROLE_ADMIN');
INSERT INTO roles (name)
VALUES ('ROLE_EMPLOYEE');
INSERT INTO roles (name)
VALUES ('ROLE_PASSENGER');

CREATE TABLE users
(
    id       NUMBER GENERATED ALWAYS AS IDENTITY, -- Identity column for auto-increment
    username VARCHAR2(50) NOT NULL UNIQUE,
    password VARCHAR2(255) NOT NULL,
    enabled  NUMBER(1) DEFAULT 1,                 -- 1: enabled, 0: disabled
    CONSTRAINT PK_users_id PRIMARY KEY (id)       -- Custom primary key name
);

ALTER TABLE USERS
    ADD created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP;
ALTER TABLE USERS
    ADD updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP;

CREATE TABLE user_roles
(
    user_id NUMBER REFERENCES users (id) ON DELETE CASCADE,
    role_id NUMBER REFERENCES roles (id) ON DELETE CASCADE,
    CONSTRAINT PK_user_roles PRIMARY KEY (user_id, role_id) -- Custom composite primary key name
);

CREATE TABLE ADMINS
(
    ID        NUMBER GENERATED ALWAYS AS IDENTITY,
    ADMIN_ID  VARCHAR2(100),                                             -- Auto-increment id for admin
    USER_ID   NUMBER,
    FULL_NAME VARCHAR2(50),
    EMAIL     VARCHAR2(50),
    PHONE     VARCHAR2(15),
    GENDER    VARCHAR2(10) CHECK (gender IN ('Male', 'Female', 'Other')),
    STATION   VARCHAR2(50),
    DOB       VARCHAR2(10),
    DOJ       VARCHAR2(10),
    CONSTRAINT PK_ADMIN_ID PRIMARY KEY (ID),                       -- Primary key for admin table
    CONSTRAINT FK_ADMIN_USER_ID FOREIGN KEY (USER_ID) REFERENCES users (ID) -- Foreign key constraint
);