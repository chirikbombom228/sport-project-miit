# Все на спорт - проект для Дома Спорта РУТ (МИИТ)

## Подготовка к работе
1) Сначала форкните этот репозиторий себе на аккаунт
2) Через ```git clone``` скопируйте этот новый репозиторий и откройте его в IDE
3) проверьте что Git настроен правильно
4) Создайте свою отдельную ветку


## Deploy Гайд
### Создание .env файла
В корневой папке проекта создайте файл .env <strong>(прям так и назовите)</strong> и заполните его следующим
содержимым:
```dotenv
# === База данных ===
POSTGRES_USER=postgres
POSTGRES_PASSWORD=postgres
POSTGRES_DB=all-on-sport
POSTGRES_DB_PORT=5432
```
Значения можете поставить какие вам удобно (порт только не меняйте), этот файл нужен чтобы каждый мог
задавать нужные ему переменные среды, а в репозитории всё равно всё работало.

### Проверка работы PostgreSQL
В корневой папке проекта откройте терминал (CMD / PowerShell) и используйте команду
```shell
docker-compose -f docker-compose.dev.yaml up
```
Если база запустилась, то остановить сервисы можно командой
```shell
docker-compose -f docker-compose.dev.yaml stop
```
Или <strong>CTRL+C</strong>

## API Документация

### Глобальная обработка ошибок
Все API-запросы возвращают стандартный формат ошибки в случае неудачи.

| Код | Описание | Примечание |
| :--- | :--- | :--- |
| `400` | Bad Request | Ошибка в запросе (например, сущность уже существует или неверный формат данных) |
| `404` | Not Found | Запрашиваемый ресурс не найден |

---

### Посещаемость (`/api/visits`)
| Метод | Эндпоинт | Описание | Параметры / Тело | Ответ |
| :--- | :--- | :--- | :--- | :--- |
| GET | `/find-all` | Получить все записи о посещениях | - | `List<VisitDTO>` |
| GET | `/{id}` | Получить запись по ID | `id` (Путь) | `VisitDTO` |
| GET | `/student/{login}` | Посещения конкретного студента | `login` (Путь) | `List<VisitDTO>` |
| GET | `/lesson/{lessonId}` | Посещаемость конкретного занятия | `lessonId` (Путь) | `List<VisitDTO>` |
| GET | `/student/{login}/lesson/{lessonId}` | Посещение студента на конкретном занятии | `login`, `lessonId` (Путь) | `VisitDTO` |
| GET | `/range` | Посещения в диапазоне дат | `from`, `to` (Запрос) | `List<VisitDTO>` |
| GET | `/exists/{id}` | Проверить существование записи | `id` (Путь) | `boolean` |
| GET | `/get-total-absences/{studentLogin}` | Общее кол-во пропусков студента | `studentLogin` (Путь) | `Map<String, Integer>` |
| GET | `/students/absent/{lessonId}` | Список отсутствующих на занятии | `lessonId` (Путь) | `List<StudentDTO>` |
| GET | `/attendanceMap/{studentLogin}` | Карта посещаемости студента | `studentLogin` (Путь) | `Map<LocalDate, List<AttendanceInfo>>` |
| GET | `/attendancePercentage/{studentLogin}` | Процент посещаемости студента | `studentLogin` (Путь) | `Map<String, Double>` |
| POST | `/create` | Создать запись о посещении | `VisitCreationDTO` (Тело) | `VisitDTO` (201) |
| DELETE | `/delete/{id}` | Удалить запись по ID | `id` (Путь) | 204 No Content |
| DELETE | `/delete/student/{login}` | Удалить все посещения студента | `login` (Путь) | 204 No Content |
| DELETE | `/delete/lesson/{lessonId}` | Удалить все посещения занятия | `lessonId` (Путь) | 204 No Content |
| PUT | `/update/{id}/status/{exists}` | Обновить статус присутствия | `id`, `exists` (Путь) | 202 Accepted |

