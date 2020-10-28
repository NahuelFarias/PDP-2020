module SpecTP2 where

import TP2
import Video
import Test.Hspec

spec = do
  describe "Es más largo" $ do
    it "Un video es más largo que otro si dura más horas" $ do
      esMasLargo videoMuyLargo videoNormal `shouldBe` True
    it "Un video es más largo que otro si dura la misma cantidad de horas y más minutos" $ do
      esMasLargo videoNormal videoCorto `shouldBe` True
    it "Un video no es más largo que otro si dura más minutos pero menos horas" $ do
      esMasLargo videoNormal videoMuyLargo `shouldBe` False
    it "Un video no es más largo que otro si dura más segundos pero menos horas y minutos" $ do
      esMasLargo videoCorto videoNormal `shouldBe` False
    it "Un video no es más largo que uno que dura exactamente lo mismo" $ do
      esMasLargo videoNormal videoNormal `shouldBe` False
    it "Un video que dura más segundos que otro que dura la misma cantidad de horas y minutos es más largo" $ do
      esMasLargo videoCorto otroVideoCorto `shouldBe` True
    it "Un video que menos segundos que otro que dura la misma cantidad de horas y minutos no es más largo" $ do
      esMasLargo otroVideoCorto videoCorto `shouldBe` False

  describe "Analytics" $ do
    describe "Duración en minutos de un video" $ do
      it "Los segundos no se consideran para la duración en minutos de un video" $ do
        duracionEnMinutos videoCorto `shouldBe` 10
      it "Un video que dura más de una hora dura más de 60 minutos" $ do
        duracionEnMinutos videoMuyLargo > 60 `shouldBe` True
    describe "Porcentaje de reproducción promedio" $ do
      it "Porcentaje de reproducción de un video largo con pocas vistas" $ do
        porcentajeDeReproduccionPromedio 139 (66, 20, 21) videoMuyLargo `shouldBe` 38
      it "Porcentaje de reproducción de un video largo con más vistas" $ do
        porcentajeDeReproduccionPromedio 1039 (66, 20, 21) videoMuyLargo `shouldBe` 5
      it "Porcentaje de reproducción de un video largo con más tiempo de reproducción" $ do
        porcentajeDeReproduccionPromedio 1039 (1000, 10, 00) videoMuyLargo `shouldBe` 77
      it "Porcentaje de reproducción de un video normal con muchas vistas" $ do
        porcentajeDeReproduccionPromedio 1039 (66, 20, 21) videoNormal `shouldBe` 11
