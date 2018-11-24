function [] = SilyOdDlugosci(sily,pokrycie)
%Funkcja obrazuje jak dlugosc silownikow wplywa na wytworzone sily
f1 = sily(:,3);
f2 = sily(:,4);
f3 = sily(:,7);

s1 = pokrycie(:,3);
s2 = pokrycie(:,4);
s3 = pokrycie(:,5);
figure
subplot(3,3,1)
plot(s1,f1,'*');
title('Wplyw dl. silownika 1 na sile w sil 1');
subplot(3,3,2)
plot(s1,f2,'*');
title('Wplyw dl. silownika 1 na sile w sil 2');
subplot(3,3,3)
plot(s1,f3,'*');
title('Wplyw dl. silownika 1 na sile w sil 3');

subplot(3,3,4)
plot(s2,f1,'*');
title('Wplyw dl. silownika 2 na sile w sil 1');
subplot(3,3,5)
plot(s2,f2,'*');
title('Wplyw dl. silownika 2 na sile w sil 2');
subplot(3,3,6)
plot(s2,f3,'*');
title('Wplyw dl. silownika 2 na sile w sil 3');

subplot(3,3,7)
plot(s3,f1,'*');
title('Wplyw dl. silownika 3 na sile w sil 1');
subplot(3,3,8)
plot(s3,f2,'*');
title('Wplyw dl. silownika 3 na sile w sil 2');
subplot(3,3,9)
plot(s3,f3,'*');
title('Wplyw dl. silownika 3 na sile w sil 3');

end

