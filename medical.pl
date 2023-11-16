symptom(john, fever).
symptom(john, cough).
symptom(jane, headache).
symptom(jane, fatigue).

% Rules defining relationships between symptoms and diseases
has_disease(Patient, flu) :-
    symptom(Patient, fever),
    symptom(Patient, cough).

has_disease(Patient, cold) :-
    symptom(Patient, cough),
    symptom(Patient, headache).

has_disease(Patient, stress) :-
    symptom(Patient, headache),
    symptom(Patient, fatigue).

% Predicate for medical diagnosis
diagnose(Patient, Disease) :-
    has_disease(Patient, Disease),
    write(Patient), write(' has '), write(Disease), write('.').

