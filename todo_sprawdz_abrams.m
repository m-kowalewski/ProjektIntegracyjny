clear;
close all;
load('wymiary_baza.mat');
% Tutaj zmiana nr danych
nr_zestawu = 2;
wymiary = data(:,nr_zestawu);

maxZakres = ZakresySilownikow(wymiary);
% Format danych dla lopaty zgodnie ze schema
lyzka_zasieg = 396.9;
lyzka_srodek = [150;-200];

s1 = 1200;
s2 = 1000;
s3 = 950;
starter = [-0.6001   -0.5645   -0.9420   -1.9483    1.0689    0.2599    60/180*pi    0];
katy = WezKaty(wymiary,s1,s2,s3,starter);
RysujMechanizm(wymiary,katy,lyzka_zasieg);
sily = WyznaczSily(wymiary,katy,1000,-500,448300);

RysujSily(wymiary,katy,lyzka_zasieg,sily,1000,-500,448300);