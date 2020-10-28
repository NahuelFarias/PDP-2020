% No cambies esta declaración del módulo tp1, ya que podría traer
% problemas para correr las pruebas del proyecto.
:- module(tp1, [leGusta/2, puedePedir/2]).

% ---------------------------------------------------------------------------- %

precio(asado,550).
precio(lomitoDeLaCasa,450).
precio(hamburguesa,350).
precio(papasFritas,220).
precio(ensalada,190).
precio(pizzetas, 250).
precio(polloALaPlancha, 320).
precio(tostadoVeggie, 150).

tieneCarne(asado).
tieneCarne(hamburguesa).
tieneCarne(lomitoDeLaCasa).
tieneCarne(polloALaPlancha).

% Cambiar la implementación para el predicado leGusta/2 de modo que relacione a una persona con una comida (en ese orden).

leGusta(juan, asado).
leGusta(juan, tostadoVeggie).
leGusta(gabriel, asado).
leGusta(gabriel, Comida) :-
	precio(Comida, _),
  esNacNpop(Comida).
leGusta(soledad, Comida):-
	precio(Comida, _),
	leGusta(gabriel, Comida),
	not(leGusta(juan, Comida)).
leGusta(tomas, Comida):-
  tieneCarne(Comida).
leGusta(celeste, Comida):-
	precio(Comida, _).

esNacNpop(Comida):-
  precio(Comida, Precio),
  Precio < 300.

% Cambiar la implementación para el predicado puedePedir/2 de modo que relacione a una persona con una comida (en ese orden).

estaDispuestoAGastar(juan, 500).
estaDispuestoAGastar(celeste, 400).
estaDispuestoAGastar(soledad, Presupuesto):-
	estaDispuestoAGastar(tomas, PresupuestoTomas),
	Presupuesto is PresupuestoTomas * 2.	
estaDispuestoAGastar(tomas, Presupuesto):-
	precio(hamburguesa, Presupuesto).
estaDispuestoAGastar(gabriel, Presupuesto):-
	estaDispuestoAGastar(carolina, PresupuestoCarolina),
	Presupuesto is PresupuestoCarolina / 2.
estaDispuestoAGastar(carolina, Presupuesto):-
	precio(asado, Precio1),
	precio(papasFritas, Precio2),
	Presupuesto is Precio1 + Precio2.

puedePedir(Persona, Comida):-
	precio(Comida, Precio),
	leGusta(Persona, Comida),
	estaDispuestoAGastar(Persona, Presupuesto),
	Precio =< Presupuesto.

% --------------------------------
% TESTS - NO TOCAR
% --------------------------------

:- begin_tests(tests_tp1_leGusta).

test(genteALaQueLeGustaElAsado, set(Persona == [juan, gabriel, celeste, tomas])):-
        leGusta(Persona, asado).

test(gustosDeJuan, set(Comida == [asado, tostadoVeggie])):-
        leGusta(juan, Comida).

test(gustosDeGabriel, set(Comida == [asado, papasFritas, ensalada, pizzetas, tostadoVeggie])):-
        leGusta(gabriel, Comida).

test(gustosDeSoledad, set(Comida == [papasFritas, ensalada, pizzetas])):-
        leGusta(soledad, Comida).

test(gustosDeTomas, set(Comida == [asado, hamburguesa, lomitoDeLaCasa, polloALaPlancha])):-
        leGusta(tomas, Comida).

test(gustosDeCeleste, set(Comida == [asado, lomitoDeLaCasa, hamburguesa, papasFritas, ensalada, pizzetas, polloALaPlancha, tostadoVeggie])):-
        leGusta(celeste, Comida).

test(aCarolinaNoLeGustaNada, fail):-
        leGusta(carolina, _).

:- end_tests(tests_tp1_leGusta).

:- begin_tests(tests_tp1_puedePedir).

test(genteQuePuedePedirHamburguesa, set(Persona == [celeste, tomas])):-
        puedePedir(Persona, hamburguesa).

test(nadiePuedePedirAsado, fail):-
        puedePedir(_, asado).

test(aCelesteNoLeAlcanzaParaPedirElLomito, fail):-
        puedePedir(celeste, lomitoDeLaCasa).

test(aCelesteLeAlcanzaParaPedirPollo, nondet):-
        puedePedir(celeste, polloALaPlancha).

test(comidasQuePuedePedirJuan, set(Comida == [tostadoVeggie])):-
        puedePedir(juan, Comida).

test(comidasQuePuedePedirSoledad, set(Comida == [papasFritas, ensalada, pizzetas])):-
        puedePedir(soledad, Comida).

test(comidasQuePuedePedirTomas, set(Comida == [hamburguesa, polloALaPlancha])):-
        puedePedir(tomas, Comida).

test(comidasQuePuedePedirGabriel, set(Comida == [papasFritas, ensalada, pizzetas, tostadoVeggie])):-
        puedePedir(gabriel, Comida).

test(carolinaNoPuedePedirNadaPorqueNoLeGustaLoQueHay, fail):-
        puedePedir(carolina, _).

:- end_tests(tests_tp1_puedePedir).