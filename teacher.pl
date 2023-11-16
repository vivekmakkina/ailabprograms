teacher(john,maths).
teacher(lisa,physics).
teacher(alex,chemistry).
teacher(sarah,computer).

student(james,maths).
student(emily,physics).
student(oliver,computer).
student(emma,maths).
student(liam,physics).

teaches(Teacher, Subject) :-
    teacher(Teacher, Subject).

enrolled(Student, Subject) :-
    student(Student, Subject).
