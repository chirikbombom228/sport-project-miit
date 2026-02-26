--liquibase formatted sql

--changeset olesya:ddl-01
-- дописать ограничения на длину всех типов VARCHAR

CREATE TABLE IF NOT EXISTS groups (
    group_id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(8),
    institute VARCHAR(100),

    CONSTRAINT name_length_malo CHECK ( 2<= LENGTH(name) <= 15),
    CONSTRAINT institute_length_mnogo CHECK (2 <= LENGTH(institute) <= 100),
    CONSTRAINT name_null CHECK (name NOT NULL),
    CONSTRAINT name_correct CHECK (name ~ '^[А-Я]{3}[а-я]-[0-9]{3}$'),
    CONSTRAINT name_unique UNIQUE name;
);

CREATE TABLE IF NOT EXISTS disciplines (
    discipline_id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    name VARCHAR,

    CONSTRAINT name_length_malo CHECK ( 2<= LENGTH(name) <= 15)
    CONSTRAINT name_null CHECK (name NOT NULL),
    CONSTRAINT name_unique UNIQUE name;
);


-- секция может быть null (если не записался чувак)
CREATE TABLE IF NOT EXISTS students (
    student_id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    login VARCHAR(50),
    password_hash VARCHAR(50),
    last_name VARCHAR(50),
    first_name VARCHAR(50),
    patronymic VARCHAR(50),
    birthday DATE,
    health_group VARCHAR(10),
    group_id INTEGER,
    section_id INTEGER,

    CONSTRAINT login_length_malo CHECK ( 2<= LENGTH(login) <= 50),
    CONSTRAINT password_hash_length_malo CHECK ( 2<= LENGTH(password_hash) <= 50),
    CONSTRAINT last_name_length_malo CHECK ( 2<= LENGTH(last_name) <= 50),
    CONSTRAINT first_name_length_malo CHECK ( 2<= LENGTH(first_name) <= 50),
    CONSTRAINT patronymic_length_malo CHECK (2 <= LENGTH(patronymic) <= 50),
    CONSTRAINT health_group_length_malo CHECK (1 <= LENGTH(health_group) <= 10),
    CONSTRAINT login_null CHECK (login NOT NULL),
    CONSTRAINT login_unique UNIQUE login,
    CONSTRAINT password_hash_null CHECK (password_hash NOT NULL),
    CONSTRAINT password_hash_unique UNIQUE password_hash,
    CONSTRAINT last_name_null CHECK (last_name NOT NULL),
    CONSTRAINT firs_name_null CHECK (firs_name NOT NULL),
    CONSTRAINT birthday_null CHECK (birthday NOT NULL),
    CONSTRAINT health_group_null CHECK (name NOT NULL),
    CONSTRAINT group_id_foreign_key FOREIGN KEY (group_id) REFERENCES groups(group_id),
    CONSTRAINT section_id_foreign_key FOREIGN KEY (section_id) REFERENCES disciplines(discipline_id);
);

CREATE TABLE IF NOT EXISTS teachers (
    teacher_id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    login VARCHAR(50),
    password_hash VARCHAR(50),
    last_name VARCHAR(50),
    firs_name VARCHAR(50),
    patronymic VARCHAR(50),
    birthday DATE,
    is_moderator BOOLEAN,

    CONSTRAINT login_length_malo CHECK ( 2<= LENGTH(login) <= 50),
    CONSTRAINT password_hash_length_malo CHECK ( 2<= LENGTH(password_hash) <= 50),
    CONSTRAINT last_name_length_malo CHECK ( 2<= LENGTH(last_name) <= 50),
    CONSTRAINT first_name_length_malo CHECK ( 2<= LENGTH(first_name) <= 50),
    CONSTRAINT patronymic_length_malo CHECK (2 <= LENGTH(patronymic) <= 50),
    CONSTRAINT login_null CHECK (login NOT NULL),
    CONSTRAINT ogin_unique UNIQUE login,
    CONSTRAINT password_hash_null CHECK (password_hash NOT NULL),
    CONSTRAINT password_hash_unique UNIQUE password_hash,
    CONSTRAINT last_name_null CHECK (last_name NOT NULL),
    CONSTRAINT firs_name_null CHECK (firs_name NOT NULL),
    CONSTRAINT birthday_null CHECK (birthday NOT NULL),
    CONSTRAINT is_moderator_null CHECK (is_moderator NOT NULL);
);

CREATE TABLE IF NOT EXISTS lessons (
    lesson_id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    discipline_id INTEGER,
    date_of_lesson DATE,
    teacher_id INTEGER,

    CONSTRAINT date_of_lesson_null CHECK (date_of_lesson NOT NULL),
    CONSTRAINT discipline_id_foreign_key FOREIGN KEY (discipline_id) REFERENCES disciplines(discipline_id),
    CONSTRAINT teacher_id_foreign_key FOREIGN KEY (teacher_id) REFERENCES teachers(teacher_id);
);

CREATE TABLE IF NOT EXISTS visits (
    visit_id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    student_id INTEGER,
    lesson_id INTEGER,
    exists BOOLEAN,

    CONSTRAINT student_id_foreign_key FOREIGN KEY (student_id) REFERENCES students(student_id),
    CONSTRAINT lesson_id_foreign_key FOREIGN KEY (lesson_id) REFERENCES lessons(lesson_id);
);