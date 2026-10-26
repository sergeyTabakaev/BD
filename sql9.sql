/*Работа с подзапросами*/
/*Простой подзапрос*/
SELECT 
    *
FROM
    exams
WHERE
    teacher = (SELECT 
            idteacher
        FROM
            teachers
        WHERE
            name = 'Яровая Евгения Анатольевна');

/*Использование агрегатной функции для возврата единственного значения при выполнении подзапроса*/
SELECT 
    *
FROM
    teachers
WHERE
    stage > (SELECT 
            AVG(stage)-10
        FROM
            teachers
        WHERE
            city = 'Новосибирск');

/*Применение агрегатной функции в подзапросе при оценке успеваемости студентов*/
SELECT 
    *
FROM
    exams
WHERE
    `mark_exam` > (SELECT 
            AVG(mark_exam)
        FROM
            exams
        WHERE
            subj = 10);

/*Использование оператора IN с подзапросами*/
SELECT 
    *
FROM
    exams
WHERE
    teacher IN (SELECT 
            idteacher
        FROM
            teachers
        WHERE
            name like 'С%' or name like 'П%');
            
/*Использование группировки в основном запросе*/
SELECT 
    stage, COUNT(idteacher)
FROM
    teachers
GROUP BY stage
HAVING stage < (SELECT 
        AVG(stage)
    FROM
        teachers
    WHERE
        city = 'Новосибирск');

/*Коррелированные (связанные) подзапросы*/
/*Отбор преподавателей, прнимающих экзамены или зачёты 9.09.2026 при помощи связанного подзапроса*/
SELECT 
    *
FROM
    teachers `outer`
WHERE
    '2026-09-09' IN (SELECT 
            date_exam
        FROM
            exams `inner`
        WHERE 
            `outer`.idteacher = `inner`.teacher); 

/*Поиск преподавателей, принявших экзамен или зачёт у более, чем одного студента*/
SELECT 
    main.`name`
FROM
    teachers main
WHERE
    1 < (SELECT 
            COUNT(*)
        FROM
            exams
        WHERE
            main.idteacher=teacher);
/* коррелированный запрос в виде автосвязи таблицы с собой */
/*Среднее значение считается для каждой записи в таблицы по отдельности*/
SELECT 
    *
FROM
    exams `outer`
WHERE
    mark_exam > (SELECT 
            AVG(mark_exam)
        FROM
            exams `inner`
        WHERE
            `inner`.student = `outer`.student);