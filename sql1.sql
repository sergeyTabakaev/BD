/*Извлечение данных из таблиц*/

/* Простой запрос select*/
SELECT 
    `student`
FROM
    `exams`;
SELECT 
    `students`.`name`,
    `group`
FROM `test`.`students`;
SELECT `name` FROM `test`.`teachers`;

/*Использование DISTINCT для исключения избыточных данных*/
SELECT DISTINCT
    `group`
FROM
    `test`.`students`;
/*Отбор данных при помощи предложения WHERE*/
    SELECT 
    `exams`.`student`,
    `exams`.`teacher`,
    `exams`.`subj`,
    `exams`.`date_exam`,
    `exams`.`mark_exam`,
    `exams`.`mark`
FROM
    `test`.`exams`
WHERE
    mark_exam <> 5;
SELECT 
    `name`
FROM
    `test`.`students`
WHERE
    `name` = 'Хуголь Богдан';
/*Оператор like*/
SELECT 
    `name`
FROM
    `test`.`students`
WHERE
    `name` LIKE '%н';
;
/*Символы исключения для поиска % и _ в качестве значений*/
SELECT 
    `name`
FROM
    `test`.`students`
WHERE
    `name` LIKE '%$%%' ESCAPE '$';





