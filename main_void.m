function [f] = main_void(~)
% Hauptfunktion bzw Programmstart
%*****************************************************
% PST-Projekt/Hauptprogramm
% Teamname : Teamname (Gruppe 22)
% Versionsnummer   : x.x (Datum)
% erstellt am      : 12.12.2017
% erstellt durch   : Gruppe 22
% letz. �nderung   : 12.12.2017
% letz. Bearbeiter : Sebastian Neumeier
% Programmierspr.  : Matlab
%*****************************************************

% First Start
%ii = 1;


% TEST 
% Verbindung aufbauen bzw. Instanz des virtuellen Roboters erzeugen 
% mit 9 zuf�lligen W�rfeln.
vRob = VirtualRobot('random');

%Startet den Roboter und f�hrt ihn zum ersten W�rfel
vRob.moveAngles([1 2 3 4],[9.2 51 83.8 -45],-1);

%Wartet bis der Roboterarm am ersten W�rfel angekommen ist
vRob.waitFor();

%% Farbe des W�rfels scannen und interpretieren

%Scannt die Farbe des W�rfels und speichert den Ausgabevektor in 'v'
[v] = vRob.getSensorColor();

%Interpretiert den Vektor aus 'v'.
[f] = interpretSensorColour(v)


end