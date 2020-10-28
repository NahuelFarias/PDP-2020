% No cambies esta declaración del módulo tp3, ya que podría traer
% problemas para correr las pruebas del proyecto.
:- module(tp3, [lecturaDensa/1, lectorIntenso/1]).

% ---------------------------------------------------------------------------- %

% --------------------------------
% Predicados a desarrollar
% --------------------------------

% libro(Nombre, Editorial, CantidadDePaginas)
% paper(Titulo, CantidadDeHojas, CantidadDeVisitas)
% saga(Nombre, CantidadDeLibros)

lecturaDensa(libro(_, _, CantidadDePaginas)) :-
  CantidadDePaginas >= 200.
lecturaDensa(libro(_, Editorial, _)) :-
  Editorial == paidos.
lecturaDensa(paper(_, CantidadDeHojas, CantidadDeVisitas)) :-
  CantidadDeHojas - CantidadDeVisitas > 100.
lecturaDensa(saga(_, CantidadDeLibros)) :-
  CantidadDeLibros > 4.

% leyo(Persona, Material)

leyoMasDeUnMaterial(Persona) :-
  leyo(Persona, Material),
  leyo(Persona, OtroMaterial),
  Material \= OtroMaterial.

lectorIntenso(Persona) :-
  leyoMasDeUnMaterial(Persona),
  forall(leyo(Persona, Material), lecturaDensa(Material)).

% --------------------------------
% Código inicial - NO TOCAR
% --------------------------------

leyo(nico, saga(dune,14)).
leyo(nico, libro(rebelionEnLaGranja,deBolsillo,144)).
leyo(nico, paper("No Silver Bullet: Essence and Accidents of Software Engineering", 230, 100)).
leyo(nico, paper("The relationship between design and verification", 250, 300)).

leyo(daiu, saga(fundacion,7)).
leyo(daiu, libro(elAleph,paidos,146)).

leyo(clara, paper("Evidence for a Distant Giant Planet in the Solar System", 170, 30)).
leyo(clara, paper("No Silver Bullet: Essence and Accidents of Software Engineering", 230, 100)).
leyo(clara, libro(rayuela,alfaguara,600)).
leyo(clara, saga(harryPotter,7)).

leyo(juan, libro(cosmos,planeta,362)).
leyo(juan, saga(elSeniorDeLosAnillos,3)).

leyo(flor, saga(harryPotter,7)).

% --------------------------------
% TESTS - NO TOCAR
% --------------------------------

:- begin_tests(tests_tp3_lecturaDensa).
test('un libro con al menos 200 paginas es denso', nondet):-
	lecturaDensa(libro(rayuela,alfaguara,600)).

test('un libro de editorial paidos es denso', nondet):-
  lecturaDensa(libro(elAleph,paidos,146)).

test('un libro corto de otra editorial no es denso', fail):-
  lecturaDensa(libro(rebelionEnLaGranja,deBolsillo,144)).

test('un paper es denso si la diferencia entre la cantidad de hojas y la cantidad de visitas es mayor que 100', nondet):-
  lecturaDensa(paper("Evidence for a Distant Giant Planet in the Solar System", 170, 30)).

test('un paper no es denso si la diferencia entre cantidad de hojas y visitas no llega a 100', fail):-
  lecturaDensa(paper("The relationship between design and verification", 250, 300)).

test('una saga es densa si tiene más de cuatro libros', nondet):-
  lecturaDensa(saga(dune,14)).

test('una saga corta no es densa', fail):-
  lecturaDensa(saga(elSeniorDeLosAnillos,3)).
:- end_tests(tests_tp3_lecturaDensa).

:- begin_tests(tests_tp3_lectorIntenso).
test('alguien que solo leyo un material de lectura no es lector intenso, incluso si ese material es denso', fail):-
	lectorIntenso(flor).

test('alguien que leyo algun material de lectura que no es denso no es lector intenso', fail):-
	lectorIntenso(nico).

test('alguien que leyo una saga densa y un libro denso es un lector inteso', nondet):-
  lectorIntenso(daiu).

test('alguien que leyo lecturas de todo tipo, y todas son densas, es lector intenso', nondet):-
  lectorIntenso(clara).

test('lectorIntenso/1 es inversible', set(Lector = [daiu, clara])):-
  lectorIntenso(Lector).
:- end_tests(tests_tp3_lectorIntenso).
