% Generacja danych
clear;
close all;
load('wymiary_baza.mat');
% Tutaj zmiana nr danych
nr_zestawu = 18;
wymiary = data(:,nr_zestawu);
lyzka_zasieg = 396.9;
lyzka_srodek = [150;-200];
maxZakres = ZakresySilownikow(wymiary);

s1 = [640,1340];
s2 = [940,1640];
s3 = [1000,1240];

load('pokrycie.mat');
% % maska po analizie

s1_maska = [640,1240];
s1(1)=s1_maska(1);
s1(2)=s1_maska(2);
s2_maska = [940,1640];
s2(1)=s2_maska(1);
s2(2)= s2_maska(2);
pokrycie = ZmniejszZasieg(s1_maska,s2_maska,s3,pokrycie);

sily = GenSilySkrawanieLyzka(wymiary,lyzka_zasieg,lyzka_srodek,pokrycie);
SilyOdDlugosci(sily,pokrycie);

% % zakres1 ograniczenie 1 silownika

s1_2A=[740,1240];
pokrycie2A=ZmniejszZasieg(s1_2A,s2,s3,pokrycie);
pokrycie2A_Dolne=ZmniejszZasieg([s1(1),s1_2A(1)-1],s2,s3,pokrycie);
pokrycie2A_Gorne=ZmniejszZasieg([s1_2A(2)+1,s1(2)],s2,s3,pokrycie);
sily2A = GenSilySkrawanieLyzka(wymiary,lyzka_zasieg,lyzka_srodek,pokrycie2A);
SilyOdDlugosci(sily2A,pokrycie2A);

% % zakres2 ograniczenie 2 silownika

s2_2B=[940,1640];
pokrycie2B=ZmniejszZasieg(s1,s2_2B,s3,pokrycie);
pokrycie2B_Dolne=ZmniejszZasieg(s1,[s2(1),s2_2B(1)-1],s3,pokrycie);
pokrycie2B_Gorne=ZmniejszZasieg(s1,[s2_2B(2)+1,s2(2)],s3,pokrycie);
sily2B = GenSilySkrawanieLyzka(wymiary,lyzka_zasieg,lyzka_srodek,pokrycie2B);
SilyOdDlugosci(sily2B,pokrycie2B);

% % postepy zmian pokrycia w zaleznosci od silownikow

figure;
plot(pokrycie(:,1),pokrycie(:,2),'*');
hold on;
plot(pokrycie2A_Dolne(:,1),pokrycie2A_Dolne(:,2),'*');
plot(pokrycie2A_Gorne(:,1),pokrycie2A_Gorne(:,2),'*');
plot(pokrycie2B_Dolne(:,1),pokrycie2B_Dolne(:,2),'*');
plot(pokrycie2B_Gorne(:,1),pokrycie2B_Gorne(:,2),'*');
legend('pelne_pokrycie','dolne_1','gorne_1','dolne_2','gorne_2');
hold off;