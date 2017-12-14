function y=Pattern_save(A,Name)
%% Diese Funktion Speichert ein Muster 'A' mit dem Namen 'Name' in die XML-Datei Pattern.xml.
global Fehler
m=Pattern_check(Name);
if m==1
    Fehler=1;
%%Falls der Name: 'Name' schon vergeben ist, wird die Funktion abgebrochen.
    return
end
docNode = xmlread('C:/Users/Johan/Documents/MATLAB/Pattern.xml');
[Zeilen, Spalten]=size(A);
Pattern=docNode.getDocumentElement;
%%Ein neuer Knoten 'Name' wird erstellt.
New_Pattern = docNode.createElement(Name);     
row_node=New_Pattern;
%%Für jede Zeile wird ein Unterknoten von 'Name' erstllt: 'Row_m'
for ii=1 : Zeilen
    Name=['Row_',num2str(ii)];
    row_node = docNode.createElement(Name);
    New_Pattern.appendChild(row_node);
%%Für jede Spalte wird ein Unterknoten von 'Row_x' erstellt: 'Line_n'
    for zz=1 : Spalten
        Name=['Line_',num2str(zz)];
        line_node = docNode.createElement(Name);
        name_text = docNode.createTextNode(num2str(A(ii,zz)));
        line_node.appendChild(name_text);
        row_node.appendChild(line_node);
    end
end
%%Der Knoten 'Name' mit seinen Unterknoten wird an das Dokument angefügt 
%%Falls dies schon zu Beginn geschiet wird ein self-closing Node erstellt!
docNode.getDocumentElement.appendChild(New_Pattern);  
%%Die ergänzte XML wird abgespeichert
xmlFileName = ['Pattern.xml'];
xmlwrite(xmlFileName,docNode);
end

