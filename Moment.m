function [moment] = Moment(kat,promien,versor_sily)
% Funkcja zwraca moment do przenozenia przez wartosc bezwzgledna
% sily
moment = (R(kat)*promien)'*[versor_sily(2);-versor_sily(1)];
end

