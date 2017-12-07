function [f] = scanCubeColour(v)
%Scannt die Farbe des Würfels und gibt den
%den Farbwert in dem Schema: [R,G,B] [1,2,3] und 0 kein Wert zurück
%Rückgabewerte
%
%Schema: [f] = scanCubeColour(v)
%
%   1 = R
%   2 = G
%   3 = B
%   0 = KEIN WERT!

%%
%Steuert den Sensor an 
%v=vRob.getSensorColor();
%%

% max() gibt den maximal Wert 'Y(~)' zurück, 'f' die größte Stelle im Vektor
[~,f] = max(v);
%Wenn die Standartabweichung des Vektors kleiner 15 ist ist die Farbe
%schwarz
if std(v)<= 15
    f=0;
    
end

end
