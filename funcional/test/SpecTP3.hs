module SpecTP3 where

import TP3
import Cafe
import Test.Hspec

spec = do
  describe "Cafetería" $ do
    it "armarCafe 400 100" $ do
      armarCafe 400 100 `shouldBe` Cafe {intensidad = 1, temperatura = 60, ml = 390}

    it "armarCafe 1400 500" $ do
      armarCafe 1400 500 `shouldBe` Cafe {intensidad = 9, temperatura = 60, ml = 990}

    it "armarFrapu 20" $ do
      armarFrapu 20 `shouldBe` Cafe {intensidad = 2, temperatura = 12, ml = 190}

    it "armarFrapu 50" $ do
      armarFrapu 50 `shouldBe` Cafe {intensidad = 9, temperatura = 12, ml = 190}