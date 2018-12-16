function [npokrycie] = ZmniejszZasieg(rs1,rs2,rs3,pokrycie)
%Zmniejsza zakres w oparciu o ograniczenia
npokrycie = zeros(1,13);
w = 1;
for i=1:length(pokrycie)
    if pokrycie(i,3) >= rs1(1) & pokrycie(i,3) <= rs1(2)
        if pokrycie(i,4) >= rs2(1) & pokrycie(i,4) <= rs2(2)
            if pokrycie(i,5) >= rs3(1) & pokrycie(i,5) <= rs3(2)
                npokrycie(w,:) = pokrycie(i,:);
                w = w + 1;
            end
        end
    end
end

