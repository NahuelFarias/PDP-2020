module Video where

-- Definir acá el data Video usando la notación que vimos en clase
data Video = Video {
    titulo :: String,
    duracion :: Duracion,
    hashtags :: String
} deriving(Show, Eq);

type Duracion = (Int, Int, Int)

-- Crear los siguientes videos de prueba con las duraciones
-- que se indicaban en la consigna:

videoMuyLargo = Video "Infinity War" (1,15,45) "#Ciencia Ficcion"
videoNormal = Video "Jhon Wick" (0,32,12) "#Accion"
videoCorto = Video "Chapulin" (0,10,59) "#listas #Aplicacion #Composicion #data"
otroVideoCorto = Video "El Zorro" (0,10,20) "#Aplicacion #OrdenSuperior #composicion #Listas"