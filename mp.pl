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

choose_category :- write('Pick a category'), nl,
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
	      (X == 1 -> head_category;
               X == 2 -> upper_body_category;
               X == 3 -> lower_body_category;
               X == 4 -> respiratory_system_category;
               X == 5 -> genitals_category;
               X == 6 -> digestive_system_category;
               X == 7 -> psychological_category;
               X == 8 -> skin_and_muscles_category;
               X == 9 -> discharge_category;
               X == 10 -> others_category;
               X == 11 -> consult(patient)).

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
                (H == yes -> assert(has(patient, stiff_neck)), nl; nl),
                write('noted.'), nl,
                choose_category.

upper_body_category :-
                write('Do you have back pain?'), nl,
                read(A), nl,
                (   A == yes -> assert(has(patient, back_pain)), nl; nl),
                write('Do you have chest pain?'), nl,
                read(B), nl,
                (   B == yes -> assert(has(patient, chest_pain)), nl; nl),
                write('Do you experience heartburn?'), nl,
                read(C), nl,
                (   C == yes -> assert(has(patient, heartburn)), nl; nl),
                write('noted.'), nl,
                choose_category.

lower_body_category :-
                write('Do you have legs stiffness?'), nl,
                read(A), nl,
                (   A == yes -> assert(has(patient, leggs_stiffness)), nl; nl),
                write('noted.'), nl,
                choose_category.

respiratory_system_category :-
                write('Do you have persistent coughing?'), nl,
                read(A), nl,
                (   A == yes -> assert(has(patient, coughing)), nl; nl),
                write('Do you cough blood? '), nl,
                read(B), nl,
                (   B == yes -> assert(has(patient, coughing_blood)), nl; nl),
                write('Do you have difficulty breathing?'), nl,
                read(C), nl,
                (   C == yes -> assert(has(patient, difficulty_breathing)), nl; nl),
                write('Do you experience shortness of breath?'), nl,
                read(D), nl,
                (   D == yes -> assert(has(patient, shortness_of_breath)), nl; nl),
                write('Do you have a sore throat?'), nl,
                read(E), nl,
                (   E == yes -> assert(has(patient, sore_throat)), nl; nl),
                write('Do you experience wheezing when breathing?'), nl,
                read(F), nl,
                (   F == yes -> assert(has(patient, wheezing)), nl; nl),
                write('noted.'), nl,
                choose_category.

genitals_category :-
                write('Do you feel burning sensation when urinating?'), nl,
                read(A), nl,
                (   A == yes -> assert(has(patient, burning_sensation_from_urination)), nl; nl),
                write('Do you experience pain from intercourse?'), nl,
                read(B), nl,
                (   B == yes -> assert(has(patient, pain_from_intercourse)), nl; nl),
                write('Do you experience pain from urinating?'), nl,
                read(C), nl,
                (   C == yes -> assert(has(patient, pain_from_urinating)), nl; nl),
                write('Do you have a sore anus or feel rectal pain?'), nl,
                read(D), nl,
                (   D == yes -> assert(has(patient, sore_anus)), nl; nl),
                write('Do you have sore genitals?'), nl,
                read(E), nl,
                (   E == yes -> assert(has(patient, sore_genitals)), nl; nl),
                write('noted.'),nl,
                choose_category.

digestive_system_category :-
                write('Do you feel abdominal pain?'), nl,
                read(A), nl,
                (   A == yes -> assert(has(patient, abdominal_pain)), nl; nl),
                write('Do you experience acid reflux?'), nl,
                read(B), nl,
                (   B == yes -> assert(has(patient, acid_reflux)), nl; nl),
                write('Do you experience bloating?'), nl,
                read(C), nl,
                (   C == yes -> assert(has(patient, bloating)), nl; nl),
                write('Do you have diarrhea?'), nl,
                read(D), nl,
                (   D == yes -> assert(has(patient, diarrhea)), nl; nl),
                write('Do you experience excessive salivation?'), nl,
                read(E), nl,
                (   E == yes -> assert(has(patient, excessive_salivation)), nl; nl),
                write('Do you experience indigestion?'), nl,
                read(F), nl,
                (   F == yes -> assert(has(patient, indigestion)), nl; nl),
                write('Do you experience loss of appetite?'), nl,
                read(G), nl,
                (   G == yes -> assert(has(patient, loss_of_appetite)), nl; nl),
                write('Do you experience pain from eating?'), nl,
                read(H), nl,
                (   H == yes -> assert(has(patient, pain_from_eating)), nl; nl),
                write('noted.'), nl,
                choose_category.

