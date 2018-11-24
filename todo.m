% Generacja danych
clear;
close all;
load('wymiary_baza.mat');
% Tutaj zmiana nr danych
nr_zestawu = 2;
wymiary = data(:,nr_zestawu);
lyzka_zasieg = 396.9;
lyzka_srodek = [150;-200];
maxZakres = ZakresySilownikow(wymiary);
% Format danych dla lopaty zgodnie ze schema


% % Podaj zakresy jakie maja dobrane silowniki
% s1 = [940,1600];
% s2 = [760,1160];
% s3 = [840,1200];
% % Walidacja, czy pasuje
% % TODO
% % Generacja pokrytego obszaru koncowka lyzki
% pokrycie = genPokrycie(wymiary,s1,s2,s3,lyzka_zasieg,20);
% save('pokrycie.mat','pokrycie');
% plot(pokrycie(:,1),pokrycie(:,2),'*');
% % Dla wygenerowanego pokrycia wygenerowac sily w zlaczeniach
% % Warto wczytac jesli nie zmienilismy wymiarow
% 
% zerowane = 0;
% w = 1;
% for i=1:length(pokrycie)
%     if pokrycie(i,1:2) == zeros(1,2)
%         zerowane(w) = i;
%         w = w + 1;
%     end
% end

load('pokrycie.mat');
% sily = GenSilyNoszenie(wymiary,lyzka_zasieg,lyzka_srodek,pokrycie);
sily = GenSilySkrawanieLyzka(wymiary,lyzka_zasieg,lyzka_srodek,pokrycie);
SilyOdDlugosci(sily,pokrycie);



% [1020 960 750]
% s1 = 940;
% s2 = 760;
% s3 = 840;
% katy = WezKaty(wymiary,s1,s2,s3,pokrycie(1996,6:13));
% RysujMechanizm(wymiary,katy,lyzka_zasieg);


