student(john).
student(emma).
student(susan).

teacher(prof_smith).
teacher(prof_jones).

subject(math101).
subject(english202).

% Codes representing student enrollment in subjects
enrollment_code(john, math101, prof_smith, 'ABC123').
enrollment_code(john, english202, prof_jones, 'XYZ789').
enrollment_code(emma, math101, prof_smith, 'DEF456').
enrollment_code(susan, english202, prof_jones, 'GHI789').

% Queries
student_subject_code(Student, Subject, Teacher, Code) :- enrollment_code(Student, Subject, Teacher, Code).
