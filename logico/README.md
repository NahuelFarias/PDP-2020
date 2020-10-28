# Mini TPs - Paradigma Lógico 2020

Nombre y Apellido: ***Nahuel Farias***

**[![Build Status](https://travis-ci.com/pdep-mit/mini-tps-logico-2020-NahuelFarias.svg?token=zy6Eci32xPLcRsMTQRH5&branch=master)](https://travis-ci.com/pdep-mit/mini-tps-logico-2020-NahuelFarias)**

## Consignas

En la carpeta `consignas` estarán disponibles los ejercicios a realizar para cada mini TP, en formato Markdown (.md). Estos archivos pueden leerse mejor desde GitHub o usando la vista previa de VSCode, el editor recomendado para trabajar.

La resolución correspondiente debe realizarse en el archivo `.pl` que corresponda de los que ya se incluyen en este repositorio, dentro de la carpeta `src`.

**Pro-Tip:** En el VSCode podés abrir la vista previa en un panel separado del archivo que estás editando. Eso te va a facilitar trabajar sobre cada TP, teniendo la consigna al lado.

> A lo largo de la cursada estaremos agregando nuevo contenido a este repositorio, tanto de consignas como código de base, que será el punto de partida para los siguientes mini TPs.

## Entorno de trabajo

Para trabajar vas a necesitar tener instalado:
- git (se asume que ya lo hiciste para funcional)
- un editor de texto (te explicaremos cómo configurar el VSCode, que ya estuvimos usando también para funcional)
- SWI-Prolog.

Si todavía no te instalaste Prolog, revisá las consignas del TP0 que te explican cómo hacerlo.

## Cómo ejecutar la solución

Para ejecutar tu código podés:
- o bien levantar el intérprete en la terminal del VSCode, para trabajar de forma similar a como lo hiciste con Haskell,
- o bien ejecutar SWI-Prolog con su interfaz gráfica.

Acá te dejamos la explicación de cómo usar SWI-Prolog desde la terminal (asegurate de estar sobre la raíz de tu proyecto).

Para cargar el código **de un TP particular** y probarlo:
  - Correr `swipl -s src/tp#.pl` para levantar SWI-Prolog con el código para **ese TP** (siendo # el número de TP en cuestión).
  - Una vez que se muestra el prompt de la consola de SWI-Prolog (`?-`) corrés: `run_tests.` para correr todas las pruebas, o la consulta que quieras sobre tu programa.
  - Si hacés cambios sobre tu solución y querés **recargarla** en el intérprete de SWI-Prolog corré: `make.`
  - Para **salir** del intérprete de SWI-Prolog corré: `halt.`

> Cada vez que hagas un cambio y recargues tu programa con el comando `make.` los tests se volverán a ejecutar automáticamente y se mostrarán los resultados, sin necesidad de correr `run_tests.` a mano.

Para correr las pruebas de **todos los mini TPs** en vez de uno en particular:
  - Correr `swipl -s src/tps.pl` para levantar SWI-Prolog con el código para **todos los TPs** ya cargado.
  - Una vez que se muestra el prompt de la consola de SWI-Prolog (`?-`) corrés: `run_tests.`

> Importante: todos los comandos y consultas que corras dentro de SWI-Prolog deben terminar con un `.` como se indicó más arriba. Si sólo se le da enter, sin el punto final, no alcanza para que se ejecute lo solicitado.

Para usar SWI-Prolog con la interfaz gráfica (al menos en Windows) alcanza con abrir el archivo deseado con extensión .pl desde el explorador del sistema operativo. Todo lo explicado anteriormente también aplica usando el intérprete de esta forma, no hay mucha diferencia.
