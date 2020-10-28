# Consigna TP4: Orden Superior

## Objetivos

- Trabajar con tipos de datos compuestos.
- Usar funciones de orden superior.
- Definir funciones de orden superior.
- Usar composición y aplicación parcial para combinar funciones más chicas adecuadamente.

## Antes de subir tu solución

Acordate que el trabajo tiene pruebas automáticas que deberían funcionar si cumpliste con los requerimientos. Asegurate de correrlas con `stack test` para validarlo y corregir lo que haga falta si algún test falla.

Luego, para subir tu solución, seguí los mismos pasos que se explicaban en la parte 3 del TP0, y no te olvides de avisarnos que entregaste como se explicaba en la parte 4.

> Tené en cuenta que siempre podés subir soluciones intermedias, de hecho es recomendable hacer commits más chicos. Además podés basarte en soluciones parciales del trabajo para consultar dudas via issues de GitHub a tus tutores si lo necesitás.

Este TP consta de 2 partes independientes entre ellas, podés arrancar con la que quieras, y lógicamente, subirlas al repo GitHub por separado.

## Contenido Audiovisual - Recargado

Queremos agregar más funcionalidad a nuestro programa que trabaja con el contenido audiovisual generado para la materia.

> **¡Importante!** para este TP vamos a pedirte que trabajes sobre el archivo `src\TP4.hs`, usando lo anteriormente desarrollado en `src\Video.hs`. Si no terminaste la parte de modelado del TP2, hacé eso antes de arrancar este trabajo.

### Parte 1: Hashtags

Inicialmente queremos poder identificar relaciones entre videos, a partir de los hashtags que tienen. Para ello se pide definir las siguientes funciones:

- `tieneHashtag :: String -> Video -> Bool` para saber si un video tiene un determinado hashtag. Tener en cuenta que los hashtags deberían considerarse equivalentes para este propósito, independientemente de mayúsculas y minúsculas.

  > Ejemplo: si los hashtags del video son `"#PdeP #Funcional"` debería ser cierto que tiene el hashtag `"#pdep"`.

- `estanRelacionados :: Video -> Video -> Bool` para saber si dos videos están relacionados, lo cual se cumple si el primero de ellos tiene al menos 3 hashtags en común con el otro video. **Usar `tieneHashtag` para definir esta función.**

  > Ejemplo: si los hashtags del primer video son `"#listas #Aplicacion #Composicion #data"` y los del segundo son `"#Aplicacion #OrdenSuperior #composicion #Listas"`, están relacionados.

 Tené en cuenta que existen las funciones `words :: String -> [String]` y `toLower :: Char -> Char` que pueden usarse para resolver las funciones pedidas. Y no te olvides que `String` es lo mismo que `[Char]` :wink:
```haskell
> words "hola mundo"
["hola", "mundo"]
> toLower 'H'
'h'
```

Además de analizar los hashtags que tienen los videos también queremos poder agregarle hashtags. Para ello se pide definir las siguientes funciones:

- `agregarHashtag :: String -> Video -> Video` para agregarle un hashtag nuevo, **sólo si no lo tiene** (no queremos hashtags duplicados). Agregar un hashtag implica concatenar a los hashtags existentes un espacio y luego el hashtag nuevo.

  > Ejemplo: si los hashtags del video son `"#PdeP #Funcional"` y se le agrega `"#Composicion"`, los hashtags del video resultante deberían ser `"#PdeP #Funcional #Composicion"`.

- `agregarHashtags :: [String] -> Video -> Video` para agregar varios hashtags a un video, usando `agregarHashtag`.

  > Ejemplo: si los hashtags del video son `"#OrdenSuperior #Composicion"` y se le agregan los siguientes hashtags: `["#AplicacionParcial", "#Composicion", "#Listas"]`, los hashtags del video resultante deberían ser `"#OrdenSuperior #Composicion #Listas #AplicacionParcial"`.

Tené en cuenta que **todas las funciones pedidas en esta práctica pueden resolverse sin recursividad**. Identificá qué operaciones sobre conjuntos son las más adecuadas para cada problema, para trabajar con abstracciones de más alto nivel.

### Parte 2: Edición de videos

Para poder mejorar la calidad del material luego de subirlo, la plataforma ofrece la posibilidad de editarlo. Además esta plataforma es tan copada que te permite mantener las versiones anteriores de tu contenido para poder, eventualmente, volver atrás cambios realizados.

