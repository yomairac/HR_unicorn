#6. Escriba una consulta en SQL para mostrar todos los departamentos, incluidos aquellos donde no tiene ningún empleado.
		SELECT 
			 departamentos.*, empleados.nombre_empleado
		FROM 
			 hr_unicorn.departamentos
		LEFT JOIN  
			 hr_unicorn.empleados on  hr_unicorn.departamentos.id_departamento=hr_unicorn.empleados.id_departamento
;
#Aqui tendriamos solo los departemntos que no tienen empleados
SELECT 
     departamentos.*, empleados.nombre_empleado
FROM 
     hr_unicorn.departamentos
LEFT JOIN 
	hr_unicorn.empleados on  hr_unicorn.departamentos.id_departamento=hr_unicorn.empleados.id_departamento
WHERE 
    isnull(nombre_empleado)
;


# Si quisieramos contar el nunmero de Nulos
sELECT 
    COUNT(*) AS cantidad_null_hoy
FROM (
    SELECT 
        departamentos.*, empleados.nombre_empleado
    FROM 
        hr_unicorn.departamentos
    LEFT JOIN 
        hr_unicorn.empleados ON hr_unicorn.departamentos.id_departamento = hr_unicorn.empleados.id_departamento
) AS union_tablas
WHERE 
    nombre_empleado IS NULL;

#7. Escriba una consulta en SQL para mostrar el nombre y apellido y el salario de aquellos empleados que ganan más de 4800
SELECT 
	 nombre_empleado, apellido_empleado, salario
FROM 
    empleados
WHERE
    salario>4800
ORDER BY salario desc

;

#8. Escriba una consulta en SQL para mostrar el nombre, apellido y el salario de aquellos empleados que viven en Seattle o Venice
SELECT 
	 nombre_empleado, apellido_empleado, salario, ciudad
FROM 
    empleados
 LEFT JOIN departamentos on departamentos.id_departamento =  empleados.id_departamento
RIGHT JOIN ubicaciones on ubicaciones.id_ubicacion = departamentos.id_ubicacion
 WHERE ciudad IN( "Seattle", "Venice")
 #WHERE ciudad ="Seattle" or ciudad ="Venice"
 ;


#(OJO QUE SOLO ME FILTRABA DOS REGISTRON EN FECHA)	
#9. Escriba una consulta en SQL para mostrar el nombre de todos los empleados que se han incorporado luego de la fecha 2002-08-17 
#y que viven en la ciudad de Seattle
SELECT  
  nombre_empleado, fecha_contratacion , ciudad
FROM  empleados
LEFT JOIN hr_unicorn.departamentos  ON empleados.id_departamento = departamentos.id_departamento
left JOIN 
       ubicaciones ON departamentos.id_ubicacion = ubicaciones.id_ubicacion
WHERE 
fecha_contratacion >'2002-08-17' and ciudad= "Seattle"
ORDER BY fecha_contratacion DESC
  #pregunta ambigua podria referirse tanto a fecha de contratacion como fecha inicio


     ;#resuesta si te da nombre NEENA no puede ser porque hay dos incorpradoas en 2001 y 1997
 #codigo de clase
SELECT 
nombre_empleado, fecha_contratacion , ciudad
FROM hr_unicorn.empleados e
LEFT JOIN hr_unicorn.departamentos d ON e.id_departamento = d.id_departamento
LEFT JOIN hr_unicorn.ubicaciones u ON d.id_ubicacion = u.id_ubicacion
WHERE fecha_contratacion > '2002-08-17' AND ciudad = 'Seattle';
  



#10. Escribe una consulta en SQL para mostrar el nombre, apellido 
#y salario de aquellos empleados que su categoria de salario máximo sea mayor o igual a 30000

SELECT 
     nombre_empleado, apellido_empleado, salario, titulo_trabajo
FROM 
     empleados
LEFT join 
     Trabajos on empleados.id_trabajo=trabajos.id_trabajo
WHERE salario_max>="30000"
    
;