### Группы (`/api/group`)
| Метод | Эндпоинт | Описание | Параметры / Тело | Ответ |
| :--- | :--- | :--- | :--- | :--- |
| POST | `/create` | Создать новую группу | `GroupCreationDTO` (Тело) | `GroupDTO` (201) |
| GET | `/getAll` | Список всех групп | - | `List<GroupDTO>` |
| GET | `/{id}` | Группа по ID | `id` (Путь) | `GroupDTO` |
| GET | `/getByName` | Группа по имени | `name` (Запрос) | `GroupDTO` |
| GET | `/getByInstitute` | Группы института | `institute` (Запрос) | `List<GroupDTO>` |
| GET | `/id/{groupId}/students` | Студенты группы по ID | `groupId` (Путь) | `List<StudentDTO>` |
| GET | `/name/{groupName}/students` | Студенты группы по имени | `groupName` (Путь) | `List<StudentDTO>` |
| GET | `/studentsCount/{groupId}` | Кол-во студентов в группе | `groupId` (Путь) | `Map<String, Integer>` |
| GET | `/isEmpty/{groupId}` | Проверка: пуста ли группа | `groupId` (Путь) | `boolean` |
| GET | `/visitsGroupByRange` | Студенты с посещениями в диапазоне | `groupId`, `from`, `to` (Запрос) | `List<StudentDTO>` |
| PUT | `/transferStudents` | Перевод студентов между группами | `fromGroupId`, `toGroupId` (Запрос) | Void |
| DELETE | `/delete/{groupId}` | Удалить группу по ID | `groupId` (Путь) | 204 No Content |
| DELETE | `/deleteByName` | Удалить группу по имени | `groupName` (Запрос) | 204 No Content |
| PUT | `/update/{groupId}/name` | Обновить имя группы | `groupId` (Путь), `groupName` (Запрос) | `GroupDTO` (202) |
| PUT | `/update/{groupId}/institute` | Обновить институт группы | `groupId` (Путь), `groupInstitute` (Запрос) | `GroupDTO` (202) |

### Медицинские группы (`/api/healthGroup`)
| Метод | Эндпоинт | Описание | Параметры / Тело | Ответ |
| :--- | :--- | :--- | :--- | :--- |
| GET | `/{id}` | Мед. группа по ID | `id` (Путь) | `HealthGroupDTO` |
| GET | `/name/{name}` | Мед. группа по имени | `name` (Путь) | `HealthGroupDTO` |
| GET | `/find-all` | Список всех мед. групп | - | `List<HealthGroupDTO>` |
| GET | `/{id}/students` | Студенты мед. группы по ID | `id` (Путь) | `List<StudentDTO>` |
| GET | `/name/{name}/students` | Студенты мед. группы по имени | `name` (Путь) | `List<StudentDTO>` |
| GET | `/exists/name/{name}` | Проверка существования мед. группы | `name` (Путь) | `boolean` |
| GET | `/{id}/students/count` | Кол-во студентов в мед. группе | `id` (Путь) | `Integer` |
| GET | `/{id}/can-delete` | Проверка: можно ли удалить группу | `id` (Путь) | `boolean` |
| GET | `/{id}/students/details` | Детали студентов мед. группы | `id` (Путь) | `List<StudentDTO>` |
| POST | `/create` | Создать мед. группу | `HealthGroupCreationDTO` (Тело) | `HealthGroupDTO` (201) |
| DELETE | `/delete/{id}` | Удалить мед. группу по ID | `id` (Путь) | 204 No Content |
| DELETE | `/delete/name/{name}` | Удалить мед. группу по имени | `name` (Путь) | 204 No Content |
| PUT | `/update/{id}/name/{name}` | Обновить имя мед. группы | `id`, `name` (Путь) | Void (202) |
| PUT | `/update/{id}/description/{description}` | Обновить описание мед. группы | `id`, `description` (Путь) | Void (202) |

### Спортивные секции (`/api/section`)
| Метод | Эндпоинт | Описание | Параметры / Тело | Ответ |
| :--- | :--- | :--- | :--- | :--- |
| GET | `/get-all` | Список всех секций | - | `List<SectionDTO>` |
| GET | `/{id}` | Секция по ID | `id` (Путь) | `SectionDTO` |
| GET | `/by-name` | Секция по имени | `name` (Запрос) | `SectionDTO` |
| GET | `/section-student-by-section-id/{sectionId}/students` | Студенты секции по ID | `sectionId` (Путь) | `List<StudentDTO>` |
| GET | `/section-student-by-section-name/{sectionName}/students` | Студенты секции по имени | `sectionName` (Путь) | `List<StudentDTO>` |
| POST | `/create` | Создать спортивную секцию | `SectionCreationDTO` (Тело) | `SectionDTO` (201) |
| DELETE | `/delete/{id}` | Удалить секцию по ID | `id` (Путь) | 204 No Content |
| DELETE | `/delete/by-name` | Удалить секцию по имени | `name` (Запрос) | 204 No Content |
| PUT | `/update/{id}/name/{name}` | Обновить имя секции | `id`, `name` (Путь) | Void (202) |
| PUT | `/update/{id}/description/{description}` | Обновить описание секции | `id`, `description` (Путь) | Void (202) |

