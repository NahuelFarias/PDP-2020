% No cambies esta declaración del módulo tp2, ya que podría traer
% problemas para correr las pruebas del proyecto.
:- module(tp2, [incompatibles/2, ultimaEvolucion/1, predecible/1, parecidas/2]).

% ---------------------------------------------------------------------------- %

% --------------------------------
% Predicados a desarrollar
% --------------------------------

esUnTipo(Tipo) :-
    tipo(_, Tipo).

esUnaEspecie(Especie) :-
    tipo(Especie, _).

% ---------------------------------------------

incompatibles(Tipo, OtroTipo) :-
    tipo(_, Tipo),
    esUnTipo(OtroTipo),
    not(tieneAmbosTipos(_, Tipo, OtroTipo)),
    Tipo \= OtroTipo.
    
tieneAmbosTipos(Especie, Tipo, OtroTipo) :-
    tipo(Especie, Tipo),
    tipo(Especie, OtroTipo),
    Tipo \= OtroTipo.

% ---------------------------------------------

ultimaEvolucion(Especie) :-
    evolucion(_, Especie), 
    not(evolucion(Especie, _)).

% ---------------------------------------------

predecible(Especie) :-
    tipo(Especie, Tipo),
    forall(puedeEvolucionar(Especie, Evolucion), tipo(Evolucion, Tipo)).

% ---------------------------------------------

parecidas(Especie, OtraEspecie) :-
    esUnaEspecie(Especie),
    esUnaEspecie(OtraEspecie),
    Especie \= OtraEspecie,
    not(tienenMismaLineaEvolutiva(Especie, OtraEspecie)),
    forall(tipo(Especie, Tipo), tipo(OtraEspecie, Tipo)),
    forall(tipo(OtraEspecie, Tipo), tipo(Especie, Tipo)).

tienenMismaLineaEvolutiva(Especie, OtraEspecie) :-
    puedeEvolucionar(OtraEspecie, Especie).
tienenMismaLineaEvolutiva(Especie, OtraEspecie) :-
    puedeEvolucionar(Especie, OtraEspecie).

% --------------------------------
% Código inicial - NO TOCAR
% --------------------------------

% tipo(Especie, Tipo).
tipo(charmander, fuego).
tipo(charmeleon, fuego).
tipo(charizard, fuego).
tipo(charizard, volador).

tipo(bulbasaur, planta).
tipo(bulbasaur, veneno).
tipo(ivysaur, planta).
tipo(ivysaur, veneno).
tipo(venusaur, planta).
tipo(venusaur, veneno).

tipo(squirtle, agua).
tipo(wartortle, agua).
tipo(blastoise, agua).

tipo(pikachu, electrico).
tipo(raichu, electrico).

tipo(farfetchd, normal).
tipo(farfetchd, volador).

tipo(eevee, normal).
tipo(flareon, fuego).
tipo(jolteon, electrico).
tipo(vaporeon, agua).
tipo(leafeon, planta).

tipo(moltres, fuego).
tipo(moltres, volador).

% evolucion(Especie, Evolucion).
evolucion(charmander, charmeleon).
evolucion(charmeleon, charizard).
evolucion(bulbasaur, ivysaur).
evolucion(ivysaur, venusaur).
evolucion(squirtle, wartortle).
evolucion(wartortle, blastoise).
evolucion(pikachu, raichu).
evolucion(eevee, flareon).
evolucion(eevee, jolteon).
evolucion(eevee, vaporeon).
evolucion(eevee, leafeon).

puedeEvolucionar(Especie, Evolucion):-
  evolucion(Especie, Evolucion).
puedeEvolucionar(Especie, Evolucion):-
  evolucion(Especie, OtraEspecie),
  puedeEvolucionar(OtraEspecie, Evolucion).

% --------------------------------
% TESTS - NO TOCAR
% --------------------------------

:- begin_tests(tests_tp2_tiposIncompatibles).

test(incompatiblesEsInversibleParaSuPrimerParametro, set(Tipo == [normal, planta, agua, electrico, veneno])):-
        incompatibles(fuego, Tipo).

test(incompatiblesEsInversibleParaSuSegundoParametro, set(Tipo == [agua,electrico,fuego,normal,volador])):-
        incompatibles(Tipo,veneno).

test(unTipoNoEsIncompatibleConsigoMismo, fail):-
        incompatibles(fuego, fuego).

test(siUnaMismaEspecieTieneDosTiposNoSonIncompatibles, fail):-
        incompatibles(planta,veneno).

:- end_tests(tests_tp2_tiposIncompatibles).

:- begin_tests(tests_tp2_ultimaEvolucion).

test(unaEvolucionIntermediaNoEsUltimaEvolucion, fail):-
        ultimaEvolucion(ivysaur).

test(unaEspecieBasicaQueNoEvolucionaNoEsUltimaEvolucion, fail):-
        ultimaEvolucion(farfetchd).

test(unaEspecieQueEsPrimerEvolucionEsUltimaSiNoHayUnaSegundaEvolucion, nondet):-
        ultimaEvolucion(flareon).

test(ultimaEvolucionEsInversible, set(Especie == [charizard, venusaur, blastoise, raichu, flareon, jolteon, vaporeon, leafeon])):-
        ultimaEvolucion(Especie).
:- end_tests(tests_tp2_ultimaEvolucion).

:- begin_tests(tests_tp2_predecible).

test(unaEspecieEsPredecibleSiTodasSusEvolucionesTienenUnMismoTipoQueElla, nondet):-
        predecible(charmander).

test(unaEspecieNoEsPredecibleSiNoTieneUnTipoQueTodasSusEvolucionesTambienTengan, fail):-
        predecible(eevee).

test(unaEspecieEsPredecibleSiNoPuedeEvolucionar, nondet):-
        predecible(flareon).

test(predecibeEsInversible, set(Especie == [charmander, charmeleon, charizard, bulbasaur, ivysaur, venusaur, squirtle, wartortle, blastoise, pikachu, raichu, farfetchd, flareon, jolteon, vaporeon, leafeon, moltres])):-
        predecible(Especie).
:- end_tests(tests_tp2_predecible).


:- begin_tests(tests_tp2_parecidas).

test(dosEspeciesSonParecidasSiTodosLosTiposCoincidenYNoPertenecenALaMismaLineaEvolutiva, nondet):-
        parecidas(moltres, charizard).

test(dosEspeciesNoSonParecidasSiPertenecenALaMismaLineaEvolutiva, fail):-
        parecidas(bulbasaur, ivysaur).

test(dosEspeciesNoSonParecidasSiAlgunTipoNoCoincide, fail):-
        parecidas(flareon, charizard).

test(parecidasEsInversibleParaSuPrimerParametro, set(Especie == [charmander, charmeleon])):-
        parecidas(Especie, flareon).

test(parecidasEsInversibleParaSuSegundoParametro, set(Especie == [pikachu, raichu])):-
        parecidas(jolteon, Especie).

:- end_tests(tests_tp2_parecidas).