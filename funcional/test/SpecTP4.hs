module SpecTP4 where

import TP4
import Video
import EdicionVideos
import Test.Hspec

spec = do
  describe "Parte 1: Hashtags" $ do
    describe "Tiene Hashtags" $ do
      it "Un video tiene un hashtag si forma parte de sus hashtags" $ do
        tieneHashtag "#PdePandemia"
          (videoNormal {hashtags = "#Funcional #PdePandemia"}) `shouldBe` True
      it "Un video tiene un hashtag a pesar de no coincidir mayúsculas y minúsculas" $ do
        tieneHashtag "#PdePandemia"
          (videoNormal {hashtags = "#Funcional #pdEpanDeMia"}) `shouldBe` True
      it "Un video no tiene un hashtag si no hay ninguno como ese entre sus hashtags" $ do
        tieneHashtag "#PdePandemia"
          (videoNormal {hashtags = "#Funcional #Composicion #PdeP"}) `shouldBe` False
    describe "Estan relacionados" $ do
      it "Dos videos sin hashtags no están relacionados" $ do
        estanRelacionados (videoNormal {hashtags = ""})
          (videoCorto {hashtags = ""}) `shouldBe` False
      it "Dos videos con hashtags todos distintos no están relacionados" $ do
        estanRelacionados (videoNormal {hashtags = "#Composicion #Aplicacion #Currificacion"})
          (videoCorto {hashtags = "#OrdenSuperior #Listas #Inmutabilidad"}) `shouldBe` False
      it "Dos videos con sólo 2 hashtags en común no están relacionados" $ do
        estanRelacionados (videoNormal {hashtags = "#Listas #Aplicacion #Composicion"})
          (videoCorto {hashtags = "#OrdenSuperior #Composicion #Listas"}) `shouldBe` False
      it "Dos videos con 3 hashtag en común sí están relacionados" $ do
        estanRelacionados (videoNormal {hashtags = "#listas #Aplicacion #Composicion #data"})
          (videoCorto {hashtags = "#Aplicacion #OrdenSuperior #composicion #Listas"}) `shouldBe` True
    describe "Agregar Hashtags" $ do
      it "Agregar un hashtag a un video que no lo tenía lo incorpora al final, luego de un espacio" $ do
        (hashtags . agregarHashtag "#Currificacion")
          (videoNormal {hashtags = "#Funcional"}) `shouldBe` "#Funcional #Currificacion"
      it "Agregar un hashtag a un video que ya lo tenía no le cambia los hashtags" $ do
        (hashtags . agregarHashtag "#Currificacion")
          (videoNormal {hashtags = "#Funcional #Currificacion #Lambdas"})
            `shouldBe` "#Funcional #Currificacion #Lambdas"
      it "Al agregar un hashtag, el título no cambia" $ do
        (titulo . agregarHashtag "#Currificacion")
          (videoNormal {titulo = "Clase 5", hashtags = "#Funcional"}) `shouldBe` "Clase 5"
      it "Al agregar múltiples hashtags, el video incorpora todos los que no tenía" $ do
        (hashtags . agregarHashtags ["#AplicacionParcial", "#Composicion", "#Listas"])
          videoNormal {hashtags = "#OrdenSuperior #Composicion"}
            `shouldBe` "#OrdenSuperior #Composicion #Listas #AplicacionParcial"
  describe "Parte 2: Edición de videos" $ do
    describe "Subir un video " $ do
      it "Al subir un video, esa es la versión actual del video versionado" $ do
        (versionActual.subir) videoCorto `shouldBe` videoCorto
      it "Al subir un video, el video versionado no tiene versiones anteriores" $ do
        (versionesAnteriores.subir) videoCorto `shouldBe` []
    describe "Editar un video" $ do
      let videoVersionado = Version {
        versionActual = videoNormal {titulo = "Normal"},
        versionesAnteriores = [videoMuyLargo]
        }
      let postTransformacion = videoNormal {titulo = "Editado"}
      let transformacion = (\_ -> postTransformacion)
      it "Luego de la edición la versión actual es el video transformado" $ do
        (versionActual . editar transformacion) videoVersionado `shouldBe` postTransformacion
      it "Luego de la edición, la versión actual previa se incorpora a las versiones anteriores" $ do
        (versionesAnteriores . editar transformacion) videoVersionado
          `shouldBe` [versionActual videoVersionado, videoMuyLargo]
      it "Si la transformación no impacta a la versión actual del video, se mantienen las versiones originales" $ do
        editar id videoVersionado `shouldBe` videoVersionado
    describe "Post-procesamiento" $ do
      it "La versión actual del video post-procesado tiene la duración indicada si era más largo" $ do
        (duracion . versionActual . postProcesamiento "Video Largo Editado" (0,10,30))
          videoMuyLargo `shouldBe` (0,10,30)
      it "La versión actual del video post-procesado tiene la duración original si era más corto" $ do
        (duracion . versionActual . postProcesamiento "Video Corto Editado" (1,10,30))
          videoCorto `shouldBe` duracion videoCorto
      it "La versión actual del video post-procesado tiene el título indicado" $ do
        (titulo . versionActual . postProcesamiento "Video Corto Editado" (1,10,30))
          videoCorto `shouldBe` "Video Corto Editado"
      it "La versión actual del video post-procesado es el video original si no se renombra ni recorta" $ do
        (versionActual . postProcesamiento (titulo videoCorto) (duracion videoCorto))
          videoCorto `shouldBe` videoCorto
      it "La versión del video original es la última de la lista de versiones anteriores cuando se renombra y recorta" $ do
        (last . versionesAnteriores . postProcesamiento "Video Largo Editado" (0,10,30))
          videoMuyLargo `shouldBe` videoMuyLargo
      it "Si el post-procesamiento no recorta ni renombra el video, no quedan versiones anteriores" $ do
        (versionesAnteriores . postProcesamiento (titulo videoCorto) (duracion videoCorto))
          videoCorto `shouldBe` []
      it "Si el post-procesamiento recorta pero no renombra el video, sólo queda una versión anterior" $ do
        (length . versionesAnteriores . postProcesamiento (titulo videoMuyLargo) (0,5,10))
          videoMuyLargo `shouldBe` 1
      it "Si el post-procesamiento renombra pero no recorta el video, sólo queda una versión anterior" $ do
        (length . versionesAnteriores . postProcesamiento "Video Corto Editado" (1,10,30))
          videoCorto `shouldBe` 1
      it "Si el post-procesamiento recorta y renombra el video, quedan dos versiones anteriores" $ do
        (length . versionesAnteriores . postProcesamiento "Video Largo Editado" (0,10,30))
          videoMuyLargo `shouldBe` 2
      it "El post-procesamiento primero renombra y luego recorta" $ do
        postProcesamiento "Video Largo Editado" (0,10,30) videoMuyLargo
          `shouldSatisfy` (\(Version actual (versionPrevia:_)) ->
                              duracion actual < duracion versionPrevia &&
                                titulo actual == titulo versionPrevia)