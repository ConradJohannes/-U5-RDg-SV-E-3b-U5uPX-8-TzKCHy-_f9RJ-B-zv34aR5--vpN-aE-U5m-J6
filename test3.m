function [klein,groe] = test3(v)
%Funktion sucht in einem Vektor die kleinste und größte Zahl
%[klei,groe] = test3(v)

% Zuweisung v(1) nimmt sich eine Zahl aus dem Vektor die auf jeenfall in
% diesem vorhanden ist. Bei Zuweißung =0 wäre das eventuell die kleinste
% Ausgabe obwohl sie im Vektor gar nicht vorhanden ist
klein = v(1);
groe = v(1);

%Zählt von 1 so oft bis die Zahl die Zahlen des Vektors entspricht
for ii = 1:numel(v)
    switch 1
        %v(ii) zählt pro Durhgang die Komponenten des Vektors
        %durch.
        case v(ii) <= klein
            klein= v(ii);
        case v(ii) >= groe
            groe=v(ii);
        otherwise
            disp('Fehler!') %BUG Funktioniert auh mit String Eingaben.
    end
end

end




