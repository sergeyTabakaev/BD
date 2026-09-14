/*Логические операторы в предикатах*/

/*Пример применения оператора "ИЛИ"*/
SELECT 
    `name`, `group`
FROM
    `test`.`students`
WHERE
    `group` = '4.130.1.25'
        OR `group` = '4.100.2.26';
/*Пример применения оператора "И"*/    
SELECT 
    `name`, `group`
FROM
    `test`.`students`
WHERE
    `group` <> '4.130.1.25'
        AND `dob` > '2000-12-31';
/*Пример отсутствия в предикате оператора сравнения (в отбор попадают все значения, кроме NULL)*/        
SELECT 
    `name`, `group`
FROM
    `test`.`students`
WHERE
    `group`
        AND `dob` > '2000-12-31';
/*Пример некорректного сравнения значения поля с неизвестным значением, которое приводит к неизвестному результату*/
SELECT 
    `name`, `group`
FROM
    `test`.`students`
WHERE
    `group` <> NULL
        AND `dob` > '2000-12-31';  
/*Пример некорректного использования операнда `group` <> NULL, вычисление которого не влияет на результат отбора*/        
SELECT 
    `name`, `group`
FROM
    `test`.`students`
WHERE
    `group` <> NULL
        OR `dob` > '2000-12-31';
        
/*Примеры операций с NULL-значениями*/
SELECT 
    `name`, `group`
FROM
    `test`.`students`
WHERE
    `group` IS NOT NULL
        AND `dob` > '2000-12-31';
SELECT 
    `name`, `group`
FROM
    `test`.`students`
WHERE
    `group` IS NULL
        AND `dob` > '2000-12-31';
/*"Неожиданный" результат при использовании операторов сравнения с NULL*/
SELECT 
    `name`, `group`
FROM
    `test`.`students`
WHERE
    `group` <> NULL;
SELECT 
    `name`, `group`
FROM
    `test`.`students`
WHERE
    `group` = NULL;
/*Опретор IS NULL  и IS NOT NULL*/
SELECT 
    `name`, `group`
FROM
    `test`.`students`
WHERE
    `group` IS NULL;
SELECT 
    `name`, `group`
FROM
    `test`.`students`
WHERE
    `group` IS NOT NULL;
    /* Пример неверного использования оператора IS NULL
SELECT 
    `name`, `group`
FROM
    `test`.`students`
WHERE
    `group` NOT IS NULL;
    */
/*Пример использования длинного предиката с изменением приориретов выполняемых операций*/
SELECT 
    *
FROM
    test.exams
WHERE
    NOT (subj > 10
        AND (teacher = 1000 OR teacher = 1001))
        AND (mark_exam IS NOT NULL
        OR mark IS NOT NULL);

