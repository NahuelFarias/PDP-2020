# Consigna TP2: Tipos de datos propios

## Objetivos

- Declarar tipos de datos para un dominio específico.
- Definir funciones en Haskell, trabajando con tipos de datos compuestos.

## Contenido Audiovisual

Queremos armar un programa que nos ayude a sacar estadísticas del contenido audiovisual generado para la materia.

Para ello vamos a querer modelar la idea de **video** como se explica más adelante y desarrollar algunas funciones que trabajen con datos de este tipo.

Vale asumir que los valores correspondientes a las horas, minutos y segundos que se usarán para las duraciones de videos y reproducciones serán válidos (por ejemplo, no habrán números negativos, los minutos y segundos serán menores a 60, etc).

> **¡Importante!** para este TP vamos a pedirte que trabajes sobre dos archivos separados: `src\TP2.hs` y `src\Video.hs`.
> De esta forma podremos compartir el mismo modelo de datos para un mini-TP futuro.

### Modelado de videos

En el archivo `src\Video.hs` declará el tipo de dato `Video` de modo que:
- Se defina como un data cuyo constructor también se llame `Video`
- Sus componentes sean:
  - el `titulo` de tipo `String`
  - la `duracion` de tipo `(Int, Int, Int)`, que indica la cantidad de horas, minutos y segundos que dura el video, en ese orden
  - y `hashtags` de tipo `String`
- Debe poder compararse por igualdad y mostrarse en la consola.

Además creá los videos necesarios para las pruebas de modo que:
- La duración de `videoMuyLargo` sea `(1,15,45)`
- La duración de `videoNormal` sea `(0,32,12)`
- La duración de `videoCorto` sea `(0,10,59)`
- La duración de `otroVideoCorto` sea `(0,10,20)`

Podés elegir los títulos y hashtags que quieras, no va a impactar a la pruebas de este trabajo.

### Comparar por duración

Necesitamos saber, dados dos videos, si el primero es más largo que el segundo.

Ejemplos de uso:

```haskell
> esMasLargo videoMuyLargo videoCorto
True
```

### Analytics

Para un video queremos saber:
- la duración en minutos de un video, considerando que cada hora son 60 minutos y los segundos se considerarán irrelevantes;
- el porcentaje de tiempo que se reprodujo en promedio.

Al momento de analizar el porcentaje de tiempo de reproducción se indicará, además del video en cuestión, la **cantidad de vistas** que tiene el video y el **tiempo total** de reproducción entre todas las vistas.

Dicho porcentaje de reproducción se calcula como el tiempo total de reproducción **en minutos** multiplicado por 100, dividido por la cantidad de vistas totales, y todo eso dividido por la duración en minutos del video.

> Nota: para todas las cuentas que requieran dividir, usar la división entera `div`, no nos interesa más precisión.

Ejemplos de uso:

```haskell
> duracionEnMinutos videoMuyLargo
75

> porcentajeDeReproduccionPromedio 139 (66, 20, 21) videoMuyLargo
38
```

## Antes de subir tu solución

Acordate que el trabajo tiene pruebas automáticas que deberían funcionar si cumpliste con los requerimientos. Asegurate de correrlas con `stack test` para validarlo y corregir lo que haga falta si algún test falla.

Luego, para subir tu solución, seguí los mismos pasos que se explicaban en la parte 3 del TP0, y no te olvides de avisarnos que entregaste como se explicaba en la parte 4.

> Tené en cuenta que siempre podés subir soluciones intermedias, de hecho es recomendable hacer commits más chicos. Además podés basarte en soluciones parciales del trabajo para consultar dudas via issues de GitHub a tus tutores si lo necesitás.