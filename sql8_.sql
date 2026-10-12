/*Специальные операции соединения таблиц*/
/*CROSS JOIN - декартово произведение таблиц*/
/*Поддержка разных способов получения декартова произведения нужна для совместимости запросов с другими СУБД*/
SELECT 
    *
FROM
    `students`
        CROSS JOIN
    `groups`;

/*Использование соединений JOIN с указанием общих значений 
(названия полей в разных таблицах должны быть одинаковыми)*/

SELECT 
    *
FROM
    test.subj_teachers
        JOIN
    test.exams USING (`teacher`);
    
/*Этот вариант соответствует стандартной операции NATURAL JOIN*/
/*"Естественное" соединение двух таблиц*/
SELECT 
    *
FROM
    test.subj_teachers
        NATURAL JOIN
    test.exams;
/*В случае отсутствия совпадающих названий полей получаем декартово произведение*/
SELECT 
    *
FROM
    test.teachers
        NATURAL JOIN
    test.exams;
/*JOIN students и teachers по общему городу проживания*/
SELECT 
    students.name, teachers.name, students.city
FROM
    test.teachers
        JOIN
    test.students USING (`city`);
/*"Внутреннее" содениение - INNER JOIN*/
SELECT 
    students.name, teachers.name, students.city
FROM
    test.teachers
        INNER JOIN
    test.students USING (`city`);
/*Внешние соединения*/
/* При "левом" соединении из первой таблицы выводятся все записи, а из правой таблицы 
несопоставленные им значения заменяются значением NULL*/
SELECT 
    teachers.name as 'Преподаватель', teachers.city as 'Город преподавателя', 
    students.name as 'Студент', students.city as 'Город студента'
FROM
    test.teachers
        LEFT OUTER JOIN
    test.students USING (`city`);
/* При "правом" соединении из второй таблицы выводятся все записи, а из первой таблицы 
несопоставленные им значения заменяются значением NULL*/
SELECT 
    teachers.name as 'Преподаватель', teachers.city as 'Город преподавателя', 
    students.name as 'Студент', students.city as 'Город студента'
FROM
    test.teachers
        RIGHT OUTER JOIN
    test.students USING (`city`);
/*Полное внешнее соединение (FULL OUTER JOIN) реализуется в mysql 
при помощи объединения "левого" и "правого" соединений*/
/*В примере используем дополнительные условия в предложения where для фильтрации результатов каждого запроса*/
SELECT 
    teachers.name as 'Преподаватель', teachers.city as 'Город преподавателя', 
    students.name as 'Студент', students.city as 'Город студента'
FROM
    test.teachers
        LEFT OUTER JOIN
    test.students USING (`city`)
where 
students.city is null 
    UNION
SELECT 
    teachers.name as 'Преподаватель', teachers.city as 'Город преподавателя', 
    students.name as 'Студент', students.city as 'Город студента'
FROM
    test.teachers
        RIGHT OUTER JOIN
    test.students USING (`city`)
where 
students.city is null or teachers.city is null;

/*Внутреннее соединение при помощи JOIN (INNER JOIN) и ON*/
SELECT 
    students.name as 'Студент', students.city as 'Город студента', `groups`.idgroup as 'Номер группы', `groups`.napr as 'Направление'
FROM
    test.`groups`
       JOIN
    test.students ON `students`.`group` = `groups`.idgroup
order by students.name;
/*Соединение 4-х таблиц "студенты", "экзамены", "дисциплины" и преподаватели при помощи последовательного применения JOIN
Каждое последующее соединение использует таблицу, полученную в результате предыдущего соединения
*/
SELECT 
    students.name AS 'Студент', exams.mark_exam as 'Оценка за экзамен', subjects.name_s as 'Дисциплина', teachers.name 'Преподаватель'
FROM
    students
        LEFT JOIN
    exams ON exams.student = students.idstudent 
		RIGHT JOIN subjects ON exams.subj = subjects.idsubject 
		JOIN teachers ON idteacher = exams.teacher;
        
/* Использование JOIN для соединения таблиц exams, students, 
subjects и teachers*/
SELECT 
    students.name AS 'Студент', exams.mark_exam as 'Оценка за экзамен', exams.mark as 'Оценка за зачёт', 
    subjects.name_s as 'Дисциплина', teachers.name as 'Преподаватель'
FROM
    exams JOIN students on students.idstudent = exams.student 
    JOIN subjects ON exams.subj = subjects.idsubject 
    JOIN teachers ON idteacher = exams.teacher;



