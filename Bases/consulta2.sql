SELECT DISTINCT nombre
FROM abogado AS a, concurso AS c, acargo, inscripcion AS i, norma AS n, secretario AS s
WHERE   (a.cuil = acargo.cuil_abogado OR a.cuil = s.cuil_abogado) 
        -- El abogado a fue nombrado juez o secretario
        
        AND a.cuil = i.cuil_abogado 
        -- La inscripcion i corresponde al abogado a
        
        AND c.id = i.id_concurso  
        -- La inscripcion i corresponde al concurso c
        
        AND c.id IN 
        -- El concurso c es el que esta vigente para la norma n.
        -- Es decir, c es el ultimo concurso antes de que se publicara la norma n.
            (
            SELECT id
            FROM concurso AS conc
            WHERE   conc.fecha <= n.fecha_publicacion
                    AND (conc.fecha >= ALL (
                        SELECT fecha
                        FROM concurso conc1
                        WHERE conc1.fecha <= n.fecha_publicacion
                        ))
            )
        AND EXISTS (    
        -- Existe un abogado inscripto en el mismo concurso,  
        -- con menor orden de merito, que
        -- no esta entre los nombrados jueces o secretarios.
            SELECT *
            FROM abogado AS abog, inscripcion AS insc
            WHERE   abog.cuil = insc.cuil_abogado 
                    -- La inscripcion insc corresponde al abogado abog.
                    AND insc.orden_merito < i.orden_merito  
                    -- El orden de merito de la inscripcion insc
                    -- es menor que el de la inscripcion i.
                    AND insc.id_concurso = i.id_concurso    
                    -- Las inscripciones insc e i 
                    -- corresponden al mismo concurso
                    AND NOT EXISTS (    
                    -- No esta nombrado el abogado abog por una norma que 
                    -- corresponda al concurso c.
                        SELECT *
                        FROM norma AS norm, acargo AS acargo2, secretario AS secretario2
                        WHERE  norm.fecha_publicacion <= n.fecha_publicacion 
                               -- La norma norm es anterior a la norma n
                               AND norm.fecha_publicacion >= c.fecha    
                               -- El concurso c ya estaba vigente cuando 
                               -- se hizo la norma norm.
                               AND 
                               -- El abogado aparece nombrado juez o aparece nombrado 
                               -- secretario bajo la norma norm.
                                   (
                                       (acargo2.cuil_abogado = abog.cuil 
                                       -- El abogado abog aparece nombrado juez.
                                       AND norm.id = acargo2.id_norma 
                                       -- El nombramiento corresponde a la norma norm.
                                       ) 
                                    OR 
                                       (secretario2.cuil_abogado = abog.cuil 
                                       -- El abogado abog aparece nombrado secretario.
                                       AND norm.id = secretario2.id_norma 
                                       -- El nombramiento corresponde a la norma norm.
                                       ) 
                                   )
                        )
            )
        
