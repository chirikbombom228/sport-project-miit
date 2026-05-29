--liquibase formatted sql

--changeset nikita:dml-03
INSERT INTO groups (name, institute) VALUES
    -- ИУЦТ
    ('УВП-112', 'Институт управления и цифровых технологий (ИУЦТ)'),
    ('УИС-111', 'Институт управления и цифровых технологий (ИУЦТ)'),
    ('УИБ-111', 'Институт управления и цифровых технологий (ИУЦТ)'),
    ('УВВ-111', 'Институт управления и цифровых технологий (ИУЦТ)'),

    -- ИЭФ
    ('ЭПИ-112', 'Институт экономики и финансов (ИЭФ)'),
    ('ЭГУ-111', 'Институт экономики и финансов (ИЭФ)'),
    ('ЭЭС-111', 'Институт экономики и финансов (ИЭФ)'),
    ('ЭМС-111', 'Институт экономики и финансов (ИЭФ)'),

    -- АГА
    ('АМБ-111', 'Академия гражданской авиации (АГА)'),

    -- ВИШ
    ('ШЦТ-111', 'Высшая инженерная школа (ВИШ)'),
    ('ШАД-111', 'Высшая инженерная школа (ВИШ)'),
    ('ШИН-111', 'Высшая инженерная школа (ВИШ)'),
    ('ШТД-111', 'Высшая инженерная школа (ВИШ)'),

    -- ИТТСУ
    ('ТИУ-111', 'Институт транспортной техники и систем управления (ИТТСУ)'),
    ('ТПТ-141', 'Институт транспортной техники и систем управления (ИТТСУ)'),
    ('ТНД-141', 'Институт транспортной техники и систем управления (ИТТСУ)'),
    ('ТПВ-151', 'Институт транспортной техники и систем управления (ИТТСУ)');

INSERT INTO sections (name, description) VALUES
    -- Новые
    ('Бадминтон', 'Секция по бадминтону для студентов'),
    ('Настольный теннис', 'Секция по настольному теннису для студентов'),
    ('Борьба', 'Секция по спортивной борьбе для студентов'),
    ('Дзюдо', 'Секция по дзюдо для студентов'),
    ('Самбо', 'Секция по самбо для студентов'),
    ('Бокс', 'Секция по боксу для студентов'),
    ('Кикбоксинг', 'Секция по кикбоксингу для студентов'),
    ('Тхэквондо', 'Секция по тхэквондо для студентов'),
    ('Карате', 'Секция по карате для студентов'),
    ('Стрельба', 'Секция по пулевой стрельбе для студентов'),
    ('Спортивное ориентирование', 'Секция по спортивному ориентированию для студентов'),
    ('Туризм', 'Секция по спортивному туризму для студентов'),
    ('Скалолазание', 'Секция по скалолазанию для студентов'),
    ('Гимнастика', 'Секция по спортивной гимнастике для студентов'),
    ('Пауэрлифтинг', 'Секция по пауэрлифтингу для студентов'),
    ('Гиревой спорт', 'Секция по гиревому спорту для студентов'),
    ('Армрестлинг', 'Секция по армрестлингу для студентов'),
    ('Лыжные гонки', 'Секция по лыжным гонкам для студентов'),
    ('Рукопашный бой', 'Секция по рукопашному бою для студентов'),
    ('Фехтование', 'Секция по фехтованию для студентов'),
    ('Роллер спорт', 'Секция по роллер спорту для студентов');

