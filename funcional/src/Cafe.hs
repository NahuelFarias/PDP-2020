module Cafe where

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

type Gramos = Int
type Agua = Int
type Vaso = Int
type Segundos = Int
type Leche = Int
type Hielos = Int

molerGranos granosDeCafe = granosDeCafe * 90 `div` 100
prepararCafe mlAgua grCafeMolido = Cafe { temperatura = 60, intensidad = max (grCafeMolido * 20 `div` mlAgua) 1, ml = mlAgua }
servirEnVaso tamanioVaso cafe = conCantidad (min tamanioVaso (ml cafe) - 10) cafe
agregarHielo cantHielos = disminuirTemperatura (cantHielos * 7) . disminuirIntensidad 1
licuar segundos mlLeche = aumentarCantidad mlLeche . disminuirTemperatura (segundos `div` 10) . disminuirIntensidad (mlLeche `div` 100)

disminuirTemperatura grados cafe = conTemperatura (temperatura cafe - grados) cafe
disminuirIntensidad cant cafe = conIntensidad (max (intensidad cafe - cant) 0) cafe
aumentarCantidad cantidad cafe = conCantidad (ml cafe + cantidad) cafe

conCantidad cantidad (Cafe intensidad temperatura _) = Cafe intensidad temperatura cantidad
conTemperatura grados (Cafe intensidad _ ml) = Cafe intensidad grados ml
conIntensidad nuevaIntensidad (Cafe _ temperatura ml) = Cafe nuevaIntensidad temperatura ml