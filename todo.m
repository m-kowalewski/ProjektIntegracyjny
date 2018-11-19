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
lyzka_srodek = [150;-200];
% Podaj zakresy jakie maja dobrane silowniki
s1 = [900,1400];
s2 = [900,1150];
s3 = [750,1150];
% Walidacja, czy pasuje
% TODO
% Generacja pokrytego obszaru koncowka lyzki
pokrycie = genPokrycie(wymiary,s1,s2,s3,lyzka_zasieg,25);
save('pokrycie.mat','pokrycie');
plot(pokrycie(:,1),pokrycie(:,2),'*');
% Dla wygenerowanego pokrycia wygenerowac sily w zlaczeniach
% Warto wczytac jesli nie zmienilismy wymiarow
% load('pokrycie.mat');
% po pokryciu slabo liczy, lepiej liczyc osobno
%sily = GenSilyNoszenie(wymiary,lyzka_zasieg,lyzka_srodek,pokrycie);

% s1 = 1200;
% s2 = 1000;
% s3 = 950;
% katy = WezKaty(wymiary,s1,s2,s3,[20,30,5,-70,120,0,70,-20]*pi/180);
% RysujMechanizm(wymiary,katy);
% 