INSERT INTO students (login, password_hash, last_name, first_name, patronymic, birthday, health_group_id, group_id, section_id) VALUES
    -- =====================================================
    -- Группа УВП-111 (group_id = 1)
    -- =====================================================
    ('ivanov_ap', '$2a$10$GuSp6jApr.jGCA8uWn/QxOgDM6YirQ0dVZe9uNQ9H7CHAmjYVRSGe', 'Иванов', 'Алексей', 'Петрович', '2006-01-15', 1, 1, 1),
    ('smirnova_ov', '$2a$10$GuSp6jApr.jGCA8uWn/QxOgDM6YirQ0dVZe9uNQ9H7CHAmjYVRSGe', 'Смирнова', 'Ольга', 'Владимировна', '2006-03-10', 2, 1, 2),
    ('kuznetsov_dd', '$2a$10$GuSp6jApr.jGCA8uWn/QxOgDM6YirQ0dVZe9uNQ9H7CHAmjYVRSGe', 'Кузнецов', 'Дмитрий', 'Дмитриевич', '2005-11-27', 1, 1, NULL),

    -- =====================================================
    -- Группа ЭПИ-111 (group_id = 2)
    -- =====================================================
    ('sokolova_aa', '$2a$10$GuSp6jApr.jGCA8uWn/QxOgDM6YirQ0dVZe9uNQ9H7CHAmjYVRSGe', 'Соколова', 'Анастасия', 'Андреевна', '2005-09-03', 1, 2, 6),
    ('popov_ii', '$2a$10$GuSp6jApr.jGCA8uWn/QxOgDM6YirQ0dVZe9uNQ9H7CHAmjYVRSGe', 'Попов', 'Илья', 'Игоревич', '2005-02-18', 2, 2, 3),
    ('lebedev_ar', '$2a$10$GuSp6jApr.jGCA8uWn/QxOgDM6YirQ0dVZe9uNQ9H7CHAmjYVRSGe', 'Лебедев', 'Андрей', 'Романович', '2004-12-01', 1, 2, NULL),

    -- =====================================================
    -- Группа АУБ-171 (group_id = 3)
    -- =====================================================
    ('kozlov_vs', '$2a$10$GuSp6jApr.jGCA8uWn/QxOgDM6YirQ0dVZe9uNQ9H7CHAmjYVRSGe', 'Козлов', 'Владимир', 'Сергеевич', '2004-08-20', 3, 3, 4),
    ('novikova_ek', '$2a$10$GuSp6jApr.jGCA8uWn/QxOgDM6YirQ0dVZe9uNQ9H7CHAmjYVRSGe', 'Новикова', 'Екатерина', 'Константиновна', '2005-07-14', 1, 3, 5),
    ('morozov_aa', '$2a$10$GuSp6jApr.jGCA8uWn/QxOgDM6YirQ0dVZe9uNQ9H7CHAmjYVRSGe', 'Морозов', 'Александр', 'Александрович', '2004-10-09', 2, 3, 1),

    -- =====================================================
    -- Группа ШАДк-111 (group_id = 4)
    -- =====================================================
    ('vorobeva_ma', '$2a$10$GuSp6jApr.jGCA8uWn/QxOgDM6YirQ0dVZe9uNQ9H7CHAmjYVRSGe', 'Воробьева', 'Мария', 'Алексеевна', '2005-09-25', 1, 4, 7),
    ('gromov_dp', '$2a$10$GuSp6jApr.jGCA8uWn/QxOgDM6YirQ0dVZe9uNQ9H7CHAmjYVRSGe', 'Громов', 'Денис', 'Павлович', '2004-11-30', 2, 4, 2),
    ('belova_ei', '$2a$10$GuSp6jApr.jGCA8uWn/QxOgDM6YirQ0dVZe9uNQ9H7CHAmjYVRSGe', 'Белова', 'Елена', 'Ивановна', '2006-02-12', 1, 4, NULL),

    -- =====================================================
    -- Группа ТКИ-141 (group_id = 5)
    -- =====================================================
    ('titov_rs', '$2a$10$GuSp6jApr.jGCA8uWn/QxOgDM6YirQ0dVZe9uNQ9H7CHAmjYVRSGe', 'Титов', 'Роман', 'Сергеевич', '2004-06-07', 1, 5, 3),
    ('pavlova_yv', '$2a$10$GuSp6jApr.jGCA8uWn/QxOgDM6YirQ0dVZe9uNQ9H7CHAmjYVRSGe', 'Павлова', 'Юлия', 'Владимировна', '2005-12-19', 3, 5, 4),
    ('egorov_ai', '$2a$10$GuSp6jApr.jGCA8uWn/QxOgDM6YirQ0dVZe9uNQ9H7CHAmjYVRSGe', 'Егоров', 'Антон', 'Игоревич', '2005-03-22', 1, 5, NULL),

    -- =====================================================
    -- Группа УВП-112 (group_id = 6)
    -- =====================================================
    ('sidorov_kv', '$2a$10$GuSp6jApr.jGCA8uWn/QxOgDM6YirQ0dVZe9uNQ9H7CHAmjYVRSGe', 'Сидоров', 'Кирилл', 'Валерьевич', '2006-05-30', 1, 6, 5),
    ('andreeva_tm', '$2a$10$GuSp6jApr.jGCA8uWn/QxOgDM6YirQ0dVZe9uNQ9H7CHAmjYVRSGe', 'Андреева', 'Татьяна', 'Михайловна', '2005-10-11', 2, 6, NULL),
    ('nikitin_pe', '$2a$10$GuSp6jApr.jGCA8uWn/QxOgDM6YirQ0dVZe9uNQ9H7CHAmjYVRSGe', 'Никитин', 'Павел', 'Евгеньевич', '2005-01-28', 1, 6, 1),

    -- =====================================================
    -- Группа УИС-111 (group_id = 7)
    -- =====================================================
    ('kravchenko_aa', '$2a$10$GuSp6jApr.jGCA8uWn/QxOgDM6YirQ0dVZe9uNQ9H7CHAmjYVRSGe', 'Кравченко', 'Артём', 'Александрович', '2006-07-04', 1, 7, 2),
    ('makarova_vd', '$2a$10$GuSp6jApr.jGCA8uWn/QxOgDM6YirQ0dVZe9uNQ9H7CHAmjYVRSGe', 'Макарова', 'Виктория', 'Дмитриевна', '2005-08-17', 3, 7, 6),
    ('zakharov_oy', '$2a$10$GuSp6jApr.jGCA8uWn/QxOgDM6YirQ0dVZe9uNQ9H7CHAmjYVRSGe', 'Захаров', 'Олег', 'Юрьевич', '2004-09-29', 2, 7, NULL),

    -- =====================================================
    -- Группа УИБ-111 (group_id = 8)
    -- =====================================================
    ('belyaev_mm', '$2a$10$GuSp6jApr.jGCA8uWn/QxOgDM6YirQ0dVZe9uNQ9H7CHAmjYVRSGe', 'Беляев', 'Михаил', 'Михайлович', '2005-11-14', 1, 8, 4),
    ('tarasova_ai', '$2a$10$GuSp6jApr.jGCA8uWn/QxOgDM6YirQ0dVZe9uNQ9H7CHAmjYVRSGe', 'Тарасова', 'Анастасия', 'Ильинична', '2006-01-20', 1, 8, 7),
    ('denisov_vp', '$2a$10$GuSp6jApr.jGCA8uWn/QxOgDM6YirQ0dVZe9uNQ9H7CHAmjYVRSGe', 'Денисов', 'Владислав', 'Петрович', '2004-12-25', 2, 8, NULL),

    -- =====================================================
    -- Группа УВВ-111 (group_id = 9)
    -- =====================================================
    ('ryzhov_ap', '$2a$10$GuSp6jApr.jGCA8uWn/QxOgDM6YirQ0dVZe9uNQ9H7CHAmjYVRSGe', 'Рыжов', 'Андрей', 'Павлович', '2005-03-05', 1, 9, 3),
    ('mishina_ov', '$2a$10$GuSp6jApr.jGCA8uWn/QxOgDM6YirQ0dVZe9uNQ9H7CHAmjYVRSGe', 'Мишина', 'Ольга', 'Витальевна', '2006-02-18', 2, 9, 5),
    ('frolov_ik', '$2a$10$GuSp6jApr.jGCA8uWn/QxOgDM6YirQ0dVZe9uNQ9H7CHAmjYVRSGe', 'Фролов', 'Иван', 'Константинович', '2005-04-07', 1, 9, NULL),

    -- =====================================================
    -- Группа АМБ-111 (group_id = 10)
    -- =====================================================
    ('афонин_ак', '$2a$10$GuSp6jApr.jGCA8uWn/QxOgDM6YirQ0dVZe9uNQ9H7CHAmjYVRSGe', 'Афонин', 'Алексей', 'Константинович', '2006-01-25', 1, 10, 2),
    ('королева_вс', '$2a$10$GuSp6jApr.jGCA8uWn/QxOgDM6YirQ0dVZe9uNQ9H7CHAmjYVRSGe', 'Королева', 'Вероника', 'Сергеевна', '2005-09-18', 1, 10, 5),
    ('ершов_дк', '$2a$10$GuSp6jApr.jGCA8uWn/QxOgDM6YirQ0dVZe9uNQ9H7CHAmjYVRSGe', 'Ершов', 'Денис', 'Константинович', '2004-11-02', 3, 10, NULL),

    -- =====================================================
    -- Группа ШЦТ-111 (group_id = 11)
    -- =====================================================
    ('rodionov_an', '$2a$10$GuSp6jApr.jGCA8uWn/QxOgDM6YirQ0dVZe9uNQ9H7CHAmjYVRSGe', 'Родионов', 'Алексей', 'Николаевич', '2006-06-14', 1, 11, 6),
    ('kuzmina_ei', '$2a$10$GuSp6jApr.jGCA8uWn/QxOgDM6YirQ0dVZe9uNQ9H7CHAmjYVRSGe', 'Кузьмина', 'Елизавета', 'Игоревна', '2005-08-27', 2, 11, 1),
    ('sorokin_ad', '$2a$10$GuSp6jApr.jGCA8uWn/QxOgDM6YirQ0dVZe9uNQ9H7CHAmjYVRSGe', 'Сорокин', 'Андрей', 'Дмитриевич', '2005-10-05', 3, 11, NULL),

    -- =====================================================
    -- Группа ШАД-111 (group_id = 12)
    -- =====================================================
    ('баранов_нв', '$2a$10$GuSp6jApr.jGCA8uWn/QxOgDM6YirQ0dVZe9uNQ9H7CHAmjYVRSGe', 'Баранов', 'Никита', 'Владимирович', '2005-05-12', 1, 12, 4),
    ('голубева_аи', '$2a$10$GuSp6jApr.jGCA8uWn/QxOgDM6YirQ0dVZe9uNQ9H7CHAmjYVRSGe', 'Голубева', 'Анна', 'Игоревна', '2006-07-09', 2, 12, 2),
    ('медведев_пп', '$2a$10$GuSp6jApr.jGCA8uWn/QxOgDM6YirQ0dVZe9uNQ9H7CHAmjYVRSGe', 'Медведев', 'Павел', 'Петрович', '2005-09-20', 1, 12, NULL),

    -- =====================================================
    -- Группа ШИН-111 (group_id = 13)
    -- =====================================================
    ('абросимов_еа', '$2a$10$GuSp6jApr.jGCA8uWn/QxOgDM6YirQ0dVZe9uNQ9H7CHAmjYVRSGe', 'Абросимов', 'Егор', 'Алексеевич', '2006-02-11', 1, 13, 7),
    ('вязова_ик', '$2a$10$GuSp6jApr.jGCA8uWn/QxOgDM6YirQ0dVZe9uNQ9H7CHAmjYVRSGe', 'Вязова', 'Ирина', 'Константиновна', '2005-06-28', 2, 13, 3),
    ('шаповалов_ип', '$2a$10$GuSp6jApr.jGCA8uWn/QxOgDM6YirQ0dVZe9uNQ9H7CHAmjYVRSGe', 'Шаповалов', 'Илья', 'Павлович', '2004-10-14', 1, 13, NULL),

    -- =====================================================
    -- Группа ШТД-111 (group_id = 14)
    -- =====================================================
    ('веселов_рс', '$2a$10$GuSp6jApr.jGCA8uWn/QxOgDM6YirQ0dVZe9uNQ9H7CHAmjYVRSGe', 'Веселов', 'Роман', 'Сергеевич', '2005-03-25', 1, 14, 1),
    ('зорина_ев', '$2a$10$GuSp6jApr.jGCA8uWn/QxOgDM6YirQ0dVZe9uNQ9H7CHAmjYVRSGe', 'Зорина', 'Елена', 'Владимировна', '2006-08-01', 3, 14, 5),
    ('кукушкин_тк', '$2a$10$GuSp6jApr.jGCA8uWn/QxOgDM6YirQ0dVZe9uNQ9H7CHAmjYVRSGe', 'Кукушкин', 'Тимофей', 'Кириллович', '2005-11-19', 2, 14, NULL),

    -- =====================================================
    -- Группа ЭГУ-111 (group_id = 15)
    -- =====================================================
    ('петухов_рн', '$2a$10$GuSp6jApr.jGCA8uWn/QxOgDM6YirQ0dVZe9uNQ9H7CHAmjYVRSGe', 'Петухов', 'Роман', 'Николаевич', '2005-07-07', 1, 15, 6),
    ('осипова_дс', '$2a$10$GuSp6jApr.jGCA8uWn/QxOgDM6YirQ0dVZe9uNQ9H7CHAmjYVRSGe', 'Осипова', 'Дарья', 'Сергеевна', '2006-04-19', 1, 15, 2),
    ('калинин_аа', '$2a$10$GuSp6jApr.jGCA8uWn/QxOgDM6YirQ0dVZe9uNQ9H7CHAmjYVRSGe', 'Калинин', 'Александр', 'Алексеевич', '2004-12-27', 2, 15, NULL),

    -- =====================================================
    -- Группа ЭЭС-111 (group_id = 16)
    -- =====================================================
    ('филатов_ио', '$2a$10$GuSp6jApr.jGCA8uWn/QxOgDM6YirQ0dVZe9uNQ9H7CHAmjYVRSGe', 'Филатов', 'Иван', 'Олегович', '2005-09-30', 1, 16, 3),
    ('рожкова_те', '$2a$10$GuSp6jApr.jGCA8uWn/QxOgDM6YirQ0dVZe9uNQ9H7CHAmjYVRSGe', 'Рожкова', 'Татьяна', 'Евгеньевна', '2006-01-05', 2, 16, 4),
    ('лазарев_ди', '$2a$10$GuSp6jApr.jGCA8uWn/QxOgDM6YirQ0dVZe9uNQ9H7CHAmjYVRSGe', 'Лазарев', 'Дмитрий', 'Игоревич', '2005-05-17', 1, 16, NULL),

    -- =====================================================
    -- Группа ЭМС-111 (group_id = 17)
    -- =====================================================
    ('савельев_аа', '$2a$10$GuSp6jApr.jGCA8uWn/QxOgDM6YirQ0dVZe9uNQ9H7CHAmjYVRSGe', 'Савельев', 'Андрей', 'Андреевич', '2004-08-30', 1, 17, 5),
    ('соболева_ан', '$2a$10$GuSp6jApr.jGCA8uWn/QxOgDM6YirQ0dVZe9uNQ9H7CHAmjYVRSGe', 'Соболева', 'Алина', 'Николаевна', '2005-12-10', 3, 17, 1),
    ('кондратьев_ев', '$2a$10$GuSp6jApr.jGCA8uWn/QxOgDM6YirQ0dVZe9uNQ9H7CHAmjYVRSGe', 'Кондратьев', 'Егор', 'Владимирович', '2006-03-08', 1, 17, NULL),

    -- =====================================================
    -- Группа ТИУ-111 (group_id = 18)
    -- =====================================================
    ('vasiliev_ev', '$2a$10$GuSp6jApr.jGCA8uWn/QxOgDM6YirQ0dVZe9uNQ9H7CHAmjYVRSGe', 'Васильев', 'Евгений', 'Владимирович', '2005-12-12', 1, 18, 2),
    ('efimova_mn', '$2a$10$GuSp6jApr.jGCA8uWn/QxOgDM6YirQ0dVZe9uNQ9H7CHAmjYVRSGe', 'Ефимова', 'Марина', 'Николаевна', '2006-03-17', 1, 18, 4),
    ('gusev_ap', '$2a$10$GuSp6jApr.jGCA8uWn/QxOgDM6YirQ0dVZe9uNQ9H7CHAmjYVRSGe', 'Гусев', 'Александр', 'Павлович', '2005-07-22', 2, 18, NULL),

    -- =====================================================
    -- Группа ТПТ-141 (group_id = 19)
    -- =====================================================
    ('панов_пс', '$2a$10$GuSp6jApr.jGCA8uWn/QxOgDM6YirQ0dVZe9uNQ9H7CHAmjYVRSGe', 'Панов', 'Павел', 'Сергеевич', '2005-02-14', 1, 19, 6),
    ('мартынова_юм', '$2a$10$GuSp6jApr.jGCA8uWn/QxOgDM6YirQ0dVZe9uNQ9H7CHAmjYVRSGe', 'Мартынова', 'Юлия', 'Михайловна', '2004-10-22', 2, 19, 3),
    ('герасимов_ап', '$2a$10$GuSp6jApr.jGCA8uWn/QxOgDM6YirQ0dVZe9uNQ9H7CHAmjYVRSGe', 'Герасимов', 'Артём', 'Павлович', '2006-06-11', 1, 19, NULL),

    -- =====================================================
    -- Группа ТНД-141 (group_id = 20)
    -- =====================================================
    ('максимов_рк', '$2a$10$GuSp6jApr.jGCA8uWn/QxOgDM6YirQ0dVZe9uNQ9H7CHAmjYVRSGe', 'Максимов', 'Руслан', 'Константинович', '2005-11-08', 1, 20, 7),
    ('виноградова_ме', '$2a$10$GuSp6jApr.jGCA8uWn/QxOgDM6YirQ0dVZe9uNQ9H7CHAmjYVRSGe', 'Виноградова', 'Мария', 'Евгеньевна', '2006-05-21', 2, 20, 1),
    ('моисеев_дн', '$2a$10$GuSp6jApr.jGCA8uWn/QxOgDM6YirQ0dVZe9uNQ9H7CHAmjYVRSGe', 'Моисеев', 'Денис', 'Николаевич', '2004-09-16', 3, 20, NULL),

    -- =====================================================
    -- Группа ТПВ-151 (group_id = 21)
    -- =====================================================
    ('фокин_ас', '$2a$10$GuSp6jApr.jGCA8uWn/QxOgDM6YirQ0dVZe9uNQ9H7CHAmjYVRSGe', 'Фокин', 'Александр', 'Сергеевич', '2006-04-03', 1, 21, 4),
    ('куликова_аа', '$2a$10$GuSp6jApr.jGCA8uWn/QxOgDM6YirQ0dVZe9uNQ9H7CHAmjYVRSGe', 'Куликова', 'Анна', 'Алексеевна', '2005-07-29', 1, 21, 5),
    ('орлов_ми', '$2a$10$GuSp6jApr.jGCA8uWn/QxOgDM6YirQ0dVZe9uNQ9H7CHAmjYVRSGe', 'Орлов', 'Максим', 'Иванович', '2005-10-13', 2, 21, NULL);

