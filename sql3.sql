/*Операторы IN, BETWEEN, LIKE, IS NULL*/
/*IN*/
SELECT 
    *
FROM
    test.exams
WHERE
    student IN (100 , 101, 104)
        AND teacher = 1000;
SELECT 
    *
FROM
    exams
WHERE
    date_exam IN ('2026-09-14' , '2026-06-09', '2026-09-09');
/*BETWEEN*/
SELECT 
    *
FROM
    test.subjects
WHERE
    `k_hours` BETWEEN 20 AND 32;
SELECT 
    *
FROM
    teachers
WHERE
    stage BETWEEN 18 AND 21
        AND stage NOT IN (18 , 21);
/*Пример, когда начальное значение у BETWEEN больше, чем конечное. Результат неверный*/
SELECT 
    *
FROM
    test.subjects
WHERE
    `k_hours` BETWEEN 32 AND 20;
/*Использование BETWEEN со строками*/
SELECT 
    `name`, `stage`
FROM
    teachers
WHERE
    `name` BETWEEN 'Г' AND 'К';
    /*Для включения фамилий, начинающихся на букву "К" необходимо границей диапазона назначить букву "М"*/
SELECT 
    `name`, `stage`
FROM
    teachers
WHERE
    `name` BETWEEN 'Г' AND 'М';
/*Пример использования IS NULL и LIKE в сочетании с операторами IN и BETWEEN*/ 
SELECT 
    `name`, `stage`
FROM
    teachers
WHERE
    `name` BETWEEN 'К' AND 'П'
        OR `name` LIKE 'П%';  
SELECT 
    `name`, `stage`
FROM
    teachers
WHERE
    `name` IN ('Иванова Наталья Сергеевна', 'Ступин Андрей Анатольевич') 
        OR name LIKE 'П%';  
