function [katy,iteracje] = WezKaty(wymiary,s1,s2,s3,starter)
% Funkcja wyznacza katy i polozenia wezlow w zaleznosci
% od aktualnych dlugosci silownikow
% [20,30,5,-70,120,0,70,-20]*pi/180

% Teraz rozwiazanie zadania na polozenie
fun = @(x)(ZadaniePolozenie(x,wymiary,s1,s2,s3));
[katy,fval,exitflag,output] = fsolve(fun,starter);
iteracje = output.iterations;
end

