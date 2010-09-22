CREATE TRIGGER auditoria_concurso_ins AFTER INSERT ON concurso
FOR EACH ROW
INSERT INTO auditoria_concurso(tipo, new_id_camara, new_id_concurso,new_fecha, usuario, fecha)
VALUES ('Ins',NEW.id_camara, NEW.id,NEW.fecha, CURRENT_USER(), NOW());

CREATE TRIGGER auditoria_concurso_del AFTER DELETE ON concurso
FOR EACH ROW
INSERT INTO auditoria_concurso(tipo, old_id_camara, old_id_concurso,old_fecha,usuario, fecha)
VALUES ('Del',OLD.id_camara, OLD.id,OLD.fecha, CURRENT_USER(), NOW());

CREATE TRIGGER auditoria_concurso_upd AFTER UPDATE ON concurso
FOR EACH ROW
INSERT INTO auditoria_concurso(tipo, new_id_camara, new_id_concurso,old_id_camara,old_id_concurso, old_fecha,new_fecha,usuario, fecha)
VALUES ('Upd',NEW.id_camara, NEW.id,OLD.id_camara, OLD.id,OLD.fecha, NEW.fecha, CURRENT_USER(), NOW());


---------------------------------------------------------------------------------

CREATE TRIGGER auditoria_inscripcion_ins AFTER INSERT ON inscripcion
FOR EACH ROW
INSERT INTO auditoria_inscripcion(tipo, new_id, new_orden_merito, new_nombre_universidad, new_promedio, new_fecha_titulo, new_id_concurso, new_cuil_abogado, usuario, fecha)
VALUES ('Ins',NEW.id, NEW.orden_merito, NEW.nombre_universidad, NEW.promedio, NEW.fecha_titulo, NEW.id_concurso, NEW.cuil_abogado, CURRENT_USER() , NOW());

CREATE TRIGGER auditoria_inscripcion_del AFTER DELETE ON inscripcion
FOR EACH ROW
INSERT INTO auditoria_inscripcion(tipo, old_id, old_orden_merito, old_nombre_universidad, old_promedio, old_fecha_titulo, old_id_concurso, old_cuil_abogado, usuario, fecha)
VALUES ('Del',OLD.id, OLD.orden_merito, OLD.nombre_universidad, OLD.promedio, OLD.fecha_titulo, OLD.id_concurso, OLD.cuil_abogado, CURRENT_USER() , NOW());

CREATE TRIGGER auditoria_inscripcion_upd AFTER UPDATE ON inscripcion
FOR EACH ROW
INSERT INTO auditoria_inscripcion(tipo, old_id, old_orden_merito, old_nombre_universidad, old_promedio, old_fecha_titulo, old_id_concurso, old_cuil_abogado,new_id, new_orden_merito, new_nombre_universidad, new_promedio, new_fecha_titulo, new_id_concurso, new_cuil_abogado, usuario, fecha)
VALUES ('Upd',OLD.id, OLD.orden_merito, OLD.nombre_universidad, OLD.promedio, OLD.fecha_titulo, OLD.id_concurso, OLD.cuil_abogado,NEW.id, NEW.orden_merito, NEW.nombre_universidad, NEW.promedio, NEW.fecha_titulo, NEW.id_concurso, NEW.cuil_abogado, CURRENT_USER() , NOW());
