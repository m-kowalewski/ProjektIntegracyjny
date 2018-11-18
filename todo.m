% Generacja danych
clear;
close all;
load('wymiary_baza.mat');
% Tutaj zmiana nr danych
nr_zestawu = 1;
wymiary = data(:,nr_zestawu);

maxZakres = ZakresySilownikow(wymiary);
% Format danych dla lopaty zgodnie ze schema
lyzka_zasieg = 410;
% Podaj zakresy jakie maja dobrane silowniki
s1 = [900,1500];
s2 = [750,1100];
s3 = [700,1100];
% Walidacja, czy pasuje
% TODO
% Generacja pokrytego obszaru koncowka lyzki
pokrycie = genPokrycie(wymiary,s1,s2,s3,lyzka_zasieg,25);
plot(pokrycie(:,1),pokrycie(:,2),'*');

s1 = 1200;
s2 = 1000;
s3 = 950;
katy = WezKaty(wymiary,s1,s2,s3,[20,30,5,-70,120,0,70,-20]*pi/180);
RysujMechanizm(wymiary,katy)
% 