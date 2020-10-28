import Test.Hspec
import qualified SpecTP0
import qualified SpecTP1
import qualified SpecTP2
import qualified SpecTP3
import qualified SpecTP4

main :: IO ()
main = hspec $ do
  describe "TP0"  SpecTP0.spec
  describe "TP1"  SpecTP1.spec
  describe "TP2"  SpecTP2.spec
  describe "TP3"  SpecTP3.spec
  describe "TP4"  SpecTP4.spec