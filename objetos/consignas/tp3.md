# Consigna TP3: Herencia

## Objetivos

- Modelado con clases y herencia.
- Aprovechar el mecanismo de herencia para reutilizar comportamiento.
- Extender y refactorizar lógica de dominio.
- Usar y definir tests automáticos para validar la lógica pedida.

## Tareas

- Resolver la lógica en el archivo `tp3/naves.wlk`.
- Completar los tests requeridos en los archivos `tp3/*.wtest`, y asegurar que los tests provistos que ya funcionan sigan funcionando luego de los cambios. Opcionalmente se pueden agregar más pruebas que se consideren valiosas, además de las pedidas en el ejercicio.

## Naves Espaciales

En un futuro distante, donde las actividades se derrollan en un ambiente interplanetario, nos piden un sistema que modele distintas naves y su comportamiento ante una amenaza.

### Punto de partida

Por ahora, tenemos modelados los siguientes tipos de naves:

- **Naves de carga**: nos interesa saber la masa de la carga que está transportando, medida en toneladas. Se desea saber si la nave está sobrecargada, que sucede cuando su carga excede 100 toneladas; y si está excedida de velocidad, que se cumple si va a más de 100.000 kms/seg cuando no está sobrecargada o a más de 80.000 kms/seg cuando sí lo está. Cuando estas naves reciben una amenaza se deshacen de toda su carga, dejándola vacía.

- **Naves de pasajeros**: lleva consigo una determinada cantidad de pasajeros + 4 personas destinadas a ser personal de la nave. Cuando estas naves reciben una amenaza simplemente activan su alarma en caso de emergencia. Se desea conocer la velocidad máxima a la que puede viajar, que es de 300.000 kms/seg divido la cantidad de personas dentro de la nave (pasajeros + personal de la nave), además se descuenta 200 kms/seg más si hay más de 100 pasajeros, por cuestiones de seguridad.

Ya tenemos esta parte del problema resuelta y testeada, pero necesitamos incorporar cambios y asegurar que esto siga funcionando.

### Extendiendo el dominio

Nos piden extender el sistema anterior para agregar nuevas funcionalidades. **Prestar especial atención en evitar repeticiones de lógica.**

1) Hacer que todas las naves se puedan _propulsar_, esto aumenta su velocidad en 20.000 kms/seg (sin importar si esto hace que se excedan de la velocidad máxima).

> Testear que una nave de carga que está quieta al propulsarse queda con una velocidad de 20.000 kms/seg. Y que una nave de pasajeros que viaja a 190.000 kms/seg al propulsarse queda viajando a 210.000 kms/seg.

2) Aparecen un nuevo tipo de nave, las de **carga de residuos redioactivos**. Estas son como cualquier nave de carga común, sólo que se toman precauciones extra para evitar desparramar residuos radioactivos por todo el espacio. Por esto mismo, al recibir una amenaza no liberan su carga, sino que frenan (reduciendo su velocidad a 0), dispuestos a entregar la nave. Además su velocidad máxima es el 75% de la de una nave de carga normal.

> Construir una nave que transporta 5 toneladas de redisuos radiactivos a 10.000 kms/seg y testear que al recibir una amenaza frenan y que su carga sigue siendo la misma.

> Testear que una nave que transporta 110 toneladas de residuos radiactivos tiene velocidad máxima equivalente al 75% de la velocidad máxima de una nave de carga normal con esa misma masa de carga.

3) Se necesita saber si una nave está en peligro, que sucede cuando va más rápido que su velocidad máxima. En el caso de las naves de pasajeros, también están en peligro si la alarma en caso de emergencia está encendida.

> Testear que una nave de carga que va a 60.000 kms/seg que está sobrecargada no está en peligro, mientras que una que va a 90.000 kms/seg sí lo está.

> Testear que una nave de 10 pasajeros que va a 1.000 kms/seg no está en peligro, pero una con las mismas características con la alarma encendida sí lo está. También está en peligro una nave de 10 pasajeros que va a 200.000 kms/seg con su alarma de emergencia apagada.

4) Hacer que una nave se encuentre con un enemigo. Esto les hace recibir una amenaza, sufriendo los efectos particulares de cada nave, y luego se propulsan para intentar escapar.

> Testear que una nave de pasajeros que se encuentra detenida, al encontrarse con un enemigo queda con velocidad de 20.000 kms/seg y su alarma en caso de emergencia activada.

> Testear que una nave de carga de residuos radioactivos que viaja a 50.000 kms/seg, al encontrarse con un enemigo queda con velocidad de 20.000 kms/seg.