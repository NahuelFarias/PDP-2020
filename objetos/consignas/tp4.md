# Consigna TP4: Herencia vs. Composición

## Objetivos

- Elegir las herramientas de modelado más adecuadas para cumplir con la funcionalidad sin repetir lógica. 
- Usar tests automáticos para validar la lógica pedida.

## Tareas

- Resolver la lógica pedida en el archivo `tp4/redSocial.wlk`.
- Completar los métodos para construir objetos de prueba en el archivo `tp4/fabricaDeObjetosDePrueba.wlk` en base a tu solución.
- Completar los TODOs en el archivo `tp4/cambiosEnConfiguracionDeContenido.wtest` en base a tu solución.

## Contenido público y privado

Queremos hacer nuestra propia red social en la cual el contenido publicado por los usuarios pueda ser visible por otros usuarios de la red, dependiendo de cómo se haya creado dicho contenido.

Cuando se crea una publicación se registra el usuario que creó la publicación y la fecha de publicación. La misma puede ser pública (puede verla cualquier usuario de la red) o privada, haciendo que sea visible sólo por los contactos de quien hizo la publicación.

Además algunas publicaciones, a las que denominamos historias, sólo son visibles hasta el día siguiente de su publicación por aquellos usuarios que correspondan de acuerdo a si era pública o no. Independientemente de todo esto, quien realiza la publicación **siempre puede ver su propio contenido publicado**.

- Se tiene que poder **consultar** si una publicación o historia puede verla un determinado usuario en una fecha mediante el mensaje `esVisible(usuario, fecha)` como se ve en los tests.
- Debe ser posible en cualquier momento hacer que una publicación o historia se vuelva pública o privada.

> Ya se provee la definición de una clase Usuario en el archivo `tp4/usuario.wlk`, la cual **no se espera que modifiques**.
>
> Para saber la diferencia en días entre dos fechas se pueden restar entre ellas con el mensaje `-`. Para más información podés revisar la [documentación oficial](https://www.wollok.org/documentacion/wollokdoc/).

### Testeo

Para que el ejercicio esté completo se debe agregar lo necesario para que los tests en `tp4/saberSiEsVisibleElContenidoPublico.wtest` y `tp4/saberSiEsVisibleElContenidoPrivado.wtest` funcionen, 
considerando que deben implementarse de forma acorde los siguientes métodos en el objeto fabrica:

- crearPublicacionPublica
- crearHistoriaPublica
- crearPublicacionPrivada
- crearHistoriaPrivada

Además se deben completar los TODOs del grupo de tests "Cambios en la configuración: público / privado" de `tp4/cambiosEnConfiguracionDeContenido.wtest`.
  
## Lista Negra

Necesitamos agregar la posibilidad de que una publicación o historia se cree para que **no sea visible** por ciertos contactos de quien la creó, a modo de **lista negra** (sólo aquellos contactos del creador que **no hayan sido restringidos** para ver ese contenido deberían poder verlo).

El objetivo es que sea más restrictivo que las publicaciones o historias privadas, con lo cual las demás limitaciones que aplicaban para el contenido privado también debería aplicar para el contenido con lista negra.

Al igual que antes, debería ser posible cambiar una publicación o historia creada con lista negra para volverla pública o privada, así como el contenido previamente creado como público o privado debería poder cambiarse para usar una lista negra.

> Incorporar la funcionalidad nueva asegurando que lo anterior siga funcionando y sin repetir lógica.
>
> Para pensar: ¿Es posible externder la solución sin modificar nada de lo desarrollado anteriormente?

### Testeo

Para que el ejercicio esté completo se debe agregar lo necesario para que los tests en `tp4/saberSiEsVisibleElContenidoConListaNegra.wtest` funcionen, 
considerando que deben implementarse de forma acorde los siguientes métodos en el objeto fabrica:

- crearPublicacionConListaNegra
- crearHistoriaConListaNegra

Además se deben completar los TODOs del grupo de tests "Cambios en la configuración: lista negra" de `tp4/cambiosEnConfiguracionDeContenido.wtest`.
  