# Consigna TP1: Intro a Objetos

## Objetivos

- Definir métodos de consulta y efecto en los distintos objetos de dominio.
- Abstraer y evitar repetir lógica.
- Poner en práctica las ideas de encapsulamiento, delegación y polimorfismo.
- Usar y definir tests automáticos para validar la lógica pedida.

## Tareas

- Resolver la implementación de Olivia => archivo `tp1/personas.wlk` (los tests están en el archivo `tp1/testOlivia.wtest`)
- Resolver la implementación de Adriano => archivo `tp1/personas.wlk` (los tests están en el archivo `tp1/testAdriano.wtest`)
- Agregar tests del objeto que representa al Spa (archivo `tp1/testSpa.wtest`) y la implementación del spa (archivo `tp1/spa.wlk`)
- Pensar y agregar casos de prueba faltantes para validar la funcionalidad de Adriano.

> Si querés correr tu programa desde el REPL para hacer pruebas manuales y visualizar el estado del sistema, hacelo desde el archivo `tp1/spa.wlk` que ya incluye un import de los objetos del archivo `tp1/personas.wlk`.
>
> Podés ayudarte a encontrar las tareas pendientes (marcadas como **TODO**) usando la vista de tareas. Podés abrir esta vista desde `Window -> Show View -> Other...`. 

## Spa

### Olivia va al Spa

Queremos estudiar el efecto que produce visitar un spa.

Cuando el `spa` atiende una persona pasan dos cosas: la persona recibe masajes, y se da un baño de vapor durante 15 minutos.

Vamos a querer que Olivia pueda atenderse en el spa. Sabemos que:

* cuando Olivia **recibe masajes**, su grado de concentración aumenta 2 puntos, pero a partir del tercer masaje, al estar más relajada su grado de concentración aumenta 5 puntos.
* cuando **se da un baño de vapor**, su grado de concentración aumenta 1 punto cada 5 minutos que dura el baño de vapor.

Y también necesitamos modelar lo siguiente:
* si Olivia tiene 7 puntos o más de concentración, **es feliz**.
* cuando **discute**, su grado de concentración baja a 5, salvo que tenga menos de 5 puntos de concentración, en cuyo caso no pasa nada.

Además necesitamos poder consultar su grado de concentración. El valor inicial para la concentración de Olivia es 4, pero debe poder cambiar dependiendo de lo que haga como se indicó anteriormente.

Definir los objetos `spa` y `olivia` de modo que se puedan usar de esta forma:

```wollok
> olivia.discutir()
> olivia.gradoDeConcentracion()
> olivia.esFeliz()
> olivia.recibirMasajes()
> olivia.darseUnBanioDeVapor(5)
> spa.atender(olivia)
```

> Los objetos `olivia` y `spa` pueden entender otros mensajes además de los mencionados, pero no se imponen restricciones sobre los mismos.

#### Tests que debe definir

Para que el ejercicio esté completo deben pasar los tests unitarios que se proveen en `testOlivia.wtest`, y además **deben implementarse** los siguientes tests en `testSpa.wtest`:

- Luego de que el spa atienda a Olivia, ella está feliz
- Si Olivia se atiende 3 veces en el spa, su concentración queda en 22

### Se suma Adriano

Continuando con el problema anterior, queremos agregar un nuevo cliente para nuestro spa.

Adriano es programador y nos interesa saber qué tan contracturado está (0 es "nada contracturado", cuanto más alto sea ese número, más contracturado está), y si está fresco para programar. Inicialmente tiene 5 de nivel de contractura y está fresco para programar.

Las acciones relevantes que tiene para este modelo son:

* cuando recibe masajes, baja dos puntos su nivel de contractura. OJO nunca puede ser negativo, o sea, si estaba en 1 pasa a 0, si estaba en 0 se queda en 0.
* siempre que se da un baño de vapor, queda fresco para programar.
* al comerse un Big Mac queda fresco para programar (?, así lo definió el usuario).
* cuando codea, su nivel de contractura aumenta 1 punto si está fresco, y en caso contrario aumenta 3 puntos. Indefectiblemente queda quemado cada vez que codea (lo opuesto a estar fresco).
* un dia de trabajo de Adriano consiste en: codear, comerse un Big Mac y volver a codear.

Necesitamos que sea posible hacer (por lo menos) lo siguiente:

```wollok
> adriano.trabajarUnDia()
> spa.atender(adriano)
> adriano.nivelDeContractura()
> adriano.frescoParaProgramar()
```

> Tené en cuenta que los tests del ejercicio anterior debe seguir andando.

#### Tests que debe definir

Para que el ejercicio esté completo deben pasar los tests unitarios que se proveen en `testAdriano.wtest`, y además **deben implementarse** los siguientes tests en `testSpa.wtest`:
- Luego de que el spa atienda a Adriano, su nivel de contractura baja a 3
- Luego de que el spa atienda a Adriano, está fresco para programar

También se espera que agregues los tests que consideres necesarios en `testAdriano.wtest` para probar mejor su comportamiento (por separado del spa), de modo que se asegure cubrir los distintos flujos de ejecución.