-- Все учителя с одинаковым хэшем пароля
INSERT INTO teachers (login, password_hash, last_name, first_name, patronymic, birthday, is_moderator) VALUES
    -- НОВЫЕ
    ('morozov_da', '$2a$10$GuSp6jApr.jGCA8uWn/QxOgDM6YirQ0dVZe9uNQ9H7CHAmjYVRSGe', 'Морозов', 'Дмитрий', 'Андреевич', '1975-03-12', false),
    ('kuznetsova_ev', '$2a$10$GuSp6jApr.jGCA8uWn/QxOgDM6YirQ0dVZe9uNQ9H7CHAmjYVRSGe', 'Кузнецова', 'Елена', 'Владимировна', '1988-07-19', true),
    ('novikov_ai', '$2a$10$GuSp6jApr.jGCA8uWn/QxOgDM6YirQ0dVZe9uNQ9H7CHAmjYVRSGe', 'Новиков', 'Алексей', 'Игоревич', '1983-11-25', false),
    ('fedorova_tp', '$2a$10$GuSp6jApr.jGCA8uWn/QxOgDM6YirQ0dVZe9uNQ9H7CHAmjYVRSGe', 'Федорова', 'Татьяна', 'Павловна', '1992-04-09', true),
    ('mikhailov_sa', '$2a$10$GuSp6jApr.jGCA8uWn/QxOgDM6YirQ0dVZe9uNQ9H7CHAmjYVRSGe', 'Михайлов', 'Сергей', 'Алексеевич', '1979-09-30', false),
    ('vasilyeva_ov', '$2a$10$GuSp6jApr.jGCA8uWn/QxOgDM6YirQ0dVZe9uNQ9H7CHAmjYVRSGe', 'Васильева', 'Ольга', 'Владимировна', '1995-01-14', true),
    ('egorov_pa', '$2a$10$GuSp6jApr.jGCA8uWn/QxOgDM6YirQ0dVZe9uNQ9H7CHAmjYVRSGe', 'Егоров', 'Павел', 'Андреевич', '1987-12-02', false);


