function [f] = interpretSensorColour(v)
%Sensorinterpretation der Farbe des Würfels, gibt den Farbwert zurück.
%
%Schema: [f] = interpretSensorColour(v)
%Rückgabewerte:
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
% letz. Bearbeiter : Sebastian Neumeier (12.12.2017)
%*****************************************************

%%
%Steuert den Sensor an und bekommt einen Zeilen Vektor der 3.Dim zurück
%der in 'v' gespeichert wird
%v=vRob.getSensorColor();


% max(v) gibt den maximalsten Wert des Vektors 'v' zurück, 
% bei '[~,f]' wäre '~'(unterdrückt) dieser Wert und 'f' die Position im
% Vektor
[~,f] = max(v);


%Wenn die Standartabweichung des Vektors <=15(ermittelter Wert) ist, ist die Farbe
%schwarz -> Kein Wert
if std(v)<= 15
    f=0;
    
end

end
