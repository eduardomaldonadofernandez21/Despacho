# Practica CIU: Iluminación y texturas - Despachos

Asignatura: Creando interfaces de usuario

Curso: 4º

Autor: Eduardo Maldonado Fernández

## Introducción
Se ha realizado un programa en processing que crear un prototipo de un despacho con varios objetos 3D que visualiza distinta perspectivas de la cámara con sus texturas y una iluminación

## Descripción
Se ha programado en processing 

![office](/office.gif "Oficina")

## Controles de la vista e iluminación

<p style=”text-align: justify;”>Primero establecemos unas variables globales: declaramos unas variables float que nos indicaran el angulo del planeta respecto al sol. Además, se añade unas variables para la posiciones de los planetas y PShape variables globales para cada planeta, así como para el fondo del sistema solar un PImage.</p>

En la función setup() establecemos el tamaño de la pantalla completa, y diversos valores de las variables globales explicados anteriormente y generamos los planetas correspondientes medianteo el método createPlanet() que se explicará a continuación.

A partir de la función draw() llamaremos a una serie de funciones que explicamos su utilidad:

- **drawControl():** Con este función, se mostrará el control edonde se explica como terminar la ejecución del programa.

-	**createPlanet():** Este metodo llamado en el setup() genera crear un planeta correspondiente añadiendole su textura correspondiente.

-	**showSol():** Mediante esta función, se muestra el sol. 



## Descarga e instalación
Para poder probar este programa es necesario descargar el fichero sistema_solar.pde, así como la carpeta /data, para poder descargar todas las texturas necesarias para la ejecución.
