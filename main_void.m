function [f] = main_void(~)
% Hauptfunktion bzw Programmstart
%*****************************************************
% PST-Projekt/Hauptprogramm
% Teamname : Teamname (Gruppe 22)
% Versionsnummer   : x.x (Datum)
% erstellt am      : 12.12.2017
% erstellt durch   : Gruppe 22
% letz. Änderung   : 12.12.2017
% letz. Bearbeiter : Sebastian Neumeier
% Programmierspr.  : Matlab
%*****************************************************

% First Start
%ii = 1;


% TEST 
% Verbindung aufbauen bzw. Instanz des virtuellen Roboters erzeugen 
% mit 9 zufälligen Würfeln.
vRob = VirtualRobot('random');

%Startet den Roboter und fährt ihn zum ersten Würfel
vRob.moveAngles([1 2 3 4],[9.2 51 83.8 -45],-1);

%Wartet bis der Roboterarm am ersten Würfel angekommen ist
vRob.waitFor();

%% Farbe des Würfels scannen und interpretieren

%Scannt die Farbe des Würfels und speichert den Ausgabevektor in 'v'
[v] = vRob.getSensorColor();

%Interpretiert den Vektor aus 'v'.
[f] = interpretSensorColour(v)


end