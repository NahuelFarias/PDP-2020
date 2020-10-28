module TP4 where
import Video
import EdicionVideos
import Data.Char

-- Definir las funciones de acuerdo a lo indicado en las consignas del TP4

-------------------------
-- Hashtags
-------------------------

tieneHashtag :: String -> Video -> Bool
tieneHashtag hashtag unVideo = elem (map toLower hashtag) (conviertoHashtagsEnListaDeStrings unVideo)

conviertoHashtagsEnListaDeStrings :: Video -> [String]
conviertoHashtagsEnListaDeStrings unVideo = words.map toLower.hashtags $ unVideo

---------------------

estanRelacionados :: Video -> Video -> Bool
estanRelacionados unVideo = (>=3).length.hashtagsEnComun unVideo

-- Nota: El point-free de estanRelacionados le quita expresividad a la función

hashtagsEnComun :: Video -> Video -> [String]
hashtagsEnComun unVideo otroVideo = filter (flip tieneHashtag otroVideo) (conviertoHashtagsEnListaDeStrings unVideo)

---------------------

agregarHashtag :: String -> Video -> Video
agregarHashtag hashtag video
    | not (tieneHashtag hashtag video) = video { hashtags = (hashtags $ video) ++ (" " ++ hashtag) }
    | otherwise = video

-- Nota: SIEMPRE intentamos expresar las condiciones de las tuplas por el positivo

agregarHashtags :: [String] -> Video -> Video
agregarHashtags hashtagsNuevos video = foldr agregarHashtag video hashtagsNuevos

-------------------------
-- Edicion de videos
-------------------------

subir :: Video -> VideoVersionado
subir videoOriginal = Version {
  versionActual = videoOriginal,
  versionesAnteriores = []
}

editar :: (Video -> Video) -> VideoVersionado -> VideoVersionado
editar funcion videoVersionado
  | videosDistintos funcion videoVersionado = Version { versionActual = aplicacionDeFuncionALaVersionActual funcion videoVersionado, versionesAnteriores = versionActual videoVersionado : versionesAnteriores videoVersionado }
  | otherwise = videoVersionado

videosDistintos :: (Video -> Video) -> VideoVersionado -> Bool
videosDistintos funcion videoVersionado = (aplicacionDeFuncionALaVersionActual funcion videoVersionado) /= versionActual videoVersionado

postProcesamiento :: String -> (Int, Int, Int) -> Video -> VideoVersionado
postProcesamiento nuevoTitulo nuevaDuracion = editar (recortar nuevaDuracion).editar (renombrar nuevoTitulo).subir

aplicacionDeFuncionALaVersionActual :: (Video -> Video) -> VideoVersionado -> Video
aplicacionDeFuncionALaVersionActual funcion videoVersionado = funcion.versionActual $ videoVersionado