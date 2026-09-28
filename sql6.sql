/*Запросы к нескольким таблицам*/
/*Декартовое произведение таблиц*/
SELECT 
    *
FROM
    students,
    `groups`;
    /*Фильтрация записей по условию совпадения значений в столбцах group и idgroup*/
SELECT 
    *
FROM
    students,
    `groups`
WHERE
    `group` = idgroup;
    /*Убрали лишние колонки перед соединением*/
SELECT 
    `name`, dob, napr
FROM
    students,
    `groups`
WHERE
    `group` = idgroup;
/*Соединение колонок с одинаковыми именами*/
/*Пример "неествественного" соединения - из соединяемых значений group ни один стоблец не содержит первичных ключей*/
SELECT 
    `teachers`.`name`, `teachers`.`group`, students.`name`
FROM
    `teachers`,
    students
WHERE
     `teachers`.`group` = students.`group`;
/*Добавляем группировку для соединённых таблиц*/
SELECT 
    `teachers`.`name`,
    `teachers`.`group`,
    COUNT(students.`name`)
FROM
    `teachers`,
    students
WHERE
    `teachers`.`group` = students.`group`
GROUP BY `teachers`.`name`;
/*"Неестественное" соединение, где city не участвует ни в одной связи*/
SELECT 
    students.name, teachers.name, students.city
FROM
    students,
    teachers
WHERE
    students.city = teachers.city
ORDER BY students.city;
/*Использование составных условий при соединении (отбор только кураторов)*/
SELECT 
    students.name, teachers.name, students.city
FROM
    students,
    teachers
WHERE
    teachers.`group` IS NOT NULL
        AND students.city = teachers.city
ORDER BY students.city;
/*Произвольный пример использования неравеств при соединении*/
SELECT 
    exams.mark_exam, teacher, subj
FROM
    exams,
    subjects
WHERE
    exams.subj < subjects.idsubject
        AND mark_exam >= 4;