INSERT INTO lessons (discipline_id, date_of_lesson, teacher_id, start_at, end_at) VALUES
    (1, '2025-09-02', 6, '08:30:00', '09:50:00'),
    (1, '2025-09-03', 7, '08:30:00', '09:50:00'),
    (1, '2025-09-04', 8, '08:30:00', '09:50:00'),
    (1, '2025-09-05', 9, '08:30:00', '09:50:00'),
    (1, '2025-09-06', 10, '08:30:00', '09:50:00'),
    (1, '2025-09-08', 11, '08:30:00', '09:50:00'),
    (1, '2025-09-09', 12, '08:30:00', '09:50:00'),
    (1, '2025-09-10', 6, '08:30:00', '09:50:00'),
    (1, '2025-09-11', 7, '08:30:00', '09:50:00'),
    (1, '2025-09-12', 8, '08:30:00', '09:50:00'),
    (1, '2025-09-13', 9, '08:30:00', '09:50:00'),
    (1, '2025-09-15', 10, '08:30:00', '09:50:00'),
    (1, '2025-09-16', 11, '08:30:00', '09:50:00'),
    (1, '2025-09-17', 12, '08:30:00', '09:50:00'),
    (1, '2025-09-18', 6, '08:30:00', '09:50:00'),
    (1, '2025-09-19', 7, '08:30:00', '09:50:00'),
    (1, '2025-09-20', 8, '08:30:00', '09:50:00'),
    (1, '2025-09-22', 9, '08:30:00', '09:50:00'),
    (1, '2025-09-23', 10, '08:30:00', '09:50:00'),
    (1, '2025-09-24', 11, '08:30:00', '09:50:00'),
    (1, '2025-09-25', 12, '08:30:00', '09:50:00'),
    (1, '2025-09-26', 6, '08:30:00', '09:50:00'),
    (1, '2025-09-27', 7, '08:30:00', '09:50:00'),
    (1, '2025-09-29', 8, '08:30:00', '09:50:00'),
    (1, '2025-09-30', 9, '08:30:00', '09:50:00'),
    (1, '2025-10-01', 10, '08:30:00', '09:50:00'),
    (1, '2025-10-02', 11, '08:30:00', '09:50:00'),
    (1, '2025-10-03', 12, '08:30:00', '09:50:00'),
    (1, '2025-10-04', 6, '08:30:00', '09:50:00'),
    (1, '2025-10-06', 7, '08:30:00', '09:50:00'),
    (1, '2025-10-07', 8, '08:30:00', '09:50:00'),
    (1, '2025-10-08', 9, '08:30:00', '09:50:00'),
    (1, '2025-10-09', 10, '08:30:00', '09:50:00'),
    (1, '2025-10-10', 11, '08:30:00', '09:50:00'),
    (1, '2025-10-11', 12, '08:30:00', '09:50:00');

