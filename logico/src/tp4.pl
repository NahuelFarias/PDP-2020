% No cambies esta declaración del módulo tp4, ya que podría traer
% problemas para correr las pruebas del proyecto.
:- module(tp4, [votosTotales/2, decidida/1]).

% ---------------------------------------------------------------------------- %

% --------------------------------
% Predicados a desarrollar
% --------------------------------

votosTotales(Partido, VotosTotales) :-
	votos(Partido, _, _ ),
	findall(Voto, votos(Partido, _, Voto), ListaDeVotos),
	sum_list(ListaDeVotos, VotosTotales).
	
% ------------------------------------------

decidida(Provincia) :-
	muyVotadoEn(Partido, Provincia),
	not((muyVotadoEn(OtroPartido, Provincia), Partido \= OtroPartido) ).

votadoEn(Partido, Provincia) :-
	votos(Partido, Provincia, _).

muyVotadoEn(Partido, Provincia) :-
	votos(Partido, Provincia, Votos),
	padron(Provincia, Personas),
	VotosTotales is (30 * Personas) // 100,
	Votos > VotosTotales.

% --------------------------------
% Código inicial - NO TOCAR
% --------------------------------

votos(pps, caba, 750450).
votos(pps, bsas, 900302).
votos(pps, jujuy, 43725).
votos(pps, salta, 35879).
votos(pps, cordoba, 580493).
votos(pps, entreRios, 47980).
votos(pps, corrientes, 158394).
votos(pps, misiones, 120865).
votos(pps, laRioja, 236583).
votos(pps, chaco, 89402).
votos(pps, neuquen, 130385).
votos(pps, rioNegro, 106097).

votos(lcd, caba, 730750).
votos(lcd, bsas, 1000243).
votos(lcd, jujuy, 44525).
votos(lcd, salta, 30073).
votos(lcd, cordoba, 481457).
votos(lcd, entreRios, 43910).
votos(lcd, corrientes, 198594).
votos(lcd, misiones, 187843).
votos(lcd, laRioja, 223509).
votos(lcd, formosa, 79542).
votos(lcd, neuquen, 150975).
votos(lcd, sanJuan, 122397).

votos(plis, caba, 930180).
votos(plis, bsas, 990398).
votos(plis, formosa, 41024).
votos(plis, salta, 17872).
votos(plis, laPampa, 10483).
votos(plis, sanJuan, 97960).

votos(dlg, caba, 250470).
votos(dlg, bsas, 30372).
votos(dlg, jujuy, 173794).
votos(dlg, salta, 66879).
votos(dlg, cordoba, 51493).
votos(dlg, entreRios, 40450).
votos(dlg, corrientes, 238604).
votos(dlg, misiones, 240811).
votos(dlg, laRioja, 296560).
votos(dlg, sanJuan, 81478).
votos(dlg, neuquen, 180320).
votos(dlg, laPampa, 158327).

padron(caba, 2891970).
padron(bsas, 3221085).
padron(jujuy, 282034).
padron(salta, 150703).
padron(cordoba, 1513487).
padron(entreRios, 132340).
padron(corrientes, 795592).
padron(misiones, 549519).
padron(laRioja, 756652).
padron(chaco, 98402).
padron(neuquen, 471680).
padron(rioNegro, 106097).
padron(formosa, 120566).
padron(sanJuan, 301835).
padron(laPampa, 168810).

% --------------------------------
% TESTS - NO TOCAR
% --------------------------------

:- begin_tests(tests_tp4_votosTotales).

test(el_total_para_un_partido_que_fue_votado_es_unico, set(Total = [3200555])):-
	votosTotales(pps, Total).

test(no_hay_total_para_un_partido_que_no_fue_votado, fail):-
	votosTotales(ads, _).

test(votos_totales_es_inversible_respecto_al_partido, set(Partido = [pps, lcd, plis, dlg])):-
  votosTotales(Partido, _).

:- end_tests(tests_tp4_votosTotales).

:- begin_tests(tests_tp4_decidida).

test(caba_esta_decidida_por_plis, nondet):-
	decidida(caba).

test(bsas_no_esta_decidida_porque_hay_mas_de_un_partido_muy_votado, fail):-
	decidida(bsas).

test(corrientes_no_esta_decidida_porque_no_hay_partidos_muy_votados, fail):-
	decidida(corrientes).

test(decidida_es_inversible, set(Provincia = [chaco, rioNegro, caba, jujuy, salta, laPampa])):-
  decidida(Provincia).


:- end_tests(tests_tp4_decidida).