Como punto de partida se agrega un nuevo tipo de dato:

```haskell
data VideoVersionado = Version {
  versionActual :: Video,
  versionesAnteriores :: [Video]
} deriving (Show, Eq)
```

El objetivo es que a medida que se realicen ediciones sobre el video inicial, a la lista de versiones anteriores se le incorporen los videos previos a las distintas ediciones, quedando las más viejas al final.

Y también se proveen las siguientes funciones para trabajar con videos:
 - `renombrar :: String -> Video -> Video` que retorna el video luego de renombrarlo con el título indicado
 - `recortar :: (Int, Int, Int) -> Video -> Video` que retorna el video luego de acortar su duración a la duración indicada, teniendo en cuenta que si esa duración es mayor a la que tenía el video, se mantiene la duración original.

> Podés encontrar las definiciones del data `VideoVersionado` y las funciones `renombrar` y `recortar` en el archivo `src/EdicionVideos.hs`, el cual ya se importa desde `src/TP4.hs` para su uso.

Se pide desarrollar las siguientes funciones:
 - `subir :: Video -> VideoVersionado` que retorne la primer versión de ese video, o sea, un video versionado con el recibido como versión actual y sin versiones anteriores.
 - `editar :: (Video -> Video) -> VideoVersionado -> VideoVersionado` que a partir de una función y un video versionado, retorne la nueva versión, considerando que:
   - La misma debe tener como versión actual al video luego de transformarlo con la función indicada.
   - Se debe incluir la versión actual del video, sin transformarlo, al principio de las versiones anteriores del video versionado.
   - En caso de que la transformación **no impacte** de ninguna forma al video teníamos como versión actual, en vez de cambiar las versiones actual y anteriores, esperamos obtener **el mismo video versionado que se recibió**, ya que no queremos registrar versiones intermedias que no sean relevantes.
 - `postProcesamiento :: String -> (Int, Int, Int) -> Video -> VideoVersionado` que combine todas las funciones anteriores para **subir** el video, luego **editarlo** para **renombrarlo** con el título indicado y luego **editarlo** una vez más para **recortarlo** a la duración recibida.

Una prueba integral que podría hacerse para esta parte es:

```haskell
> postProcesamiento "Nuevo nombre" (2,0,0) videoCorto
```

Que debería retornar un video versionado que tenga una única versión anterior (el video corto original) y como versión actual, el video corto pero con título `"Nuevo nombre"`.

Sería esperable que tenga la misma duración que el original porque el video era más corto que la duración indicada (debido a la lógica de la función `recortar`), por ende el recorte no debería impactar al proceso de edición.

### BONUS! :sparkles:

Si ya resolviste todas las consignas anteriores y tenés tiempo y ganas de seguir trabajando, te dejamos **consignas opcionales** muy interesantes para que te diviertas.

> Estas funciones, por ser opcionales, no tienen tests. Podés hacer pruebas manualmente y/o crear tus propios tests, agregándolos al archivo `test/SpecTP4.hs` como hicimos en la clase práctica.
>
> Antes de abordar esto, recordá subir todo lo que hayas hecho para el TP4 a tu repo, para no perder el foco. Si resolvés algunos de estos problemas y funcionan correctamente, subilos también y avisá a tus tutores para que se enteren y vean lo que hiciste, pero no forman parte oficialmente del TP.

#### Nada se pierde, todo se transforma

Queremos poder `restaurar` una versión anterior de un video versionado. Para determinar cuál es la versión del video que queremos dejar como actual se espera recibir un criterio de tipo `Video -> Bool`.

El resultado de **restaurar** una versión previa debería ser el mismo que se consigue actualmente al **editar** un video versionado, considerando que la nueva versión actual debería ser una de las versiones anteriores de ese video. La versión a elegir debería ser la más reciente que cumpla con el criterio indicado.

> Resolver este problema usando adecuadamente la función `editar`. Vale usar expresiones lambda para este fin.

#### Ultra Bonus: Esto se está poniendo abstracto...

En este ejercicio hubo un patrón de lógica recurrente: sólo si se cumple tal cosa entonces aplico tal transformación sobre mi parámetro, de lo contrario retorno lo que recibí.

¿Te animás a eliminar la lógica repetida delegando en una nueva función de orden superior? Además de definir esa nueva función y usarla donde te parezca conveniente, explicitá su tipo.
