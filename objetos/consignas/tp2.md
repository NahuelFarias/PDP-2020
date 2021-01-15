# Consigna TP2: Clases y Colecciones

## Objetivos

- Modelar usando objetos y clases adecuadamente.
- Trabajar con colecciones.
- Abstraer y evitar repetir lógica.
- Poner en práctica las ideas de encapsulamiento, delegación y polimorfismo.
- Usar y definir tests automáticos para validar la lógica pedida.

## Tareas

- Desarrollar lo necesario para cumplir con los requerimientos pedidos en el archivo `tp2/supermercado.wlk`.
- Completar los tests en el archivo `tp2/supermercado.wtest`.

## Supermercado

Queremos hacer un sistema para hacer compras online de modo que se puedan agregar productos al carrito de compras, y hacer diversas consultas para analizar el estado de la compra.

Debemos contemplar dos tipos de productos distintos:
- De venta unitaria, a los cuales nos interesa poder configurarles su **descripción** y el **precio unitario**.
  
  Por ejemplo, un producto podría tener como descripción `"Aceite de girasol"` y como precio unitario el valor `60.75`.
  
- De venta por peso, que nos interesa poder configurarles la **descripción**, el **precio por kilo** y el **peso** (en kilogramos) que se está comprando. El precio a abonar por estos productos sería el precio por kilo multiplicado por el peso del producto.
  
  Por ejemplo, podríamos querer tener un producto por peso cuya descripción sea `"Queso cremoso"`, el precio por kilo sea `320` y el peso sea `0.3` kilos. Por ende el valor que se debería abonar por ese producto debería ser: `320 * 0.3 => 96`.

Requerimientos y cosas a tener en cuenta:

- Necesitamos poder **agregar productos al carrito**, considerando que debe ser posible agregar un mismo producto al carrito varias veces, lo cual implica que se desea comprar esa cantidad del producto en cuestión.
- Queremos poder determinar:
  - si el carrito **está vacío**, que se cumple cuando no se le agregó ningún producto.
  - **cuántos productos hay** en el carrito en total (si se agrega 2 veces un mismo producto, debe contabilizarse 2 veces).
  - cuál es el **total a abonar** por los productos agregados al carrito.
  - cuál es el producto más caro de los que se agregaron al carrito.
- Además queremos obtener el detalle de la compra, que debería ser una lista con las descripciones de los productos que se agregaron al carrito. La misma no debería tener descripciones repetidas, y se espera que esté en orden alfabético.

Ejemplos de uso:

```Wollok
>>> carrito.agregar(producto)
>>> carrito.estaVacio()
>>> carrito.cantidadDeProductos()
>>> carrito.totalAAbonar()
>>> carrito.productoMasCaro()
>>> carrito.detalleDeCompra()
```

> Recordá que si lo necesitás podés ayudarte con la [guía de lenguajes](https://docs.google.com/document/d/e/2PACX-1vTlLkakSbp6ubcIq00PU4-Z96tg8CUSc8bO793_uftmiGjfkSn7Ug-F_y0-ieIWG6aWfuoHLJrRL8Fd/pub) y la [documentación oficial de Wollok](https://www.wollok.org/documentacion/wollokdoc/).

### Testeo

Para que el ejercicio esté completo se debe agregar lo necesario para que los tests en `tp2/supermercado.wtest` funcionen, considerando que:
  - Debe existir la referencia al `carrito` usada en los tests
  - Deben completarse los métodos `crearProductoDeVentaUnitaria(descripcion, precioUnitario)` y `crearProductoDeVentaPorPeso(descripcion, precioPorKilo, peso)` que creen y retornen el producto correspondiente para usarlos desde los tests que ya se encuentran definidos.
  - Deben completarse los últimos tests con la validación correspondiente.
