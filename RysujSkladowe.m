function [linia] = RysujSkladowe(F,mnoz,punkt,color)
%Rysuje sile na plot
lineW = 1;
p = [punkt;punkt+F'*mnoz];
kat = atan2(F(2),F(1));
p2 = punkt+F'*mnoz+(R(135/180*pi)*F*mnoz)'/4;
p3 = punkt+F'*mnoz+(R(-135/180*pi)*F*mnoz)'/4;
linia = line(p(:,1),p(:,2),'Color',color,'LineWidth',lineW);
line([p(2,1);p2(1,1)],[p(2,2);p2(1,2)],'Color',color,'LineWidth',lineW);
line([p(2,1);p3(1,1)],[p(2,2);p3(1,2)],'Color',color,'LineWidth',lineW);
end

