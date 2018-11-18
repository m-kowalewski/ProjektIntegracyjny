function [punkty,katy] = genPokrycie(wymiary,s1,s2,s3,lyzka, krok)
%Funkcja generujaca pokrycie calosci obszaru dla zakresow silownikow

% krok = 50;
z1 = s1(1):krok:s1(2);
z2 = s2(1):krok:s2(2);
z3 = s3(1):krok:s3(2);

punkty = zeros(length(z1)*length(z2)*length(z3),13);

starter = [20,30,5,-70,120,0,70,-20]*pi/180;
for i=1:length(z1)
    for j=1:length(z2)
        for k=1:length(z3)
            [pkt,katy] = GenKoniecLyzki(wymiary,z1(i),z2(j),z3(k),lyzka,starter);
            if katy ~= zeros(1,8)
                starter = katy;
            end
            punkty(k + length(z3)*j + length(z3)*length(z2)*i,1:2) = pkt;
            punkty(k + length(z3)*j + length(z3)*length(z2)*i,3:5) = [z1(i),z2(j),z3(k)];
            punkty(k + length(z3)*j + length(z3)*length(z2)*i,6:13) = katy;
        end
    end
end

end

