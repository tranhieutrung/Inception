# Commands

## Mariadb:
mariadb name: mariadb
docker exec -it [mariadb-container-name] mariadb -u [root/user] -p

```bash
cd Inception
docker exec -it [mariadb-container-name] mariadb -u [root/user] -p
[password]
```

- Example:
```bash
cd Inception
docker exec -it mariadb mariadb -u user -p
1234
```
![Run Mariadb](https://github.com/tranhieutrung/Inception/blob/main/images/run_mariadb.png)

```mariadb
SHOW DATABASES;
USE [database_name];
SHOW TABLES;
DESCRIBE [table_name];
SHOW COLUMNS FROM [table_name];
SELECT * FROM [table_name] LIMIT 5;

UPDATE [table_name]
SET [colume_name] = [new_value]
WHERE [condition]
```

- Example:
```mariadb
SHOW DATABASES;
USE wp_db;
SHOW TABLES;
DESCRIBE wp_users;
```

![Mariadb commands](https://github.com/tranhieutrung/Inception/blob/main/images/mariadb_cm1.png)
![Mariadb commands](https://github.com/tranhieutrung/Inception/blob/main/images/mariadb_cm2.png)
