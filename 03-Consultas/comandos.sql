#Seleccionar todos los datos de los clientes

SELECT * FROM cliente;


#Seleccionar todos los médicos con la profesión 'Veterinario'
SELECT *
FROM medico
WHERE medico.med_profesion = "Veterinario";


#Obtener los medicamentos que tienen una m en su nombre
SELECT * 
FROM medicamentos
WHERE medicamentos.med_nombre LIKE '%m%';

#Obtener los medicamentos que tienen su valor entre 40 y 1000
SELECT *
FROM medicamentos
WHERE medicamentos.med_valor BETWEEN 10 AND 15;

#Obtener solamente el nombre de los medicamentos cuya longitud este entre 1 y 10
SELECT medicamentos.med_nombre AS nombre_medicamento
FROM medicamentos
WHERE CHAR_LENGTH(medicamentos.med_nombre) BETWEEN 1 AND 10;


#Contar el número total de mascotas registradas
SELECT COUNT(*) AS total_mascotas FROM mascotas;

#Seleccionar los nombres únicos de las especializaciones:
SELECT DISTINCT especializacion.esp_nombre
FROM especializacion;

#Listar los medicamentos ordenados por valor de forma descendente
SELECT * 
FROM medicamentos
ORDER BY medicamentos.med_valor DESC;

#Seleccionar las citas programadas entre dos fechas
SELECT * 
FROM citas
WHERE citas.cit_fecha BETWEEN '2024-04-01' AND '2024-04-30';

# Obtener el nombre de la mascota y el nombre del cliente
SELECT mascotas.mas_nombre, cliente.cli_nombre
FROM mascotas
INNER JOIN cliente ON mascotas.cliente_cli_id = cliente.cli_id;

#Segunda forma 
SELECT mascotas.mas_nombre, cliente.cli_nombre
FROM mascotas,cliente
WHERE mascotas.cliente_cli_id = cliente.cli_id;


#Listar todas las mascotas y sus historias clínicas, incluyendo las mascotas sin 
#historias clínicas

SELECT mascotas.mas_nombre, historias_clinicas.his_descripcion
FROM mascotas
LEFT JOIN historias_clinicas 
ON historias_clinicas.his_id = mascotas.historias_clinicas_his_id;

#Calcular el costo total por cada tipo de servicio
SELECT especializacion.esp_nombre, CONCAT("$",SUM(servicio.ser_costo))  AS precio_total
FROM servicio
INNER JOIN especializacion 
ON especializacion.esp_id = servicio.especializacion_esp_id
group by servicio.especializacion_esp_id;

# Obtener una lista de citas con un estado 'Pendiente' o 'Realizado' basado en el 
#valor de cit_estado

SELECT citas.cit_fecha, 
CASE 
	WHEN citas.cit_estado = 0 THEN 'Pendiente'
    WHEN citas.cit_estado = 1 THEN 'Realizado'
END AS estado_cita
FROM citas;


#Obtener los nombres de las mascotas, el procedimiento del servicio que 
#recibieron, y el nombre de su médico:
SELECT citas.cit_fecha, mascotas.mas_nombre, servicio.ser_procedimiento,
medico.med_nombre
FROM citas
INNER JOIN mascotas ON mascotas.mas_id = citas.mascotas_mas_id
INNER JOIN servicio ON servicio.ser_id = citas.servicio_ser_id
INNER JOIN medico ON medico.med_id = citas.medico_med_id;