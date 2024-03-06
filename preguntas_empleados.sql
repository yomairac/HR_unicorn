#1. Escriba una consulta en SQL para mostrar el nombre, el apellido, el número de departamento 
#y el nombre del departamento de cada empleado.
SELECT 
      nombre_empleado, apellido_empleado,departamentos.id_departamento,nombre_departamento
FROM 
      hr_unicorn.empleados 
LEFT JOIN 
       hr_unicorn.departamentos ON  empleados .id_departamento=departamentos.id_departamento;

#2. Escriba una consulta en SQL para mostrar el nombre y apellido, departamento, ciudad y provincia de cada empleado

SELECT 
	  nombre_empleado, apellido_empleado, nombre_departamento, ciudad , estado_provincia
FROM 
     hr_unicorn.empleados
LEFT JOIN
     hr_unicorn.departamentos on empleados.id_departamento= departamentos.id_departamento
LEFT JOIN  
	hr_unicorn.ubicaciones on departamentos.id_ubicacion= ubicaciones.id_ubicacion;

#3. **E**scriba una consulta en SQL para mostrar el nombre, el apellido, el salario 
#y la categoría laboral de todos los empleados.
SELECT 
	nombre_empleado, apellido_empleado, salario, titulo_trabajo
FROM
     hr_unicorn.empleados
LEFT JOIN hr_unicorn.trabajos on hr_unicorn.empleados.id_trabajo= hr_unicorn.trabajos.id_trabajo;


#4. Escriba una consulta en SQL para mostrar el nombre, el apellido, el número de departamento 
#y el nombre del departamento para todos los empleados de los departamentos 80 o 40.
SELECT 
	 nombre_empleado, apellido_empleado,empleados.id_departamento, nombre_departamento
FROM
     hr_unicorn.empleados
LEFT JOIN 
	hr_unicorn.departamentos on   hr_unicorn.empleados.id_departamento = hr_unicorn.departamentos.id_departamento
WHERE 
     hr_unicorn.departamentos.id_departamento IN (80, 40)
	#OTRA manera   WHERE hr_unicorn.departamentos.id_departamento =80 OR hr_unicorn.departamentos.id_departamento=40
;
	
#5. Escriba una consulta en SQL para mostrar aquellos empleados que contengan una letra z en su nombre 
#y también muestre su apellido, departamento, ciudad y provincia del estado

SELECT 
     nombre_empleado, apellido_empleado, nombre_departamento, ciudad, estado_provincia
FROM 
    hr_unicorn.empleados
LEFT JOIN 
    hr_unicorn.departamentos on   hr_unicorn.empleados.id_departamento = hr_unicorn.departamentos.id_departamento
LEFT JOIN 
	hr_unicorn.ubicaciones on  	hr_unicorn.ubicaciones.id_ubicacion= hr_unicorn.departamentos.id_ubicacion
WHERE 
   nombre_empleado like "%z%"
        
;
     