### Студенты (`/api/students`)
| Метод | Эндпоинт | Описание | Параметры / Тело | Ответ |
| :--- | :--- | :--- | :--- | :--- |
| GET | `/find-by-login` | Студент по логину | `login` (Запрос) | `StudentDTO` |
| GET | `/find-by-full-name` | Студенты по ФИО | `first-name`, `last-name`, `patronymic` (Запрос) | `List<StudentDTO>` |
| GET | `/find-all` | Список всех студентов | - | `List<StudentDTO>` |
| GET | `/find-by-group` | Студенты группы | `group-id` (Запрос) | `List<StudentDTO>` |
| GET | `/find-by-health-group` | Студенты мед. группы | `health-group-id` (Запрос) | `List<StudentDTO>` |
| GET | `/find-by-section` | Студенты секции | `section-id` (Запрос) | `List<StudentDTO>` |
| GET | `/find-by-first-name-last-name` | Студенты по имени и фамилии | `first-name`, `last-name` (Запрос) | `List<StudentDTO>` |
| GET | `/is-exists-by-login` | Проверка существования студента | `login` (Запрос) | `boolean` |
| POST | `/create` | Создать студента | `StudentCreationDTO` (Тело) | `StudentDTO` (201) |
| GET | `/schedule` | Расписание студента | `login` (Запрос) | `Map<LocalDate, String>` |
| DELETE | `/{id}` | Удалить студента по ID | `id` (Путь) | String |
| DELETE | `/by-login/{login}` | Удалить студента по логину | `login` (Путь) | String |
| PUT | `/update-full-name` | Обновить ФИО студента | `firstName`, `lastName`, `patronymic`, `login` (Запрос) | String |
| PUT | `/update-login` | Обновить логин студента | `newLogin`, `oldLogin` (Запрос) | String |
| PUT | `/update-health-group` | Обновить мед. группу студента | `healthGroupId` (Запрос), `login` (Запрос) | String |

### Преподаватели (`/api/teachers`)
| Метод | Эндпоинт | Описание | Параметры / Тело | Ответ |
| :--- | :--- | :--- | :--- | :--- |
| GET | `/find-by-login` | Преподаватель по логину | `login` (Запрос) | `TeacherDTO` |
| GET | `/find-by-full-name` | Преподаватели по ФИО | `first-name`, `last-name`, `patronymic` (Запрос) | `List<TeacherDTO>` |
| GET | `/find-all` | Список всех преподавателей | - | `List<TeacherDTO>` |
| GET | `/find-all-moderators` | Список всех модераторов | - | `List<TeacherDTO>` |
| GET | `/get-by-lesson-date` | Преподаватели на дату занятия | `date` (Запрос) | `List<TeacherDTO>` |
| GET | `/find-by-first-name-last-name` | Преподаватели по имени и фамилии | `first-name`, `last-name` (Запрос) | `List<TeacherDTO>` |
| GET | `/is-exists-by-login` | Проверка существования преподавателя | `login` (Запрос) | `boolean` |
| POST | `/create` | Создать преподавателя | `TeacherCreationDTO` (Тело) | `TeacherDTO` (201) |
| DELETE | `/{id}` | Удалить преподавателя по ID | `id` (Путь) | String |
| DELETE | `/by-login/{login}` | Удалить преподавателя по логину | `login` (Путь) | String |
| PUT | `/update-full-name` | Обновить ФИО преподавателя | `firstName`, `lastName`, `patronymic`, `login` (Запрос) | String |
| PUT | `/update-login` | Обновить логин преподавателя | `newLogin`, `oldLogin` (Запрос) | String |
| PUT | `/update-moderator` | Обновить статус модератора | `login` (Запрос), `moderator` (Запрос) | String |
| POST | `/create-lesson-for-future` | Создать занятие на будущее | `TeacherBusinessLessonCreationDTO` (Тело) | String |

