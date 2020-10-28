module TP3 where
import Cafe

armarCafe :: Vaso -> Gramos -> Cafe
armarCafe vaso = servirEnVaso vaso.prepararCafe 1000.molerGranos

armarFrapu :: Gramos -> Cafe
armarFrapu = servirEnVaso 400.licuar 60 120.agregarHielo 6.prepararCafe 80.molerGranos