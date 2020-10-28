# Consigna TP1: Intro a Funcional

## Objetivos

- Definir funciones en Haskell, trabajando con tipos básicos.
- Abstraer y evitar repetición de lógica.

## Estaciones del año

Queremos armar un programa que nos ayude a determinar qué estación del año se corresponde con cada mes.

A cada mes lo representaremos con un número entre el 1 (enero) y el 12 (diciembre). Cualquier otro número no se consideraría como un mes para nuestro dominio.

A su vez sabemos que en los meses que son múltiplos de 3 hay cambios de estación.

Teniendo esto en cuenta, nuestro objetivo es conocer cuál es la estación para cada mes sabiendo que:
- Tenemos como referencia que en enero es verano, que en abril es otoño, que en julio es invierno y en octubre es primavera.
- Para los demás meses:
  -  o bien la estación es la misma que en el mes anterior, como podría ser el caso de febrero, que también es verano,
  -  o bien hay una mezcla de dos estaciones porque allí se da el cambio de estación, como podría ser el caso de marzo, que cuando arranca es verano (como en el mes anterior), pero cuando termina es otoño (como en el mes siguiente).

### Saber si un número es un mes

Definir la función `esMes :: Int -> Bool` que dado un número retorne `True` sólo si el valor recibido se encuentra entre 1 y 12.

A continuación se muestran algunos ejemplos de uso:

```haskell
> esMes 8
True
> esMes 18
False
```

### Saber si en un mes hay cambio de estación

Definir la función `hayCambioDeEstacion :: Int -> Bool` que dado un número retorne `True` sólo para los meses que sean múltiplos de 3.

A continuación se muestran algunos ejemplos de uso:

```haskell
> hayCambioDeEstacion 8
False
> hayCambioDeEstacion 9
True
> hayCambioDeEstacion 15
False
```

### Determinar la estación de un mes

Definir la función `estacion :: Int -> String` que se comporte como se indicó anteriormente, considerando que el dominio debería estar acotado a los meses. Usar esta función con un número que no es un mes debería fallar.

Para los meses en los que hay cambios de estación, la respuesta esperada debería ser la concatenación de ambas estaciones (la que termina y la que empieza) separadas por `"/"`.

> Importante! asegurate de **generalizar** la lógica, no definir para todos los meses, uno por uno, cuál debería ser la respuesta.

A continuación se muestran algunos ejemplos de uso con las respuestas esperadas:

```haskell
> estacion 8
"invierno"
> estacion 10
"primavera"
> estacion 9
"invierno/primavera"
```

> Nota: para concatenar strings en Haskell se puede usar la función `(++)`, como se muestra en este ejemplo:
> ```haskell
> > "para" ++ "digmas"
> "paradigmas"
> ```

## Antes de subir tu solución

Acordate que el trabajo tiene pruebas automáticas que deberían funcionar si cumpliste con los requerimientos. Asegurate de correrlas con `stack test` para validarlo y corregir lo que haga falta si algún test falla.

Luego, para subir tu solución, seguí los mismos pasos que se explicaban en la parte 3 del TP0, y no te olvides de avisarnos que entregaste como se explicaba en la parte 4.