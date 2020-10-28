# Consigna TP3: Tipos Compuestos (Parte 1). Polimorfismo.

## Objetivos

- Definir predicados en Prolog trabajando con individuos simples y compuestos adecuadamente.
- Evitar repeticiones de lógica, aprovechando el uso de predicados polimórficos.

> Tené en cuenta que cualquier predicado declarado dentro del archivo `tp3.pl`, más allá de los que se piden en la consigna, puede probarse desde la consola de SWI-Prolog anteponiéndole el prefijo **tp3:**. Si te olvidás, te va a preguntar si eso fue lo que quisiste escribir, y alcanza con responder que sí escribiendo `y`.
>
> Esto se debe a que cada `.pl` expone lo mínimo indispensable para que las pruebas automáticas corran de modo que los futuros mini-TPs tengan mayor independencia.

## Lecturas y lectores

Queremos armar un programa para analizar los hábitos de lectura de un grupo de personas.

### Lecturas Densas

Definir un predicado `lecturaDensa/1` para saber si un material de lectura es denso:

- Un libro es denso si tiene al menos 200 páginas o si es de editorial Paidos.
- Por otro lado un paper es denso si la diferencia entre la cantidad de hojas y la cantidad de visitas es mayor que 100.
- Por último, una saga es densa si tiene más de cuatro libros.

Considerar que los distintos materiales de lectura se representan con functores con esta forma:

- `libro(Nombre, Editorial, CantidadDePaginas)`
- `paper(Titulo, CantidadDeHojas, CantidadDeVisitas)`
- `saga(Nombre, CantidadDeLibros)`

A continuación se muestran algunos ejemplos de uso:

```Prolog
ム lecturaDensa(saga(elSeniorDeLosAnillos,3)).
false

ム lecturaDensa(libro(elAleph,paidos,146)).
true

ム lecturaDensa(paper("Evidence for a Distant Giant Planet in the Solar System", 170, 30)).
true
```

> No se espera que este predicado sea inversible.

## Lectores Intensos

Usando el predicado `lecturaDensa/1` definido para el ejercicio anterior, definir un predicado `lectorIntenso/1` para saber si una persona prefiere la lectura intensa. Esto sucede cuando **leyó más de un material de lectura** (que podrían ser dos libros distintos, un paper y un libro, etc) **y todo lo que leyó es denso**.

Contamos además con un predicado `leyo/2` que relaciona a una persona con cada material de lectura que leyó.

> Se espera que el predicado `lectorIntenso/1` sea inversible.

Tené en cuenta cuál es nivel de detalle que necesitás conocer de los distintos materiales de lectura para resolver este ejercicio. No te compliques más de lo estrictamente necesario :wink: