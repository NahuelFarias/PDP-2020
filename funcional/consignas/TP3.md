# Consigna TP3: Composición y Aplicación Parcial

## Objetivos

- Definir funciones en términos de otras funciones, usando composición y aplicación parcial.
- Resolver problemas complejos combinando adecuadamente funciones más chicas.

## Cafetería

Tenemos un programa que cuenta con las siguientes abstracciones.

```haskell
data Cafe = Cafe {
  intensidad :: Int,
  temperatura :: Int,
  ml :: Int
} deriving (Show, Eq)


molerGranos :: Gramos -> Gramos
prepararCafe :: Agua -> Gramos -> Cafe
servirEnVaso :: Vaso -> Cafe -> Cafe
licuar :: Segundos -> Leche -> Cafe -> Cafe
agregarHielo :: Hielos -> Cafe -> Cafe
```

La implementación de esas funciones ya está resuelta y no es relevante para el problema a resolver, pero a partir de las mismas queremos armar otras funciones que sirvan para determinar cómo saldrá el café de una máquina.

Definir las siguientes funciones en el archivo `src/TP3.hs`:

 - `armarCafe :: Vaso -> Gramos -> Cafe` que muela los gramos de café, luego prepare el café en una cafetera con 1000 ml de agua y finalmente lo sirva en el vaso del tamaño indicado.

 - `armarFrapu :: Gramos -> Cafe` que muela los gramos de café, luego prepare el café con sólo 80 ml de agua, le agregue 6 hielos, lo licúe durante 60 segundos con 120 ml de leche y finalmente lo sirva en un vaso de 400 ml.

> Las funciones `armarFrapu` y `armarCafe` deben definirse combinando las funciones provistas de modo que se aprovechen los conceptos de composición y aplicación parcial.

> Todos los tipos que se mencionan más allá de Cafe son simplemente un alias de Int, a modo orientantivo.

## Antes de subir tu solución

Acordate que el trabajo tiene pruebas automáticas que deberían funcionar si cumpliste con los requerimientos. Asegurate de correrlas con `stack test` para validarlo y corregir lo que haga falta si algún test falla.

Luego, para subir tu solución, seguí los mismos pasos que se explicaban en la parte 3 del TP0, y no te olvides de avisarnos que entregaste como se explicaba en la parte 4.

> Tené en cuenta que siempre podés subir soluciones intermedias, de hecho es recomendable hacer commits más chicos. Además podés basarte en soluciones parciales del trabajo para consultar dudas via issues de GitHub a tus tutores si lo necesitás.