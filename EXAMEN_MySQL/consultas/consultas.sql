use medisitema;
# Consultas



SELECT 
    m.id_medico,
    p.nombre,
    p.apellido,
    COUNT(a.id_atencion) AS pacientes_atendidos
FROM medico m
JOIN persona p ON m.id_medico = p.id_persona
LEFT JOIN atencion_medica a ON m.id_medico = a.id_medico
GROUP BY m.id_medico, p.nombre, p.apellido;

SELECT 
    e.id_empleado,
    p.nombre,
    p.apellido,
    SUM(CASE 
        WHEN v.estado = 'planificada' 
        THEN DATEDIFF(v.fecha_fin, v.fecha_inicio) + 1 
        ELSE 0 
    END) AS dias_planificados,
    SUM(CASE 
        WHEN v.estado = 'disfrutada' 
        THEN DATEDIFF(v.fecha_fin, v.fecha_inicio) + 1 
        ELSE 0 
    END) AS dias_disfrutados
FROM empleado e
JOIN persona p ON e.id_empleado = p.id_persona
LEFT JOIN vacacion v ON e.id_empleado = v.id_persona
GROUP BY e.id_empleado, p.nombre, p.apellido;

SELECT 
    m.id_medico,
    p.nombre,
    p.apellido,
    SUM(TIME_TO_SEC(h.hora_fin) - TIME_TO_SEC(h.hora_inicio)) / 3600 AS horas_consulta_semana
FROM medico m
JOIN persona p ON m.id_medico = p.id_persona
JOIN horario_consulta h ON m.id_medico = h.id_medico
GROUP BY m.id_medico, p.nombre, p.apellido
ORDER BY horas_consulta_semana DESC;

SELECT 
    m.id_medico,
    p.nombre,
    p.apellido,
    COUNT(s.id_sustitucion) AS numero_sustituciones
FROM medico m
JOIN persona p ON m.id_medico = p.id_persona
LEFT JOIN sustitucion s ON m.id_medico = s.id_medico_sustituto
GROUP BY m.id_medico, p.nombre, p.apellido;

SELECT COUNT(DISTINCT id_medico_titular) AS medicos_en_sustitucion
FROM sustitucion
WHERE CURDATE() BETWEEN fecha_inicio AND fecha_fin;


SELECT 
    m.id_medico,
    p.nombre,
    p.apellido,
    h.dia_semana,
    SUM(TIME_TO_SEC(h.hora_fin) - TIME_TO_SEC(h.hora_inicio)) / 3600 AS horas_totales
FROM medico m
JOIN persona p ON m.id_medico = p.id_persona
JOIN horario_consulta h ON m.id_medico = h.id_medico
GROUP BY m.id_medico, p.nombre, p.apellido, h.dia_semana
ORDER BY m.id_medico;



SELECT 
    m.id_medico,
    p.nombre,
    p.apellido,
    COUNT(pa.id_paciente) AS pacientes_asignados
FROM medico m
JOIN persona p ON m.id_medico = p.id_persona
LEFT JOIN paciente pa ON m.id_medico = pa.id_medico_asignado
GROUP BY m.id_medico, p.nombre, p.apellido
ORDER BY pacientes_asignados DESC
LIMIT 1;


SELECT 
    e.id_empleado,
    p.nombre,
    p.apellido,
    SUM(DATEDIFF(v.fecha_fin, v.fecha_inicio) + 1) AS dias_disfrutados
FROM empleado e
JOIN persona p ON e.id_empleado = p.id_persona
JOIN vacacion v ON e.id_empleado = v.id_persona
WHERE v.estado = 'disfrutada'
GROUP BY e.id_empleado, p.nombre, p.apellido
HAVING dias_disfrutados > 10;



SELECT DISTINCT
    m.id_medico,
    p.nombre,
    p.apellido
FROM medico m
JOIN persona p ON m.id_medico = p.id_persona
JOIN sustitucion s ON m.id_medico = s.id_medico_sustituto
WHERE CURDATE() BETWEEN s.fecha_inicio AND s.fecha_fin;


SELECT 
    m.id_medico,
    p.nombre,
    p.apellido,
    h.dia_semana,
    AVG(TIME_TO_SEC(h.hora_fin) - TIME_TO_SEC(h.hora_inicio)) / 3600 AS promedio_horas
FROM medico m
JOIN persona p ON m.id_medico = p.id_persona
JOIN horario_consulta h ON m.id_medico = h.id_medico
GROUP BY m.id_medico, p.nombre, p.apellido, h.dia_semana;

