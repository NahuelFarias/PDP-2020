# Consigna TP1: Intro a Lógico

## Objetivos

- Definir predicados en Prolog usando hechos y reglas, trabajando con individuos simples (átomos y números).
- Identificar correctamente cuándo corresponde trabajar con disyunción, conjunción y negación.
- Asegurar que los predicados desarrollados sean inversibles.
- Abstraer y evitar repetir lógica.

> Tené en cuenta que cualquier predicado declarado dentro del archivo `tp1.pl`, más allá de los 2 que se piden en la consigna, puede probarse desde la consola de SWI-Prolog anteponiéndole el prefijo **tp1:**, por ejemplo: `tp1:precio(Comida, Precio)`. Si te olvidás, te va a preguntar si eso fue lo que quisiste escribir, y alcanza con responder que sí escribiendo `y`.
>
> Esto se debe a que cada `.pl` expone lo mínimo indispensable para que las pruebas automáticas corran de modo que los futuros mini-TPs tengan mayor independencia (por ejemplo, podría usarse un predicado `precio/2` en otro TP, sin que haya colisión de nombres).

## Comilona de bar

Seis amigos están planeando juntarse a comer en su bar favorito cuando termine la cuarentena. Del bar se sabe cuáles son las comidas que ofrece y cuánto sale cada una de ellas:

``` prolog
precio(asado,550).
precio(lomitoDeLaCasa,450).
precio(hamburguesa,350).
precio(papasFritas,220).
precio(ensalada,190).
precio(pizzetas, 250).
precio(polloALaPlancha, 320).
precio(tostadoVeggie, 150).

tieneCarne(asado).
tieneCarne(hamburguesa).
tieneCarne(lomitoDeLaCasa).
tieneCarne(polloALaPlancha).
```

Queremos armar un programa que nos ayude a entender el comportamiento de este peculiar grupo de amigos a la hora de comer afuera.

> Tener en cuenta que si se agregaran otras comidas o cambiaran los precios del bar, el programa debería seguir comportándose de forma consistente en base a lo que se describe a continuación para el grupo de amigos.

### Gustos de comidas

Desarrollar un predicado `leGusta/2` que relacione a cada persona con cada comida de su agrado de las que están en el bar sabiendo que:

* A Juan y Gabriel les gusta el asado.
* A Gabriel también le gusta la comida nacNpop, que es cualquier comida que salga menos de $300.
* A Juan le gusta el tostado veggie.
* A Soledad le gustan todas las cosas que le gustan a Gabriel, excepto aquellas que también le gustan a Juan.
* A Tomás le gustan las comidas que tienen carne.
* A Celeste le gusta todo lo que el bar ofrece.
* Carolina es bastante especial para comer, no le gusta nada de lo que ofrece este bar.

Por ejemplo, esta consulta debería ser cierta:

```prolog
?- leGusta(celeste, hamburguesa).
```

> Asegurar que el predicado `leGusta/2` sea inversible.

### ¿Qué se piden?

Necesitamos agregar a la base de conocimientos la siguiente información respecto a cuánta plata está dispuesta a gastar cada persona:

* Juan está dispuesto a gastar $500 y Celeste $400.
* Soledad está dispuesta a gastar el doble que Tomás.
* Tomás está dispuesto a gastar lo que saldría pedir una hamburguesa.
* Gabriel está dispuesto a gastar la mitad que Carolina.
* Carolina está dispuesta a gastar lo que saldría pedir asado con papas fritas.

Y desarrollar lo necesario para responder a la siguiente pregunta:

```prolog
?- puedePedir(Persona, Comida).
```

... teniendo en cuenta que una persona puede pedir una comida del bar si le gusta esa comida y esa comida no sale más de lo que está dispuesta a pagar.

> Asegurar que el predicado `puedePedir/2` sea inversible.