# Consigna TP4: Tipos Compuestos (Parte 2). Agregación.

## Objetivos

- Definir predicados en Prolog trabajando con individuos simples y compuestos adecuadamente.
- Resolver problemas que requieren trabajar con conjuntos, evitando soluciones poco declarativas. En caso de ser posible expresar una solución de forma sencilla en términos de existencia/no existencia/para todo, **no usar conjuntos**.
- Asegurar la inversibilidad de aquellos predicados que lo requieran.

> Tené en cuenta que cualquier predicado declarado dentro del archivo `tp4.pl`, más allá de los que se piden en la consigna, puede probarse desde la consola de SWI-Prolog anteponiéndole el prefijo **tp4:**. Si te olvidás, te va a preguntar si eso fue lo que quisiste escribir, y alcanza con responder que sí escribiendo `y`.
>
> Esto se debe a que cada `.pl` expone lo mínimo indispensable para que las pruebas automáticas corran de modo que los futuros mini-TPs tengan mayor independencia.

## Votaciones Nacionales

Estamos armando un programa para analizar los resultados de una votación realizada a nivel nacional.

Tenemos una base de conocimientos con información sobre cuántos votos sacó cada partido político en las distintas provincias del país mediante un predicado `votos/3`, que relaciona al partido con la provincia y los votos conseguidos en esa provincia.

Además también hay un predicado `padron/2` que relaciona una provincia con la cantidad de personas empadronadas.

### Total de votos

Definir un predicado `votosTotales/2` para saber cuántos votos sacó un partido a nivel nacional.

Por ejemplo:

```prolog
?- votosTotales(pps, Votos).
Votos = 3200555.
```

> El predicado debe ser completamente inversible.

### Provincia Decidida

Definir un predicado `decidida/1` que se cumpla para una provincia si un único partido sacó muchos votos (porque más del 30% de los empadronados de esa provincia lo votaron).

```prolog
?- decidida(Provincia).
Provincia = chaco ;
Provincia = rioNegro ;
Provincia = caba ;
Provincia = jujuy ;
Provincia = salta ;
Provincia = laPampa.
```

> Como se ve en el ejemplo, `decidida/1` debe ser inversible.