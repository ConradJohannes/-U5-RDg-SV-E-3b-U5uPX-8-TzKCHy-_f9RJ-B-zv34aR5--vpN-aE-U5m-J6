function Pattern_save_all(A,Name)
%% Diese Funktion greift auf 'Pattern_data_save' und 'Pattern_Link_check' oder 'Pattern-save'zu
%% Sowohl das Muster als auch die dazu gehörigen Daten werden gespeichert.
global Fehler
Pattern_data_save(Name)
if Pattern_Link_check(A,Name)==0
    Pattern_save(A,Name)
end 
end