module TP1 where

esMes :: Int -> Bool
esMes num = mayorQueyMenorQue num 0 13

hayCambioDeEstacion :: Int -> Bool
hayCambioDeEstacion num = (esMultiploDeTres num) && (esMes num) 

esMultiploDeTres :: Int -> Bool
esMultiploDeTres num = mod num 3 == 0 

estacion :: Int -> String
estacion mes
  | esVerano mes = "verano"
  | esOtonio mes = "otoño"
  | esInvierno mes = "invierno"
  | esPrimavera mes = "primavera"
  | hayCambioDeEstacion mes = estacion (mesAnterior mes) ++ "/" ++ estacion (mesSiguiente mes)

mesSiguiente :: Int -> Int
mesSiguiente mes 
  | (mes >= 1) && (mes < 12) = mes + 1
  | mes == 12 = 1

mesAnterior :: Int -> Int
mesAnterior mes 
  | (mes > 1) && (mes <= 12) = mes - 1
  | mes == 1 = 12

esVerano :: Int -> Bool
esVerano mes = mayorQueyMenorQue mes 0 3

esOtonio :: Int -> Bool
esOtonio mes = mayorQueyMenorQue mes 3 6

esInvierno :: Int -> Bool
esInvierno mes = mayorQueyMenorQue mes 6 9

esPrimavera :: Int -> Bool
esPrimavera mes = mayorQueyMenorQue mes 9 12

mayorQueyMenorQue :: Int -> Int -> Int -> Bool
mayorQueyMenorQue num piso techo = (num > piso) && (num < techo)

-- Enero 1 - Febrero 2 - Marzo 3 - Abril 4 - Mayo 5 - Junio 6 - Julio 7 - Agosto 8 - Sep 9 - Oct 10 - Nov 11 - Dic 12
-- Verano                Cambio    Otoño               Cambio  Invierno             Cambio  Primavera         Cambio