# Consigna TP0

## Objetivos

- Que empieces a conocer algunas de las herramientas que vamos a estar usando durante la cursada, asegurando que te funcionen antes de que que sigamos avanzando con la práctica del paradigma orientado a objetos.
- Seguir usando la ejecución de pruebas automáticas como parte del flujo de trabajo, para asegurar que la solución propuesta cumpla con la funcionalidad esperada.
- Usar un entorno de desarrollo que te ayude a detectar y resolver problemas de forma temprana.
- Usar un repositorio de código donde puedas subir tus cambios todas las veces que quieras, para que tus tutores puedan verlos y dejarte comentarios, así como también mantener un historial de lo que fuiste haciendo, sin miedo a perder tu trabajo.

> Tené en cuenta que las pruebas automáticas no se van a correr solamente en tu máquina, también se van a correr en un servidor luego de que subas tus cambios al repositorio. La herramienta que se encarga de correr las pruebas, dejando los resultados disponibles para que tus tutores puedan verlos, se llama Travis.
>
> Ocasionalmente vas a recibir mails de esta herramienta, no hace falta que te preocupes mucho por eso. Para esta materia alcanza con que sepas que existe y que la vamos a estar usando para simplificar el trabajo de revisión de trabajos prácticos.

## Parte 1: Preparar y probar tu entorno

1. Seguí las instrucciones para instalar Wollok que se encuentran en la página oficial: https://www.wollok.org/instalacion/

  > Importante: si ya tenías Wollok instalado, descargá la versión nueva desde la página, que tiene mejoras importantes.
  
2. Importá el proyecto en el entorno de desarrollo usando las opciones:

  - File -> Import...
  - Elegí esta opción para importar un repo usando el plugin Simplified Git y seguí los pasos para clonar tu repo
  
    ![Import sgit](imagenes/TP0/sgit-import.jpg)
    
  - Copiá la dirección para clonar tu repo que se obtiene de GitHub en el campo URI:
  
    ![Repo sgit](imagenes/TP0/sgit-uri.jpg)

3. Una vez que tengas tu proyecto en el IDE, corré las pruebas como se indica en la sección **Cómo ejecutar la solución** del `README.md` que se encuentra en la raíz del proyecto (vale correr sólo las del TP0 o las de todo el proyecto, al haber sólo un TP el resultado será el mismo).

   Asegurate de que el test del TP0 **falle**, ya que todavía no se implementó lo necesario en el archivo `src/tp0/deepThought.wlk` para que pase.

   Debería mostrarse el resultado de haber corrido las pruebas, incluyendo algo como esto:
   
   ![Test fallido](imagenes/TP0/tests-1.jpg)
   
   al seleccionar un test fallido vas a ver algunos detalles sobre qué fue lo que no funcionó como se esperaba.
   
  > Además si abrís el archivo `src/tp0/tp0.wtest` deberías ver un warning de este estilo: `Type system: expected <<String>> but found <<Number>>`.
  > Ese es el sistema de tipos de Wollok, que infiere información de tipos a partir de tu código para ayudarte a detectar potenciales problemas de forma temprana.

4. En el archivo `src/tp0/deepThought.wlk` cambiá el string `"???"` que retorna el método `laRespuesta()` por la expresión `1 / 0`, guardá los cambios y volvé a correr los tests.

   Deberías ver que el resultado de las pruebas todavía no es exitoso, en este caso debería mostrarse como un **error** porque se ejecutó una división por cero.
   
   ![Test rojo](imagenes/TP0/tests-2.jpg)
   
  > En el detalle del error vas a encontrar un **stacktrace** que muestra dónde ocurrió el problema. Si clickeás en los links te va a llevar a la línea correspondiente del archivo donde ocurrió el error.

5. Volvé a cambiar el valor retornado por `laRespuesta()`, esta vez usando el número `42`, guardá y volvé a correr los tests. Confirmá que el test del TP0 ahora sí pasa.

   ![Test verde](imagenes/TP0/tests-3.jpg)
   
## Parte 2: Actualizar el README

El **README** de un proyecto es básicamente una carta de presentación. Es común que incluya información útil para otras personas, y también un indicador de si las pruebas existentes funcionan al contar con herramientas como Travis. Ese indicador es comúnmente conocido como Badge.

Al igual que como hiciste anteriormente para funcional y lógico... ni cambiamos los screenshots :stuck_out_tongue_winking_eye:

1. En el archivo `README.md` que está en la raíz del proyecto completá con tu **nombre y apellido** donde se indica.

