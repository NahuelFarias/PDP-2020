module TP2 where
import Video

-- Definir las funciones de acuerdo a lo indicado en las consignas del TP2
-- y explicitar su tipo

-- Comparar por duracion

esMasLargo :: Video -> Video -> Bool
esMasLargo videoLargo otroVideo = duracion videoLargo > duracion otroVideo

-- Analytics

duracionEnMinutos :: Video -> Int
duracionEnMinutos video = sumaDeDuracionesEnMinutos (duracion video)

porcentajeDeReproduccionPromedio :: Int -> Duracion -> Video -> Int
porcentajeDeReproduccionPromedio vistas tiempoDeReproduccion video = div (cantidadDeVistasEnTotal vistas tiempoDeReproduccion) (duracionEnMinutos video)

cantidadDeVistasEnTotal :: Int -> Duracion -> Int
cantidadDeVistasEnTotal vistas tiempoDeReproduccion = div (tiempoTotalDeReproduccion tiempoDeReproduccion * 100) vistas

tiempoTotalDeReproduccion :: Duracion -> Int
tiempoTotalDeReproduccion = sumaDeDuracionesEnMinutos 

-- Auxiliares para aplicar a la duracion

sumaDeDuracionesEnMinutos :: Duracion -> Int
sumaDeDuracionesEnMinutos unaDuracion =  horasEnMinutos unaDuracion + minutos unaDuracion

horasEnMinutos :: Duracion -> Int
horasEnMinutos (horas, _, _) = horas * 60

minutos :: Duracion -> Int
minutos (_, minutos, _) = minutos