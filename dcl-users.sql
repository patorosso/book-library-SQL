use library;

/* creamos usuario 1 */
CREATE USER prueba@ReadOnlyUser IDENTIFIED BY 'password1';

/* damos permiso de solo lectura en todas las tablas de library*/
GRANT SELECT ON library.* to  prueba@ReadOnlyUser;



/* creamos usuario 2 */
CREATE USER prueba@ReadAndWriteUser IDENTIFIED BY 'password2';

/* damos permiso de solo lectura en todas las tablas de library*/
GRANT SELECT ON library.* to  prueba@ReadAndWriteUser;


/* damos permiso de insertar en todas las tablas de library*/
GRANT INSERT ON library.* to  prueba@ReadAndWriteUser;

/* damos permiso de modificar en todas las tablas de library*/
GRANT UPDATE ON library.* to  prueba@ReadAndWriteUser;