2. Agregá el Badge de Travis en el lugar indicado, en formato **Markdown**. Una vez que termines el TP0 tu repo GitHub va a mostrar el Badge que da información respecto a si todas las pruebas que se encuentran en este proyecto pudieron correrse sin problemas luego de cada cambio que subas al repositorio GitHub de ahora en más.

   > Tené en cuenta que podrían tardar sólo unos minutos o varias horas en correrse las pruebas en Travis, dependiendo de cuánta gente esté trabajando a la vez. No te preocupes si no se actualiza enseguida.

   Para conseguir el texto a copiar en el `README.md` de modo que aparezca el Badge de Travis correctamente:

   1. En tu repo GitHub, donde se muestra el último commit, debería aparecer un ícono que puede ser distinto al que se muestra en esta imagen, dependiendo de si ya se corrieron los tests en el servidor y cuál fue el resultado. Si clickeás ahí vas a encontrar este link:

   ![Travis: Estado del build](imagenes/TP0/travis-01.png)

   2. Luego de clickear en details tenés que seguir este link para que te lleve a la página de Travis, donde vas a poder generar el texto para mostrar el Badge:

   ![Link a Travis](imagenes/TP0/travis-02.png)

   3. Finalmente, en la página de Travis, vas a poder conseguir el texto a copiar en el `README.md` para que luego aparezca el Badge al entrar a tu repo GitHub siguiendo estos pasos:

      1. Clickeás en el Badge de Travis
      
      ![Badge](imagenes/TP0/travis-03.png)
      
      2. Seleccionás el formato **Markdown** y copiás el texto que aparece abajo:
      
      ![Texto badge](imagenes/TP0/travis-04.png)
      
      3. Ese texto que copiaste lo pegás directamente en el `README.md` de este repo, y listo!

   El objetivo de esto es que sea fácil de ver el estado actual de tu proyecto. Además clickeando en el Badge se puede navegar fácilmente a la página de Travis, donde se puede ver el detalle de la ejecución de los tests automáticos en el server, no sólo si pasan o no. Una belleza :heart_eyes:

## Parte 3: Subir tus cambios a GitHub

Al igual que en los otros trabajos, deberías subir tu solución a GitHub. En vez de usar la terminal del sistema operativo (o gitbash), podés usar un plugin integrado al IDE de Wollok. Para que se muestre usá estas opciones:

   ![Abrir vista](imagenes/TP0/sgit-1.jpg)
   
   ![Elegir sgit](imagenes/TP0/sgit-2.jpg)
   
  > Hay otro plugin similar llamado Git Staging que incluye otras opciones que no consideramos relevantes, y no incluye las opciones de Pull (para integrar los cambios en GitHub que no estén en el repo local) y Push (útil en caso de problemas de conectividad y potenciales conflictos).

1. Luego de seleccionar tu proyecto debería aparecer la lista de archivos modificados. Para agregar todos tus cambios a lo que será tu siguiente commit:

   ![Agregar todos los cambios](imagenes/TP0/sgit-add.jpg)
   
   Luego de agregarlos, los archivos modificados van a moverse a la lista de abajo (Staged changes), indicando que esos archivos se incluirán en el siguiente commit.
   
   ![Agregar todos los cambios](imagenes/TP0/sgit-cambios-agregados.jpg)
   
2. Commitear tus cambios con un mensaje representativo y pushearlos al repo remoto:
   
   ![Commit and push](imagenes/TP0/sgit-commit-and-push.jpg)
   
   > La primera vez que commitees con un autor que no tengas configurado te va a pedir el mail únicamente. Es para una configuración local de git, no es muy relevante.
   >
   > ![Author](imagenes/TP0/sgit-first-commit.jpg)

Ya sabés que podés subir tu solución tantas veces como quieras. **Es recomendable hacer commits chicos y frecuentes**, en vez de un solo gran commit con todo lo que se pedía resolver.

> En caso de que tengas problemas con el plugin Simplified Git, vale usar el plugin Git Staging junto con otras opciones del IDE que se mencionan en apuntes que están en la página, y también podés usar los comandos de siempre usando gitbash.

## Parte 4: Avisar que terminaste el TP

Al igual que para los TPs anteriores, entrá a tu repo en GitHub y luego de verificar que tu solución se haya subido, incluyendo los cambios al `README.md`, avisanos creando un issue de esta forma:

1. En la página de issues de tu repo, creás un issue nuevo:
   ![Nuevo issue](imagenes/TP0/issues-01.png)

2. Clickeás en el botón para crear un issue de tipo **Entrega de TP**:
   ![Entrega de TP](imagenes/TP0/issues-02.png)

3. Completás el issue con la info correspondiente como se explica en el template (podés borrar el texto que ya viene, pero no te olvides de arrobar a tus tutores):
   ![Issue de ejemplo](imagenes/TP0/issues-03.png)

   > Usando la opción Preview esas instrucciones se ven más amigables, por si te sirven.

4. Luego de confirmar que está todo en orden, clickeás en el botón para crear el issue y listo! :tada:

Ante cualquier problema técnico, recordá que podés contactarnos también por Discord, a través del canal **#troubleshooting**.
