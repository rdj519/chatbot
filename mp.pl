:- dynamic has/2.
:- dynamic person/1.


has(person, symptom).

asthma(X) :-
    has(X, chest_pain),
    has(X, coughing),
    has(X, difficulty_breathing),
    has(X, pale_face),
    has(X, shortness_of_breath),
    has(X, tiredness),
    has(X, wheezing).

headPain(X) :-
    has(X, headache),
    write(' You have headache.'), nl.

start :- choose_category.

retract_symptom(X, Y) :-
    retract(has(X,Y)).

choose_category:- write('Pick a category'), nl,
              write('1. Head'), nl,
              write('2. Upper Body'), nl,
	      write('3. Lower Body'), nl,
              write('4. Respiratory System'), nl,
              write('5. Genitals'), nl,
	      write('6. Digestive System'), nl,
	      write('7. Psychological'), nl,
	      write('8. Skin & Muscles (Physiological)'), nl,
	      write('9. Discharge'), nl,
	      write('10. Others'), nl,
              nl, nl, write('11. consult'), nl,
	      read(X),
	      nl, /* for now head category is the only available */
	      (X == 1 -> head_category; nl).

head_category :- /* not yet done because we can retract symptoms */
		write('Do you have headache?'), nl,
		read(A),nl, /*; A == no -> has(patient, headache) -> retract(has(patient, headache));.. */
		(A == yes -> assert(has(patient, headache)),nl ; nl),
		write('Are your eyes (or either of your eyes) irritated? '), nl,
		read(B), nl,
		(B == yes -> assert(has(patient, irritated_eyes)), nl; nl),
                write('Do you have neck pain?'), nl,
                read(C), nl,
                (C == yes -> assert(has(patient, neck_pain)), nl ; nl),
                write('Pale face?'), nl,
                read(D), nl,
                (D == yes -> assert(has(patient, pale_face)), nl;  nl),
                write('Do you have a runny nose?'), nl,
                read(E), nl,
                (E == yes -> assert(has(patient, runny_nose)), nl; nl),
                write('Are you having seizures?'), nl,
                read(F), nl,
                (F == yes -> assert(has(patient, seizures)), nl; nl),
                write('Sensitive to light?'), nl,
                read(G), nl,
                (G == yes -> assert(has(patient, sensitivity_to_light)), nl;  nl),
                write('Do you have stiff neck? '), nl,
                read(H), nl,
                (H == yes -> assert(has(patient, stiff_neck)), nl; nl), nl,
                write('noted.'), nl,
                choose_category.



