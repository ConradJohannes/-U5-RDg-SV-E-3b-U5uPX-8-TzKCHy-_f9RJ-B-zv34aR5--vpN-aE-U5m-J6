function [f] = interpretSensorColour(v)
% Sensorinterpretation der Farbe des Würfels, gibt den Farbwert in 'f' zurück.
% Eingabewert 'v' ist der Rückgabewert(Vektor) der Funktion 'vRob.getSensorColor()' 
%
% Schema: [f] = interpretSensorColour(v)
% Rückgabewerte:
%   1 = R
%   2 = G
%   3 = B
%   0 = KEIN WERT!
%
% 
%*****************************************************
% PST-Projekt/ [f] = interpretSensorColour(v)
% Versionsnummer   : 1.0 (12.12.2017)
% erstellt am      : 05.12.2017
% erstellt durch   : Sebastian Neumeier
% letz. Änderung   : 12.12.2017
% letz. Bearbeiter : Sebastian Neumeier
% Programmierspr.  : Matlab
%*****************************************************

%%

% '[~,f] = max(v)' gibt den maximalsten Wert des Vektors 'v' zurück, 
% '~'(unterdrückt) ist dieser größte Wert und 'f' die Position
% des selbigen im Vektor 'v'.
[~,f] = max(v);


% Wenn die Standartabweichung des Vektors('v') <=15(ermittelter Wert) ist, ist die Farbe
% schwarz -> Kein Wert
if std(v)<= 15
    f=0;
    
end

end
