%Haertetest script für die Farberkennung

durchlaeufe=100000;
fehler=0;

for ii=1:durchlaeufe
    [v, colorName] = textColorOut();
    [f]=interpretSensorColour(v);
    switch f
        case 1
            zz='red';
            if strcmp(colorName,zz) == 0
                fehler=fehler+1;
                
            end
                
            
        case 2
            zz='green';
            if strcmp(colorName,zz)== 0
                fehler=fehler+1;
            end
            
        case 3
            zz='blue';
            if strcmp(colorName,zz)== 0
                fehler=fehler+1;
            end
            
        case 0
            zz='black';
            if strcmp(colorName,zz)== 0
                fehler=fehler+1;
            end
            
    end
end

disp(['Bei ', num2str(durchlaeufe) ,' Durchläufen sind ' ,num2str(fehler),' Fehler aufgetreten.'])