module EdicionVideos where
import Video

data VideoVersionado = Version {
  versionActual :: Video,
  versionesAnteriores :: [Video]
} deriving (Show, Eq)

renombrar :: String -> Video -> Video
renombrar nuevoTitulo videoOriginal = videoOriginal {titulo = nuevoTitulo}

recortar :: (Int, Int, Int) -> Video -> Video
recortar nuevaDuracion videoOriginal
  | duracion videoOriginal > nuevaDuracion = videoOriginal {duracion = nuevaDuracion}
  | otherwise = videoOriginal