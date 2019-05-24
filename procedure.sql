DROP PROCEDURE IF EXISTS ROWPERROW;
DELIMITER ;; 

CREATE PROCEDURE ROWPERROW()
BEGIN
DECLARE n INT DEFAULT 0;
DECLARE i INT DEFAULT 0;
SELECT COUNT(*) FROM testing.s_user INTO n;
SET i=0;
WHILE i<n DO 
  INSERT IGNORE INTO lib_books.user_positions (id, name, created_at, updated_at) 
  SELECT NULL, Puesto, NULL, NULL  FROM testing.s_user LIMIT i,1;
  SET i = i + 1;
END WHILE;
End;
;;

DROP PROCEDURE IF EXISTS ROWPERROW;
DELIMITER ;; 

CREATE PROCEDURE ROWPERROW()
BEGIN
DECLARE n INT DEFAULT 0;
DECLARE i INT DEFAULT 0;
SELECT COUNT(*) FROM testing.s_user INTO n;
SET i=0;
WHILE i<n DO 
  INSERT IGNORE INTO lib_sa_core.s_user (id_s_user, s_username, s_userpwd, s_firstname, s_lastname, s_email, s_phone, s_charge, s_ustatus, s_user_ac, s_user_to_s_user_roll, s_user_to_s_user_dep, s_enumber, s_folder, s_picture, s_u_system, user_position_id, area_id, remember_token, created_at, updated_at, deleted_at) 
  SELECT NULL, No_Empleado, "$2y$10$mTCwqy54f4ee17LPaEmwb.oin4QiHgZO.B8ylA25ugnZdgRyegqDW", Nombre, CONCAT(Apellido_Materno, Apellido_Paterno), Correo, NULL, root, 1, "1,2", 1, 1, 2717170, "1_$2y$10$I7ZPxbbqj.9aUun8Y7gRturAzMQaUMut2ICmlOH00gXplhG2r1fA2", default, 1, NULL, NULL, NULL, NULL, NULL, NULL FROM testing.s_user LIMIT i,1;
  SET i = i + 1;
END WHILE;
End;
;;

CALL ROWPERROW();


CALL ROWPERROW();








/** INSERT USERS PROCEDURE **/
DROP PROCEDURE IF EXISTS ROWPERROW;
DELIMITER ;; 

CREATE PROCEDURE ROWPERROW()
BEGIN
DECLARE n INT DEFAULT 0;
DECLARE i INT DEFAULT 0;
SELECT COUNT(*) FROM testing.s_user INTO n;
SET i=0;
WHILE i<n DO 
  INSERT IGNORE INTO lib_sa_core.s_user (
      id_s_user, 
      s_username, 
      s_userpwd, 
      s_firstname, 
      s_lastname, 
      s_email, 
      s_phone, 
      s_charge, 
      s_ustatus, 
      s_user_ac, 
      s_user_to_s_user_roll, 
      s_user_to_s_user_dep, 
      s_enumber, 
      s_folder, 
      s_picture, 
      s_u_system, 
      user_position_id, 
      area_id, 
      remember_token, 
      created_at, 
      updated_at, 
      deleted_at) 
  SELECT NULL, 
  No_Empleado, 
  "$2y$10$mTCwqy54f4ee17LPaEmwb.oin4QiHgZO.B8ylA25ugnZdgRyegqDW", 
  Nombre, 
  CONCAT(Apellido_Materno, Apellido_Paterno), 
  Correo, 
  NULL, 
  "root", 
  1, 
  "1,2", 
  1, 
  1, 
  2717170, 
  "1_$2y$10$I7ZPxbbqj.9aUun8Y7gRturAzMQaUMut2ICmlOH00gXplhG2r1fA2", 
  "default", 
  1, 
  NULL, 
  NULL, 
  NULL, 
  "2019-05-15 00:00:00", 
  "2019-05-15 00:00:00",
  "2019-05-15 00:00:00" FROM testing.s_user LIMIT i,1;
  
  SET i = i + 1;
END WHILE;
End;
;;

CALL ROWPERROW();

/** SET RELATIONS WITH USER POSITIONS **/

DROP PROCEDURE IF EXISTS ROWPERROW;
DELIMITER ;; 

CREATE PROCEDURE ROWPERROW()
BEGIN
DECLARE n INT DEFAULT 0;
DECLARE i INT DEFAULT 0;
SELECT COUNT(*) FROM testing.s_user INTO n;
SET i=0;
WHILE i<n DO 
  UPDATE lib_sa_core.s_user SET user_position_id = (SELECT id FROM lib_books.user_positions WHERE name = (SELECT Puesto FROM testing.s_user LIMIT i,1) LIMIT 1) 
  WHERE s_username = (SELECT No_Empleado FROM testing.s_user LIMIT i,1);
  SET i = i + 1;
END WHILE;
End;
;;

CALL ROWPERROW();

/** SET RELATIONS WITH USER AREAS **/

DROP PROCEDURE IF EXISTS ROWPERROW;
DELIMITER ;; 

CREATE PROCEDURE ROWPERROW()
BEGIN
DECLARE n INT DEFAULT 0;
DECLARE i INT DEFAULT 0;
SELECT COUNT(*) FROM testing.s_user INTO n;
SET i=0;
WHILE i<n DO 
  UPDATE lib_sa_core.s_user SET area_id = (SELECT id FROM lib_books.areas WHERE name = (SELECT rea FROM testing.s_user LIMIT i,1) LIMIT 1) 
  WHERE s_username = (SELECT No_Empleado FROM testing.s_user LIMIT i,1);
  SET i = i + 1;
END WHILE;
End;
;;

CALL ROWPERROW();