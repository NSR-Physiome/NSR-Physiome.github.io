M=[1 1 1 1; -3.0 1.0 1.0 0; 2.0 -2.0 0 1.0;1.0 0 -2.0 1.0; 0 1.0 1.0 -2.0];
T=[10.0 0 0 0 0]';
F=(M'*M)\M'*T
save 'jsteady.txt' F -ASCII
exit