function [zerowe] = ZbadaZbieznosc(pokrycie)
%Funkcja ulatwiajaca diagnostyke zbieznosci w zaleznosci od wymiarow
zerowe = zeros(1,3);
it = 1;
for i=1:length(pokrycie)
   if pokrycie(i,6:13) == zeros(1,8)
      zerowe(it,:) = pokrycie(i,3:5);
      it = it + 1;
   end
end
% figure
% subplot(2,3,1)
% plot(zerowe(:,1),'*')
% subplot(2,3,2)
% plot(zerowe(:,2),'*')
% subplot(2,3,3)
% plot(zerowe(:,3),'*')
% subplot(2,3,4)
% plot(zerowe(:,1),zerowe(:,2),'*')
% subplot(2,3,5)
% plot(zerowe(:,1),zerowe(:,3),'*')
% subplot(2,3,6)
% plot(zerowe(:,2),zerowe(:,3),'*')
plot3(zerowe(:,1),zerowe(:,2),zerowe(:,3),'*');
end

