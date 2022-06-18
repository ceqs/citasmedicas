## Citas Medicas en Línea

Para levantar el proyecto ejecute los siguientes pasos:

1. Cree una base de datos en MySQL, el schema debe llamarse "citasmedicas"
2. En el archivo MySQLConexion.java cambie los datos de conexión, es ideal que mantenga
los datos de conexión y de usuario y password ya configurados para que no tenga que cambiar nada.
Por ejemplo, usuario root y password root.
2. En la carpeta src/test/java/resource existe un archivo script.sql, ese archivo
contiene el script necesario para crear un setup de la base de datos, inclusive precarga
los datos de configuración.
3. Ejecute el archivo desde el MySQLWorkbench.
4. Este proyecto esta en Maven, para setear el proyecto ejecute
```
mvn clean install
```
Con este comando podrá configurar todo el proyecto y dejarlo listo para ejecutar,
5. Ejecute con Run File el archivo Menu.jsp, con ello el sistema levantará correctamente.