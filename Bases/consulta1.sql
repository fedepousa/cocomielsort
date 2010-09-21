SELECT nombre 'Nombre de la Sala', declaraciones 'Cantidad de Declaraciones'
FROM sala, (
	SELECT id_sala, count( * ) declaraciones
	FROM juzgado, (
		SELECT id_juzgado
		FROM secretaria, (
			SELECT id_secretaria
			FROM causas, (
				SELECT *
				FROM movimiento
				WHERE id
				IN (
					SELECT id_movimiento
					FROM declaraciones
				)
				) AS movConDec
			WHERE movConDec.id_causa = causas.id
			)secConDec
		WHERE secConDec.id_secretaria = secretaria.id
		) AS juzConDec
	WHERE juzConDec.id_juzgado = juzgado.id
	GROUP BY id_sala
	) AS salaConDec
WHERE sala.id = salaConDec.id_sala
ORDER BY declaraciones DESC
LIMIT 0 , 30
