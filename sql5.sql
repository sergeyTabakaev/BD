/*Использование выражений в SQL-запросах*/
/*Простое арифметическое выражение для вычисления доли ставки для каждой дисциплины*/
SELECT 
    `subjects`.`idsubject`,
    `subjects`.`name_s`,
    `subjects`.`k_hours` / 950,
    `subjects`.`kaf`
FROM
    `test`.`subjects`;
/*Выражение можно использовать внутри агрегатных функций*/
SELECT 
    SUM(`subjects`.`k_hours` / 950 * 100) as 'Сумма долей ставки в процентах'
FROM
    `test`.`subjects`;
/*Дополнительные колонки с пояснениями*/
SELECT 
    SUM(`subjects`.`k_hours` / 950 * 100) as 'Сумма долей ставки', '%'
FROM
    `test`.`subjects`;

SELECT 
    `subjects`.`name_s`,
    `subjects`.`k_hours` / 950 *100 as 'Доля ставки',
    '%'
FROM
    `test`.`subjects`;
/*Фильтрация данных может использовать временной INTERVAL*/
SELECT 
    `name`, dob
FROM
    students
WHERE
    dob between  '2001-01-01' AND '2001-01-01' + INTERVAL 9 MONTH;
/*Использование дробного значения для временного интервала*/    
SELECT 
    *
FROM
    `exams`
WHERE
    date_exam BETWEEN CURDATE() - INTERVAL 2.5 WEEK AND CURDATE() + INTERVAL 5 DAY;
    
/*Условные выражения: CASE */
SELECT 
    CASE name
        WHEN 'Щепачёв Алексей Иванович' THEN 'Щипачёв Алексей Иванович'
    END as 'ФИО'
FROM
    teachers
    where `idteacher` = 1021;    
SELECT 
    CASE name
        WHEN 'Понкратьева Елена Сергеевна' THEN 'Панкратьева Елена Сергеевна' ELSE `name`
    END as 'ФИО'
FROM
    teachers;
    
/*Сортировка результатов запроса*/
/*По возрастанию*/
SELECT 
    `teachers`.`name`,
    `teachers`.`num_group`,
    `teachers`.`stage`
FROM
    `test`.`teachers`
ORDER BY `name`;
/*По убыванию*/
SELECT 
    `teachers`.`name`,
    `teachers`.`num_group`,
    `teachers`.`stage`
FROM
    `test`.`teachers`
ORDER BY `name` DESC;
/*Сортировка по нескольким столбцам*/
SELECT 
    `students`.`name`, `students`.`dob`, `students`.`group`
FROM
    `test`.`students`
ORDER BY `group` , `name`;
/*Сортировка агрегатной группы*/
SELECT 
    teacher, COUNT(mark_exam)
FROM
    exams
GROUP BY teacher
HAVING COUNT(mark_exam) <> 0
ORDER BY teacher DESC;
SELECT 
    teacher, COUNT(mark_exam)
FROM
    exams
GROUP BY teacher
HAVING COUNT(mark_exam) <> 0
ORDER BY COUNT(mark_exam) DESC , teacher;
/*Сортировка с указанием столбца по номеру*/
SELECT 
    teacher, COUNT(mark_exam)
FROM
    exams
GROUP BY teacher
HAVING COUNT(mark_exam) <> 0
ORDER BY 2 , 1;
/*Сортировка по столбцу, не появляющимся в результате выполнления запроса не одобряется*/
SELECT 
    `students`.`name`, `students`.`dob`, `students`.`group`
FROM
    `test`.`students`
ORDER BY idstudent;