psychological_category :-
                write('Are you anxious?'), nl,
                read(A), nl,
                (   A == yes -> assert(has(patient, anxiety)), nl; nl),
                write('Do you feel confusion?'), nl,
                read(B), nl,
                (   B == yes -> assert(has(patient, confusion)), nl; nl),
                write('Do you experience fear of water?'), nl,
                read(C), nl,
                (   C == yes -> assert(has(patient, fear_of_water)), nl; nl),
                write('Are you experiencing hallucinations?'), nl,
                read(D), nl,
                (   D == yes -> assert(has(patient, hallucinations)), nl; nl),
                write('Do you experience hyperactivity?'), nl,
                read(E), nl,
                (   E == yes -> assert(has(patient, hyperactivity)), nl; nl),
                write('Are you experiencing insomnia?'), nl,
                read(F), nl,
                (   F == yes -> assert(has(patient, insomnia)), nl; nl),
                write('Do you experience irritability?'), nl,
                read(G), nl,
                (   G == yes -> assert(has(patient, irritability)), nl; nl),
                write('Do you experience pain lethargy?'), nl,
                read(H), nl,
                (   H == yes -> assert(has(patient, lethargy)), nl; nl),
                write('Do you experience sleepiness?'), nl,
                read(I), nl,
                (   I == yes -> assert(has(patient, sleepiness)), nl; nl),
                write('Do you experience tiredness?'), nl,
                read(J), nl,
                (   J == yes -> assert(has(patient, tiredness)), nl; nl),
                write('noted.'), nl,
                choose_category.

skin_and_muscles_category :-
                write('Do you feel convulsion from your muscles?'), nl,
                read(A), nl,
                (   A == yes -> assert(has(patient, convulsion)), nl; nl),
                write('Is your skin easily bruised?'), nl,
                read(B), nl,
                (   B == yes -> assert(has(patient, easy_bruising)), nl; nl),
                write('Does your skin show jaundice?'), nl,
                read(C), nl,
                (   C == yes -> assert(has(patient, jaundice)), nl; nl),
                write('Are you experiencing pain from joints?'), nl,
                read(D), nl,
                (   D == yes -> assert(has(patient, joint_pain)), nl; nl),
                write('Do you experience muscle ache?'), nl,
                read(E), nl,
                (   E == yes -> assert(has(patient, muscle_ache)), nl; nl),
                write('Are you experiencing partial paralysis (from any part of your body)?'), nl,
                read(F), nl,
                (   F == yes -> assert(has(patient, partial_paralysis)), nl; nl),
                write('Do you have purple bruises on skin?'), nl,
                read(G), nl,
                (   G == yes -> assert(has(patient, purple_bruises_on_skin)), nl; nl),
                write('Do you have skin rashes?'), nl,
                read(H), nl,
                (   H == yes -> assert(has(patient, rashes)), nl; nl),
                write('noted.'), nl,
                choose_category.

discharge_category :-
                write('Do you have bloody feces (even ocassionally or once)?'), nl,
                read(A), nl,
                (   A == yes -> assert(has(patient, bloody_feces)), nl; nl),
                write('Do you have bloody urine (even ocassionally or once)?'), nl,
                read(B), nl,
                (   B == yes -> assert(has(patient, bloody_urine)), nl; nl),
                write('Do you have cloudy urine (even ocassionally or once)?'), nl,
                read(C), nl,
                (   C == yes -> assert(has(patient, cloudy_urine)), nl; nl),
                write('Does your spit or sneeze contain mucus?'), nl,
                read(D), nl,
                (   D == yes -> assert(has(patient, mucus)), nl; nl),
                write('Do you have a pus-like discharge on your genitals?'), nl,
                read(E), nl,
                (   E == yes -> assert(has(patient, pus_like_discharge)), nl; nl),
                write('Do you have rice-water feces?'), nl,
                read(F), nl,
                (   F == yes -> assert(has(patient, rice_water_feces)), nl; nl),
                write('noted.'), nl,
                choose_category.

others_category :-
                write('Do you have anemia?'), nl,
                read(A), nl,
                (   A == yes -> assert(has(patient, anemia)), nl; nl),
                write('Do you have chills?'), nl,
                read(B), nl,
                (   B == yes -> assert(has(patient, chills)), nl; nl),
                write('Do you have dehydration?'), nl,
                read(C), nl,
                (   C == yes -> assert(has(patient, dehydration)), nl; nl),
                write('Do you have high fever(check for body temperature)?'), nl,
                read(D), nl,
                (   D == yes -> assert(has(patient, high_fever)), nl; nl),
                write('Do you have koplik\'s spots (white spots in mouth)?'), nl,
                read(E), nl,
                (   E == yes -> assert(has(patient, koplik_spots)), nl; nl),
                write('Did you have a rapid or significant loss of weight?'), nl,
                read(F), nl,
                (   F == yes -> assert(has(patient, loss_of_weight)), nl; nl),
                write('Do you have low blood pressure(check for low blood pressure)?'), nl,
                read(G), nl,
                (   G == yes -> assert(has(patient, low_blood_pressure)), nl; nl),
                write('Do you have nausea or any inclination to vomit?'), nl,
                read(H), nl,
                (   H == yes -> assert(has(patient, nausea)), nl; nl),
                write('Do you experience night sweats?'), nl,
                read(I), nl,
                (   I == yes -> assert(has(patient, night_sweats)), nl; nl),
                write('Do you sweat profusely?'), nl,
                read(J), nl,
                (   J == yes -> assert(has(patient, profuse_sweating)), nl; nl),
                write('Do you have a rapid heart rate(check using stethoscope)?'), nl,
                read(J), nl,
                (   J == yes -> assert(has(patient, rapid_heart_rate)), nl; nl),
                write('noted.'), nl,
                choose_category.

/* only up to here is valid code */

consult(X):- /* this method is error pa */
     asthma(X) -> write('You have asthma')./* not defined yet */