-- Урок 36
INSERT INTO visits (student_id, lesson_id, is_exists)
SELECT id, 36, true FROM students WHERE id BETWEEN 1 AND 75
UNION ALL
SELECT id, 36, false FROM students WHERE id IN (3, 8, 11, 25, 40, 55, 60, 72);

-- Урок 37
INSERT INTO visits (student_id, lesson_id, is_exists)
SELECT id, 37, true FROM students WHERE id BETWEEN 1 AND 75
UNION ALL
SELECT id, 37, false FROM students WHERE id IN (4, 7, 15, 30, 45, 58, 68, 74);

-- Урок 38
INSERT INTO visits (student_id, lesson_id, is_exists)
SELECT id, 38, true FROM students WHERE id BETWEEN 1 AND 75;

-- Урок 39
INSERT INTO visits (student_id, lesson_id, is_exists)
SELECT id, 39, true FROM students WHERE id BETWEEN 1 AND 75
UNION ALL
SELECT id, 39, false FROM students WHERE id IN (1, 12, 28, 42, 56, 65, 73);

-- Урок 40
INSERT INTO visits (student_id, lesson_id, is_exists)
SELECT id, 40, true FROM students WHERE id BETWEEN 1 AND 75;

-- Урок 41
INSERT INTO visits (student_id, lesson_id, is_exists)
SELECT id, 41, true FROM students WHERE id BETWEEN 1 AND 75;

