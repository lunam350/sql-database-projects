SET FOREIGN_KEY_CHECKS = 0;

DROP TABLE dept_emp_latest_date;
DROP TABLE dept_emp;
DROP TABLE dept_manager;
DROP TABLE titles;
DROP TABLE departments;

SET FOREIGN_KEY_CHECKS = 1;
--------------------- 	Creacion del usuario dba.
CREATE USER 'dba'@'localhost' IDENTIFIED BY 'custom-user-1';
GRANT ALL PRIVILEGES ON dabu_employees.* TO 'dba'@'localhost';
--------------------- 	Creacion del rol dev.
CREATE ROLE dev;
--------------------- 	Verificar usuarios creados
SELECT User, Host FROM mysql.user;
--------------------- 	Creación de usuarios dev
CREATE USER 'devAlpha'@'localhost' IDENTIFIED BY 'custom-user-2';
CREATE USER 'devBeta'@'localhost' IDENTIFIED BY 'custom-user-3';
--------------------- 	Asignar rol
GRANT dev TO 'devAlpha'@'localhost';
GRANT dev TO 'devBeta'@'localhost';
--------------------- 	Permisos para el rol dev
GRANT SELECT, INSERT ON dabu_employees.salaries TO dev;
GRANT SELECT, INSERT ON dabu_employees.employees TO dev;
---------------------	Asignar rol dev a usuarios devAlpha y devBeta
GRANT dev TO 'devAlpha'@'localhost';
GRANT dev TO 'devBeta'@'localhost';
---------------------	Documentar la creación del usuario cta
CREATE USER 'cta'@'localhost' IDENTIFIED BY 'custom-user-4';
GRANT SELECT, INSERT ON dabu_employees.departments TO 'cta'@'localhost';
---------------------	Creación del usuario rh
CREATE USER 'rh'@'localhost' IDENTIFIED BY 'custom-user-5';
GRANT SELECT, INSERT ON dabu_employees.employees TO 'rh'@'localhost';
--------------------		Ingreso de nuevo empleado
INSERT INTO dabu_employees.employees (
    emp_no, birth_date, first_name, last_name, gender, hire_date
)
VALUES (
    11111, 
    '1994-12-14', -- tu fecha de nacimiento
    'Manuel',     -- tu nombre
    'Luna',       -- tu apellido
    'M',          -- tu género
    CURDATE()     -- fecha de hoy
);
SELECT User, Host FROM mysql.user;
