/*Соединение таблицы с циклическими зависимостями с собой*/
SELECT 
    `first`.idteacher, `first`.`name` as 'ФИО начальника', `second`.`name` as 'ФИО подчинённого'
FROM
    teachers `first`,
    teachers `second`
WHERE
    `first`.idteacher = `second`.nach;
/*Поиск некорректных сведений в базе данных при помощи запросов с соединениями*/
/*Соединение дисциплин и преподавателей */
SELECT 
    teachers.`name`, subjects.name_s
FROM
    teachers,
    subjects,
    subj_teachers
WHERE
    teachers.idteacher = subj_teachers.teacher
        AND subjects.idsubject = subj_teachers.`subject`;
/*Некорректный поиск преподавателей, принимающих аттестацию по "чужому" предмету*, так как в таблице
subj_teachers связь между предметами и преподавателями имеет тип "многие-ко-многим"*/
SELECT 
    *
FROM
    exams,
    subj_teachers
WHERE
    exams.teacher = subj_teachers.teacher
        AND exams.subj <> subj_teachers.`subject`;
/*Выводим приём "своих" дисциплин*/
SELECT 
    exams.teacher, exams.subj
FROM
    exams,
    subj_teachers
WHERE
	exams.teacher = subj_teachers.teacher
        AND exams.subj = subj_teachers.`subject`;

/*Для соединения "многие-к-одному" запрос выводит список преподавателей, которые принимали не свою дисциплину*/        
SELECT 
    teacher, subj, subj_id
FROM
    exams,
    teachers
WHERE
    exams.teacher = teachers.idteacher
        AND exams.subj <> teachers.`subj_id`;
/*Соединения для поиска образцов*/
SELECT 
    a.`name` AS '4.030.2.25',
    b.`name` AS '4.100.2.26',
    c.`name` AS '4.130.1.25',
    d.`name` AS '4.025.1.26'
FROM
    students a,
    students b,
    students c,
    students d
WHERE
    a.`group` = '4.030.2.25'
        AND b.`group` = '4.100.2.26'
        AND c.`group` = '4.130.1.25'
        AND d.`group` = '4.025.1.26';