-- Урок 42
INSERT INTO visits (student_id, lesson_id, is_exists)
SELECT id, 42, true FROM students WHERE id BETWEEN 1 AND 75
UNION ALL
SELECT id, 42, false FROM students WHERE id IN (6, 14, 32, 50, 63, 70);

-- Урок 43
INSERT INTO visits (student_id, lesson_id, is_exists)
SELECT id, 43, true FROM students WHERE id BETWEEN 1 AND 75
UNION ALL
SELECT id, 43, false FROM students WHERE id IN (9, 18, 35, 52, 67);

-- Урок 44
INSERT INTO visits (student_id, lesson_id, is_exists)
SELECT id, 44, true FROM students WHERE id BETWEEN 1 AND 75;

-- Урок 45
INSERT INTO visits (student_id, lesson_id, is_exists)
SELECT id, 45, true FROM students WHERE id BETWEEN 1 AND 75;

-- Урок 46
INSERT INTO visits (student_id, lesson_id, is_exists)
SELECT id, 46, true FROM students WHERE id BETWEEN 1 AND 75
UNION ALL
SELECT id, 46, false FROM students WHERE id IN (2, 13, 27, 44, 59, 71);

-- Урок 47
INSERT INTO visits (student_id, lesson_id, is_exists)
SELECT id, 47, true FROM students WHERE id BETWEEN 1 AND 75
UNION ALL
SELECT id, 47, false FROM students WHERE id IN (10, 19, 35, 50, 64);

