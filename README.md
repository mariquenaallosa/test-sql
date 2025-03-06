# 📌 MySQL con Docker y Adminer

Este proyecto configura un entorno de base de datos MySQL usando Docker y Docker Compose. Además, incluye Adminer como herramienta de administración de base de datos.

## 📂 Estructura del Proyecto
```plaintext
/
│── docker-compose.yml   # Configuración de Docker Compose
│── .env                 # Variables de entorno (credenciales)
│── data_init.sql        # Script SQL de inicialización
│── data_seed.sql        # Script SQL para insertar datos de prueba
│── queries.sql          # Conjunto de consultas SQL organizadas
│── README.md            # Documentación del proyecto
```

## 🚀 Configuración y Uso

### 1️⃣ **Requisitos Previos**
- Tener instalado [Docker](https://www.docker.com/)
- Tener instalado [Docker Compose](https://docs.docker.com/compose/install/)

### 2️⃣ **Clonar repositorio**

```sh
   git clone https://github.com/mariquenaallosa/test-sql.git
   cd test-sql
```

### 3️⃣ **Variables de Entorno**
Configurar las credenciales en un archivo '.env':
```ini
MYSQL_ROOT_PASSWORD=root
MYSQL_DATABASE=testdb
MYSQL_USER=user
MYSQL_PASSWORD=password
```

### 4️⃣ **Levantar los Contenedores**
Ejecutar el siguiente comando:
```sh
docker-compose up -d
```

### 5️⃣ **Verificar los Contenedores**
Para asegurarte de que están corriendo:
```sh
docker ps
```

### 6️⃣ **Acceder a Adminer**
Abre el navegador y ve a: [http://localhost:8080](http://localhost:8080)
- **Servidor:** 'mysql'
- **Usuario:** 'user'
- **Contraseña:** 'password'
- **Base de Datos:** 'testdb'

## 📜 Descripción de los Archivos

### 'docker-compose.yml'
- Define los servicios de MySQL y Adminer.
- Usa un volumen persistente para la base de datos.
- Configura un 'healthcheck' para MySQL.

### 'data_init.sql'
- Crea la base de datos 'testdb'.
- Define las tablas necesarias.

### 'data_seed.sql'
- Inserta datos de prueba en las tablas creadas en 'data_init.sql'.

### 'queries.sql'
- Contiene un conjunto de consultas SQL organizadas para interactuar con la base de datos.

## 🛠 Comandos Útiles

📌 **Ver logs de MySQL**:
```sh
docker-compose logs -f mysql
```
📌 **Detener los contenedores**:
```sh
docker-compose down
```
📌 **Eliminar los volúmenes y contenedores**:
```sh
docker-compose down -v
```

## 🔍 Consultas SQL

### Ubicación de las Consultas
Las consultas SQL se encuentran en el archivo `queries.sql` en la raíz del proyecto.

### Ejecución de las Consultas

#### Usando Adminer
Para ejecutar las consultas SQL de manera sencilla, sigue estos pasos:

1. **Accede a Adminer:**
   Abre tu navegador y ve a: [http://localhost:8080](http://localhost:8080)

2. **Inicia sesión en Adminer:**
   - **Servidor:** `mysql`
   - **Usuario:** `user`
   - **Contraseña:** `password`
   - **Base de Datos:** `testdb`

3. **Ejecuta las Consultas:**
   - Una vez dentro de Adminer, selecciona la base de datos `testdb`.
   - Ve a la pestaña `SQL Command` o `Comando SQL`.
   - Copia y pega las consultas desde el archivo `queries.sql` y haz clic en `Execute` o `Ejecutar`.

#### Usando la Consola
También puedes ejecutar las consultas SQL desde la consola. Sigue estos pasos:

1. **Accede al contenedor de MySQL:**
   ```sh
   docker exec -it <nombre_del_contenedor_mysql> bash
   ```

2. **Conéctate a la base de datos MySQL:**
   ```sh
   mysql -u user -p
   ```

3. **Selecciona la base de datos:**
   ```sql
   USE testdb;
   ```

4. **Ejecuta las consultas copiando y pegando desde `queries.sql`:**
   ```sql
   -- Ejemplo de consulta
   SELECT id, name, short_description, long_description
   FROM products
   WHERE short_code <> 'X12345';
   ```
