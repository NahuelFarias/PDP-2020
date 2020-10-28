# Consigna TP2: Existe, No Existe, Para Todo

## Objetivos

- Definir predicados en Prolog, identificando correctamente cuándo corresponde trabajar con existencia, no existencia y para todo.
- Asegurar que los predicados principales sean inversibles.
- Encontrar buenas abstracciones.

> Tené en cuenta que cualquier predicado declarado dentro del archivo `tp2.pl`, más allá de los que se piden en la consigna, puede probarse desde la consola de SWI-Prolog anteponiéndole el prefijo **tp2:**. Si te olvidás, te va a preguntar si eso fue lo que quisiste escribir, y alcanza con responder que sí escribiendo `y`.
>
> Esto se debe a que cada `.pl` expone lo mínimo indispensable para que las pruebas automáticas corran de modo que los futuros mini-TPs tengan mayor independencia.

## Atrápalos a todos!

   ![Profesor Oak](imagenes/TP2/Profesor_Oak.png)

El Profesor Oak nos encomendó la tarea de registrar la información sobre diversas especies de pokemones para aprender más sobre estas simpáticas criaturas.

Tenemos una base de conocimientos de este estilo:

``` prolog
% tipo(Especie, Tipo).
tipo(charmander, fuego).
tipo(charmeleon, fuego).
tipo(charizard, fuego).
tipo(charizard, volador).
% ... etc

% evolucion(Especie, Evolucion).
evolucion(charmander, charmeleon).
evolucion(charmeleon, charizard).
% ... etc

puedeEvolucionar(Especie, Evolucion):-
  evolucion(Especie, Evolucion).
puedeEvolucionar(Especie, Evolucion):-
  evolucion(Especie, OtraEspecie),
  puedeEvolucionar(OtraEspecie, Evolucion).

```

> Nota: la relación `evolucion/2` es antisimétrica, irreflexiva y no transitiva; indica que la segunda especie es una evolución directa de la primera. Mientras que `puedeEvolucionar/2` sí es transitiva.

Sabemos que hay muchísimas especies y constantemente se descubren nuevas, por eso necesitamos armar un programa que nos permita analizar la información que fuimos recolectando.

### Análisis de tipos

Necesitamos saber si dos tipos (ej. fuego, planta, volador...) son **incompatibles**. Decimos que dos tipos son incompatibles si no existe ninguna especie que tenga ambos tipos a la vez.

Por ejemplo, agua y planta deberían ser incompatibles, pero fuego y volador no (porque charizard tiene ambos tipos).

> Desarrollar un predicado `incompatibles/2` que cumpla con lo solicitado asegurando que sea inversible.

### Especies y evoluciones

En base a la información que tenemos de las distintas especies necesitamos desarrollar los siguientes predicados inversibles para:

- Saber si una especie es `ultimaEvolucion/1`, que se cumple para aquellas especies que son evolución de alguna otra especie pero no evolucionan en otra.

Ejemplos:

```prolog
?- ultimaEvolucion(charizard).
true.

?- ultimaEvolucion(charmeleon).
false.

?- ultimaEvolucion(farfetchd).
false.
```

- Saber si una especie es `predecible/1`, que se cumple para una especie de un determinado tipo si todas las especies a las que puede evolucionar (de haber alguna) también tienen ese tipo.

Ejemplos:

```prolog
?- predecible(pikachu).
true.

?- predecible(eevee).
false.

?- predecible(flareon).
true.
```

- Saber si dos especies son `parecidas/2` que se cumple si no pertenecen a una misma línea evolutiva y además todos los tipos que tiene la primera también los tiene la segunda, y viceversa. Esta relación debería ser simétrica e irreflexiva.

  Nota: Decimos que dos especies pertenecen a una misma línea evolutiva si una puede evolucionar de la otra.

Ejemplos:

```prolog
?- parecidas(charmander, flareon).
true.

?- parecidas(charizard, flareon).
false.

?- parecidas(charmeleon, charmander).
false.
```