-- Урок 48
INSERT INTO visits (student_id, lesson_id, is_exists)
SELECT id, 48, true FROM students WHERE id BETWEEN 1 AND 75;

-- Урок 49
INSERT INTO visits (student_id, lesson_id, is_exists)
SELECT id, 49, true FROM students WHERE id BETWEEN 1 AND 75
UNION ALL
SELECT id, 49, false FROM students WHERE id IN (5, 20, 38, 54, 66);

-- Урок 50
INSERT INTO visits (student_id, lesson_id, is_exists)
SELECT id, 50, true FROM students WHERE id BETWEEN 1 AND 75
UNION ALL
SELECT id, 50, false FROM students WHERE id IN (16, 33, 48, 61);

-- Урок 51
INSERT INTO visits (student_id, lesson_id, is_exists)
SELECT id, 51, true FROM students WHERE id BETWEEN 1 AND 75;

-- Урок 52
INSERT INTO visits (student_id, lesson_id, is_exists)
SELECT id, 52, true FROM students WHERE id BETWEEN 1 AND 75;

-- Урок 53
INSERT INTO visits (student_id, lesson_id, is_exists)
SELECT id, 53, true FROM students WHERE id BETWEEN 1 AND 75
UNION ALL
SELECT id, 53, false FROM students WHERE id IN (7, 21, 39, 53, 69, 75);

