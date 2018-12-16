function [punkty,katy] = genPokrycie(wymiary,s1,s2,s3,lyzka, krok)
%Funkcja generujaca pokrycie calosci obszaru dla zakresow silownikow

% krok = 50;
z1 = s1(1):krok:s1(2);
z2 = s2(1):krok:s2(2);
z3 = s3(1):krok:s3(2);

punkty = zeros(length(z1)*length(z2)*length(z3),13);
%v6
% starter = [-0.6931   -0.7223   -1.4218   -1.2948    1.7347    0.9062    1.3148    1.0919]; 
%v8
% starter = [-0.3184   -0.1557   -0.9960   -1.3039    1.6699    1.1280    1.3675   -4.9207];
%v4
% starter = [-0.6768   -0.6647   -1.2360   -0.8496    2.1799    1.3514    1.7600    1.5371];
%v10
% starter = [-0.6184   -0.1557   -0.9960   -1.3039    1.6699    1.1280    1.3675   -4.9207];
%v18
% starter = [1.2886    1.6755    0.9674    0.9260    4.0702    2.7618    3.4125   -2.7899];
%v20
starter = [1.2886    1.6755    0.9674    0.9260    4.0702    2.7618    4   2.7899];
for i=1:length(z1)
    if i>1 & punkty(length(z3)*length(z2)*(i-2)+1,6:13) ~= zeros(1,8)
        starter = punkty(length(z3)*length(z2)*(i-2)+1,6:13);
    end
    for j=1:length(z2)
        if j>1 & punkty(length(z3)*(j-2) + length(z3)*length(z2)*(i-1)+1,6:13) ~= zeros(1,8)
            starter = punkty(length(z3)*(j-2) + length(z3)*length(z2)*(i-1)+1,6:13);
        end
        for k=1:length(z3)
            [pkt,katy] = GenKoniecLyzki(wymiary,z1(i),z2(j),z3(k),lyzka,starter);
            if katy ~= zeros(1,8)
                starter = katy;
            else
                [pkt,katy] = GenKoniecLyzki(wymiary,z1(i),z2(j),z3(k),lyzka,[20,30,5,-70,120,0,70,-20]*pi/180);
                if katy ~= zeros(1,8)
                    starter = katy;
                end
            end
            punkty(k + length(z3)*(j-1) + length(z3)*length(z2)*(i-1),1:2) = pkt;
            punkty(k + length(z3)*(j-1) + length(z3)*length(z2)*(i-1),3:5) = [z1(i),z2(j),z3(k)];
            punkty(k + length(z3)*(j-1) + length(z3)*length(z2)*(i-1),6:13) = katy;
        end
    end
end

end