### Дисциплины (`/api/discipline`)
| Метод | Эндпоинт | Описание | Параметры / Тело | Ответ |
| :--- | :--- | :--- | :--- | :--- |
| GET | `/findAll` | Список всех дисциплин | - | `List<DisciplineDTO>` |
| GET | `/{id}` | Дисциплина по ID | `id` (Путь) | `DisciplineDTO` |
| GET | `/findByName` | Дисциплина по имени | `name` (Запрос) | `DisciplineDTO` |
| GET | `/findByDisciplineId/{disciplineId}/lessons` | Занятия дисциплины по ID | `disciplineId` (Путь) | `List<LessonDTO>` |
| GET | `/findByDisciplineName/{disciplineName}/lessons` | Занятия дисциплины по имени | `disciplineName` (Путь) | `List<LessonDTO>` |
| GET | `/isExistsByName` | Проверка существования дисциплины | `disciplineName` (Запрос) | `boolean` |
| POST | `/create` | Создать дисциплину (через DTO) | `DisciplineCreationDTO` (Тело) | `DisciplineDTO` (201) |
| POST | `/createByName` | Создать дисциплину по имени | `name` (Тело: String) | `DisciplineDTO` (201) |
| GET | `/lessonsCount/{disciplineId}` | Кол-во занятий дисциплины | `disciplineId` (Путь) | `Map<String, Integer>` |
| GET | `/lessonsByDateRange` | Занятия дисциплины за период | `disciplineId`, `from`, `to` (Запрос) | `List<LessonDTO>` |
| GET | `/findById/{disciplineId}/lessonsWithTeacher` | Занятия с преподавателем по ID | `disciplineId` (Путь) | `List<LessonDTO>` |
| GET | `/canDelete/{disciplineId}` | Проверка: можно ли удалить дисциплину | `disciplineId` (Путь) | `boolean` |
| DELETE | `/delete/{disciplineId}` | Удалить дисциплину по ID | `disciplineId` (Путь) | 204 No Content |
| DELETE | `/deleteByName` | Удалить дисциплину по имени | `disciplineName` (Запрос) | 204 No Content |
| PUT | `/update/{disciplineId}` | Обновить имя дисциплины | `disciplineId` (Путь), `disciplineName` (Запрос) | `DisciplineDTO` (202) |

### Занятия (`/api/lessons`)
| Метод | Эндпоинт | Описание | Параметры / Тело | Ответ |
| :--- | :--- | :--- | :--- | :--- |
| GET | `/{id}` | Занятие по ID | `id` (Путь) | `LessonDTO` |
| GET | `/discipline-and-date` | Занятие по дисциплине и дате | `disciplineId`, `date` (Запрос) | `LessonDTO` |
| GET | `/find-all` | Список всех занятий | - | `List<LessonDTO>` |
| GET | `/date` | Занятия на дату | `date` (Запрос) | `List<LessonDTO>` |
| GET | `/teacher/{teacherId}` | Занятия преподавателя | `teacherId` (Путь) | `List<LessonDTO>` |
| GET | `/discipline/{disciplineId}` | Занятия дисциплины | `disciplineId` (Путь) | `List<LessonDTO>` |
| GET | `/discipline-name/{name}` | Занятия по имени дисциплины | `name` (Путь) | `List<LessonDTO>` |
| GET | `/range` | Занятия в диапазоне дат | `from`, `to` (Запрос) | `List<LessonDTO>` |
| GET | `/exists/{id}` | Проверка существования занятия | `id` (Путь) | `boolean` |
| GET | `/{id}/attendance` | Посещаемость занятия | `id` (Путь) | `List<VisitDTO>` |
| POST | `/{id}/attendance` | Отметить посещаемость студента | `id` (Путь), `studentLogin`, `present` (Запрос) | Void |
| GET | `/{id}/expected-students` | Список студентов, которые должны быть | `id` (Путь) | `List<StudentDTO>` |
| GET | `/{id}/attendance/count` | Кол-во записей о посещаемости | `id` (Путь) | `Integer` |
| GET | `/{id}/can-delete` | Проверка: можно ли удалить занятие | `id` (Путь) | `boolean` |
| GET | `/{id}/details` | Полные детали занятия | `id` (Путь) | `LessonDTO` |
| POST | `/{id}/attendance/bulk` | Массовая отметка посещаемости | `id` (Путь), `Map<String, Boolean>` (Тело) | Void |
| POST | `/create` | Создать новое занятие | `LessonCreationDTO` (Тело) | `LessonDTO` (201) |
| DELETE | `/delete/{id}` | Удалить занятие по ID | `id` (Путь) | 204 No Content |
| DELETE | `/delete/discipline/{id}` | Удалить занятия дисциплины | `id` (Путь) | 204 No Content |
| DELETE | `/delete/teacher/{id}` | Удалить занятия преподавателя | `id` (Путь) | 204 No Content |
| DELETE | `/delete/date/{date}` | Удалить занятия на дату | `date` (Путь) | 204 No Content |
| PUT | `/update/{id}/date/{date}` | Обновить дату занятия | `id`, `date` (Путь) | Void (202) |
| PUT | `/update/{id}/teacher/{teacher_id}` | Обновить преподавателя занятия | `id`, `teacher_id` (Путь) | Void (202) |
| PUT | `/update/{id}/discipline/{discipline_id}` | Обновить дисциплину занятия | `id`, `discipline_id` (Путь) | Void (202) |