-- Урок 54
INSERT INTO visits (student_id, lesson_id, is_exists)
SELECT id, 54, true FROM students WHERE id BETWEEN 1 AND 75;

-- Урок 55
INSERT INTO visits (student_id, lesson_id, is_exists)
SELECT id, 55, true FROM students WHERE id BETWEEN 1 AND 75
UNION ALL
SELECT id, 55, false FROM students WHERE id IN (3, 17, 34, 49, 62);

-- Урок 56
INSERT INTO visits (student_id, lesson_id, is_exists)
SELECT id, 56, true FROM students WHERE id BETWEEN 1 AND 75;

-- Урок 57
INSERT INTO visits (student_id, lesson_id, is_exists)
SELECT id, 57, true FROM students WHERE id BETWEEN 1 AND 75
UNION ALL
SELECT id, 57, false FROM students WHERE id IN (8, 22, 36, 51, 65, 73);

-- Урок 58
INSERT INTO visits (student_id, lesson_id, is_exists)
SELECT id, 58, true FROM students WHERE id BETWEEN 1 AND 75;

-- Урок 59
INSERT INTO visits (student_id, lesson_id, is_exists)
SELECT id, 59, true FROM students WHERE id BETWEEN 1 AND 75
UNION ALL
SELECT id, 59, false FROM students WHERE id IN (1, 11, 26, 43, 58, 70);

-- Урок 60
INSERT INTO visits (student_id, lesson_id, is_exists)
SELECT id, 60, true FROM students WHERE id BETWEEN 1 AND 75;

-- Урок 61
INSERT INTO visits (student_id, lesson_id, is_exists)
SELECT id, 61, true FROM students WHERE id BETWEEN 1 AND 75;

-- Урок 62
INSERT INTO visits (student_id, lesson_id, is_exists)
SELECT id, 62, true FROM students WHERE id BETWEEN 1 AND 75
UNION ALL
SELECT id, 62, false FROM students WHERE id IN (4, 15, 31, 47, 60, 72);

-- Урок 63
INSERT INTO visits (student_id, lesson_id, is_exists)
SELECT id, 63, true FROM students WHERE id BETWEEN 1 AND 75;

-- Урок 64
INSERT INTO visits (student_id, lesson_id, is_exists)
SELECT id, 64, true FROM students WHERE id BETWEEN 1 AND 75
UNION ALL
SELECT id, 64, false FROM students WHERE id IN (9, 24, 41, 56, 68);

-- Урок 65
INSERT INTO visits (student_id, lesson_id, is_exists)
SELECT id, 65, true FROM students WHERE id BETWEEN 1 AND 75;

-- Урок 66
INSERT INTO visits (student_id, lesson_id, is_exists)
SELECT id, 66, true FROM students WHERE id BETWEEN 1 AND 75;

-- Урок 67
INSERT INTO visits (student_id, lesson_id, is_exists)
SELECT id, 67, true FROM students WHERE id BETWEEN 1 AND 75
UNION ALL
SELECT id, 67, false FROM students WHERE id IN (2, 13, 29, 46, 63, 74);

-- Урок 68
INSERT INTO visits (student_id, lesson_id, is_exists)
SELECT id, 68, true FROM students WHERE id BETWEEN 1 AND 75;

-- Урок 69
INSERT INTO visits (student_id, lesson_id, is_exists)
SELECT id, 69, true FROM students WHERE id BETWEEN 1 AND 75;

-- Урок 70
INSERT INTO visits (student_id, lesson_id, is_exists)
SELECT id, 70, true FROM students WHERE id BETWEEN 1 AND 75
UNION ALL
SELECT id, 70, false FROM students WHERE id IN (6, 18, 37, 54, 67);

